{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON, object, (.=), toJSON)
import GHC.Generics
import Network.Wai.Middleware.Cors
import Control.Monad.IO.Class (liftIO)
import qualified Data.Text.Lazy as TL
import Text.Read (readMaybe)

-- Response types
data NumberResult = NumberResult
    { message :: String
    , isOdd :: Bool
    } deriving (Generic, Show)

instance ToJSON NumberResult

data SumResult = SumResult
    { sum :: Int
    } deriving (Generic, Show)

instance ToJSON SumResult

data PalindromeResult = PalindromeResult
    { text :: String
    , isPalindrome :: Bool
    } deriving (Generic, Show)

instance ToJSON PalindromeResult

-- Helper functions
isOddNumber :: Int -> Bool
isOddNumber n = n `mod` 2 /= 0

sumOfDigits :: Int -> Int
sumOfDigits n = sum [read [c] :: Int | c <- show (abs n)]

isPalindromeStr :: String -> Bool
isPalindromeStr s = cleaned == reverse cleaned
    where cleaned = filter (/= ' ') (map toLower s)
        where toLower c = if c >= 'A' && c <= 'Z' then toEnum (fromEnum c + 32) else c

-- Endpoint handlers
oddEvenHandler :: ActionM ()
oddEvenHandler = do
    num <- param "number" :: ActionM Int
    let odd = isOddNumber num
    json $ NumberResult (show num ++ " is " ++ (if odd then "odd" else "even")) odd

digitSumHandler :: ActionM ()
digitSumHandler = do
    num <- param "number" :: ActionM Int
    let digitSum = sumOfDigits num
    json $ SumResult digitSum

palindromeHandler :: ActionM ()
palindromeHandler = do
    input <- param "text" :: ActionM String
    let isPalin = isPalindromeStr input
    json $ PalindromeResult input isPalin

main :: IO ()
main = scotty 3000 $ do
    middleware simpleCors
    
    get "/odd-even" oddEvenHandler
    get "/digit-sum" digitSumHandler
    get "/palindrome" palindromeHandler