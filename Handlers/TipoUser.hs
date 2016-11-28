{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handlers.TipoUser where

import Foundation
import Yesod
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql


formTipoUser :: Form TipoUser
formTipoUser = renderDivs $ TipoUser <$>
            areq textField "Tipo de usuario:" Nothing
                           
getCadastroTipoR :: Handler Html
getCadastroTipoR = do
             (widget, enctype) <- generateFormPost formTipoUser
             defaultLayout $ widgetForm CadastroTipoR enctype widget "Tipo de usuario"

postCadastroTipoR :: Handler Html
postCadastroTipoR = do
                ((result, _), _) <- runFormPost formTipoUser
                case result of
                    FormSuccess cadTipo -> do
                       tipouserid <- runDB $ insert cadTipo
                       defaultLayout [whamlet|
                           <h1> #{fromSqlKey tipouserid} Inserido com sucesso. 
                       |]
                    _ -> redirect CadastroTipoR
                    

postDelTipoR :: TipoUserId -> Handler Html
postDelTipoR tipoid = do 
                runDB $ delete tipoid
                redirect CadastroTipoR