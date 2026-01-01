{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON, object, (.=), toJSON)
import GHC.Generics
import Network.Wai.Middleware.Cors


-- Request types
data IsSortedRequest = IsSortedRequest
    { nums :: [Int]
    } deriving (Show, Generic)

instance FromJSON IsSortedRequest
instance ToJSON IsSortedRequest

data SumThreeRequest = SumThreeRequest
  { list1 :: [Int]
  , list2 :: [Int]
  , list3 :: [Int]
  } deriving (Show, Generic)

instance FromJSON SumThreeRequest
instance ToJSON SumThreeRequest

data SetHeadRequest = SetHeadRequest 
  { listSetHead :: [Int]
  , element :: Int
  } deriving (Show, Generic)

instance FromJSON SetHeadRequest
instance ToJSON SetHeadRequest

data AppendRequest = AppendRequest 
  { listAppend :: [Int]
  , index :: Int
  , elementAppend :: Int
  } deriving (Show, Generic)

instance FromJSON AppendRequest
instance ToJSON AppendRequest


-- Helper functions
isSorted:: [Int] -> (Int -> Int -> Bool) -> Bool
isSorted [] _ = True
isSorted [_] _ = True
isSorted (x:y:rest) f = f x y && isSorted (y:rest) f

sortOrder :: Int -> Int -> Bool
sortOrder x y = x > y

addLists :: [Int] -> [Int] -> [Int]
addLists = zipWith(+)

-- Endpoint handlers
isSortedHandler :: ActionM ()
isSortedHandler = do 
    req <- jsonData :: ActionM IsSortedRequest 
    let inputList = nums req
    let sorted = isSorted inputList sortOrder
    json $ object 
        [
            "input" .= inputList,
            "isSorted" .= sorted
        ]

sumThreeHandler :: ActionM ()
sumThreeHandler = do 
    req <- jsonData :: ActionM SumThreeRequest
    let result = addLists (addLists (list1 req) (list2 req)) (list3 req)
    json $ object
        [ 
            "input" .= [list1 req, list2 req, list3 req],       
            "sum" .= result
        ]


setHeadHandler :: ActionM ()
setHeadHandler = do
  req <- jsonData :: ActionM SetHeadRequest
  let newList = element req : listSetHead req
  json $ object
    [ 
            "input" .= [toJSON (listSetHead req), toJSON (element req)],       
            "setHead result" .= newList
    ]

appendHandler :: ActionM ()
appendHandler = do
  req <- jsonData :: ActionM AppendRequest
  let inputList = listAppend req
  let idx = index req
  let elem = elementAppend req
  let (seg1, seg2) = splitAt idx inputList
  let newList = seg1 ++ [elem] ++ seg2
  json $ object
    [ 
            "input" .= [toJSON inputList, toJSON idx, toJSON elem],       
            "append result" .= newList
    ]

-- Main
main :: IO ()
main = scotty 8080 $ do
    middleware simpleCors

    post "/is-sorted" isSortedHandler
    post "/sum-three" sumThreeHandler
    post "/set-head" setHeadHandler
    post "/append" appendHandler

