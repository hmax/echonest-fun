module EchonestResponse where


import Data.Aeson
import qualified Data.Text as T
import Control.Applicative
import Control.Monad


data EchonestResponse = EchonestResponse
     { status :: EchonestResponseStatus
     } deriving Show

data EchonestResponseStatus = EchonestResponseStatus
        { version :: T.Text,
          code :: Int,
          message :: T.Text
        } deriving Show

instance FromJSON EchonestResponseStatus where
    parseJSON (Object v) = EchonestResponseStatus <$> ((v .: "response") >>= (.: "status") >>= (.: "version"))
                            <*>  ((v .: "response") >>= (.: "status") >>= (.: "code"))
                        <*>  ((v .: "response") >>= (.: "status") >>= (.: "message"))
    -- A non-Object value is of the wrong type, so fail.
    parseJSON _          = mzero
