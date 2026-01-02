{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON, object, (.=), toJSON)
import GHC.Generics
import Network.Wai.Middleware.Cors
import System.Random
import Control.Monad.IO.Class (liftIO)


-- Response types
data RandomIntResponse = RandomIntResponse
    { value :: Int
    } deriving (Show, Generic)

instance ToJSON RandomIntResponse


-- Helper functions
randomInt :: IO Int
randomInt = randomRIO (0, maxBound :: Int)


-- Endpoint handlers
randomIntHandler :: ActionM ()
randomIntHandler = do
    val <- liftIO randomInt
    json $ RandomIntResponse val

-- Main
main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors

    get "/3.0" randomIntHandler