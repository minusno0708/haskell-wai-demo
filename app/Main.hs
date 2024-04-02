{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.Wai.Handler.Warp
import Servant

main :: IO ()
main = do
    let port = 8080
    putStrLn $ "Listening on http://localhost:" ++ show port
    run port app

type TodoApi = 
    Get '[JSON] String :<|>
    "api" :> "tasks" :> Get '[JSON] String

indexHandler :: Handler String
indexHandler = return "Hello, Warp Api"

getHandler :: Handler String
getHandler = return "Get Tasks"

server :: Server TodoApi
server = indexHandler :<|> getHandler

api :: Proxy TodoApi
api = Proxy

app :: Application
app = serve api server
