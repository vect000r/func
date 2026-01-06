{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Aeson ( FromJSON, ToJSON, object, (.=), toJSON)
import GHC.Generics
import Network.Wai.Middleware.Cors
import Control.Monad.IO.Class (liftIO)
import Data.Monoid (Sum(..), Product(..))
import Data.Foldable (foldMap)
import qualified Data.Text.Lazy as TL
import qualified Data.Text as T
import Text.Read (readMaybe)


-- Response types
data OperationResult = OperationResult
  { result :: Int
  } deriving (Generic, Show)

instance ToJSON OperationResult

data ConcatResult = ConcatResult
  { concatenated :: [Int]
  } deriving (Generic, Show)

instance ToJSON ConcatResult


-- Helper functions
parseIntList :: String -> Maybe [Int]
parseIntList str = mapM readMaybe (splitOn ',' str)
  where
    splitOn :: Char -> String -> [String]
    splitOn _ [] = []
    splitOn delim s = case break (== delim) s of
      (before, []) -> [before]
      (before, _:after) -> before : splitOn delim after


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

concatHandler :: ActionM ()
concatHandler = do
  list1Str <- param "list1" :: ActionM String
  list2Str <- param "list2" :: ActionM String
  list3Str <- param "list3" :: ActionM String
  
  let list1 = maybe [] id (parseIntList list1Str)
      list2 = maybe [] id (parseIntList list2Str)
      list3 = maybe [] id (parseIntList list3Str)
  
  let concatenatedList = list1 <> list2 <> list3

  json $ ConcatResult concatenatedList


main :: IO ()
main = scotty 3000 $ do 
  middleware simpleCors 

  get "/3.0" operationHandler  
  get "/3.5" concatHandler