module Main where

import Data.Aeson (decode)
import Network.HTTP.Conduit
import Network

import EchonestResponse

api_key = "FILDTEOIK2HBORODV"

main :: IO ()
main = withSocketsDo $ do
     request' <- parseUrl $ "http://developer.echonest.com/api/v4/artist/profile?name=weezer" ++ "&api_key=" ++ api_key
     let request = request' { checkStatus = \_ _ _-> Nothing }
     res <- withManager $ httpLbs request
     let body = responseBody res
     let response_status = decode body :: Maybe EchonestResponseStatus
     print response_status
