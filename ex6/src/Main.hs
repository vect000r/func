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
  { list :: [Int]
  , element :: Int
  } deriving (Show, Generic)

instance FromJSON SetHeadRequest
instance ToJSON SetHeadRequest



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
  let newList = element req : list req
  json $ object
    [ 
            "input" .= [toJSON (list req), toJSON (element req)],       
            "setHead result" .= newList
    ]

-- Main
main :: IO ()
main = scotty 8080 $ do
    middleware simpleCors

    post "/is-sorted" isSortedHandler
    post "/sum-three" sumThreeHandler
    post "/set-head" setHeadHandler

    