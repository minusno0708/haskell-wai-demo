{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types

main :: IO ()
main = do
    let port = 8080
    putStrLn $ "Listening on port " ++ show port
    run port app

app :: Application
app _ respond = respond $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    "Hello, Web!"
