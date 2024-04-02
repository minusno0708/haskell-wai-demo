{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types

main :: IO ()
main = do
    let port = 8080
    putStrLn $ "Listening on http://localhost:" ++ show port
    run port app

app :: Application
app req respond = do
    case pathInfo req of
            [] -> indexHandler req respond
            ["api", "get"] -> getHandler req respond
            _ -> respond $ responseLBS
                status404
                [("Content-Type", "application/json")]
                "{\"message\":\"Not Found\"}"

indexHandler :: Application
indexHandler _ respond = respond $ responseLBS
    status200
    [("Content-Type", "application/json")]
    "{\"message\":\"Hello, Warp Api\"}"

getHandler :: Application
getHandler _ respond = respond $ responseLBS
    status200
    [("Content-Type", "application/json")]
    "{\"message\":\"Get Endpoint\"}"
