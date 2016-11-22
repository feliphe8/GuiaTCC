{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module Portal where

import Foundation
import Yesod
import Yesod.Static

getPortalR :: Handler Html
getPortalR = defaultLayout $ do
    setTitle "Guia TCC"
    addStylesheetRemote "http://fonts.googleapis.com/icon?family=Material+Icons"
    addStylesheetRemote "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"
    addStylesheet $ StaticR css_custom_css
    toWidgetHead[hamlet|
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
    |]
    [whamlet|
        
        
        <h1>Portal
        
        
    |]