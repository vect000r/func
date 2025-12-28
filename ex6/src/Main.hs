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


-- Helper functions
isSorted:: [Int] -> (Int -> Int -> Bool) -> Bool
isSorted [] _ = True
isSorted [_] _ = True
isSorted (x:y:rest) f = f x y && isSorted (y:rest) f

sortOrder :: Int -> Int -> Bool
sortOrder x y = x > y

-- Endpoint handlers
isSortedHandler :: ActionM ()
isSortedhandler = do 
    req <- jsonData :: ActionM IsSortedRequest 
    let inputList = nums req
    let sorted = isSorted inpuList sortOrder
    json $ object 
        [
            "input" .= inputList,
            "isSorted" .= sorted
        ]

-- Main
main :: IO ()
main = scotty 8080 $ do
    middleware simpleCors

    post "/is-sorted" isSortedHandler