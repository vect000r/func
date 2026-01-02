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

data RandomDoubleResponse = RandomDoubleResponse
    { valueDouble :: Double
    } deriving (Show, Generic)

instance ToJSON RandomDoubleResponse

-- Helper functions
randomInt :: IO Int
randomInt = randomRIO (0, maxBound :: Int)

randomDouble :: IO Double
randomDouble = do
    value <- randomRIO (0.0, 1.0 :: Double)
    if value == 1.0
        then randomDouble
        else return value


-- Endpoint handlers
randomIntHandler :: ActionM ()
randomIntHandler = do
    val <- liftIO randomInt
    json $ RandomIntResponse val

randomDoubleHandler :: ActionM ()
randomDoubleHandler = do
    val <- liftIO randomDouble
    json $ RandomDoubleResponse val

-- Main
main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors

    get "/3.0" randomIntHandler
    get "/3.5" randomDoubleHandler