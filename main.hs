import Data.Conduit.Binary (sinkFile)
import Network.HTTP.Conduit
import qualified Data.Conduit as C
import Network

api_key = "FILDTEOIK2HBORODV"

main :: IO ()
main = withSocketsDo $ do
     request' <- parseUrl $ "http://developer.echonest.com/api/v4/artist/profile?name=weezer" ++ "&api_key=" ++ api_key
     let request = request' { checkStatus = \_ _ _-> Nothing }
     res <- withManager $ httpLbs request
     print res
