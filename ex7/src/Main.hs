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

data PairsTripleResponse = PairsTripleResponse
    { pairIntDouble :: (Int, Double)
    , pairDoubleInt :: (Double, Int)
    , triple :: (Double, Double, Double)
    } deriving (Show, Generic)

instance ToJSON PairsTripleResponse

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

pairsTripleHandler :: ActionM ()
pairsTripleHandler = do
    intVal <- liftIO randomInt
    doubleVal1 <- liftIO randomDouble
    doubleVal2 <- liftIO randomDouble
    doubleVal3 <- liftIO randomDouble
    
    let pair1 = (intVal, doubleVal1)
    let pair2 = (doubleVal2, intVal)
    let tripleVal = (doubleVal1, doubleVal2, doubleVal3)
    
    json $ PairsTripleResponse pair1 pair2 tripleVal


-- Main
main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors

    get "/3.0" randomIntHandler
    get "/3.5" randomDoubleHandler
    get "/4.0" pairsTripleHandler