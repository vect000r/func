{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Aeson ( FromJSON, ToJSON, object, (.=), toJSON)
import GHC.Generics
import Network.Wai.Middleware.Cors
import System.Random
import Control.Monad.IO.Class (liftIO)

-- Response types
data OperationResult = OperationResult
  { result :: Int
  } deriving (Generic, Show)

instance ToJSON OperationResult

-- Endpoint handlers
operationHandler :: ActionM ()
operationHandler = do
  a <- param "a" :: ActionM Int
  b <- param "b" :: ActionM Int
  op <- param "op" :: ActionM String
  
  let operation = case op of
        "add" -> (+)
        "sub" -> (-)
        _ -> (+)
  
  let maybeA = Just a :: Maybe Int
      maybeB = Just b :: Maybe Int
      maybeResult = operation <$> maybeA <*> maybeB
  
  case maybeResult of
    Just r -> json $ OperationResult r
    Nothing -> json $ OperationResult 0




main :: IO ()
main = scotty 3000 $ do 
  middleware simpleCors 

  get "/3.0" operationHandler  
