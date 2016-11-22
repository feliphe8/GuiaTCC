{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.TCC where

import Foundation
import Yesod
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql

formTCC :: Form TCC
formTCC = renderDivs $ TCC
    <$> areq textField "Titulo do TCC" Nothing
    <*> areq textField "Integrantes"   Nothing
    <*> areq textField "Curso"         Nothing
    <*> areq textField "Orientador"    Nothing
    <*> areq fileField "Arquivo"       Nothing

getTccR :: Handler Html
getTccR = do 
            (widget, enctype) <- generateFormPost formTCC
            defaultLayout [whamlet|
             <form method=post action=@{TccR} enctype=#{enctype}>
                 ^{widget}
                 <input type="submit" value="Cadastrar">
         |]

postTccR :: Handler Html
postTccR = do
            ((result, _), _) <- runFormPost formTCC
            case result of
                FormSuccess tcc -> do
                    tcid <- runDB $ insert tcc
                    defaultLayout [whamlet|
                        <h1> Cadastrado com sucesso: Id do TCC #{fromSqlKey tcid}!
                        <a href=@{TccR}> Voltar para Cadastro
                        <a href=@{HomeR}> Voltar para Página Inicial
                    |]
                _ -> redirect HomeR

getListTccR :: Handler Html
getListTccR = do
            tccs <- runDB $ selectList [] [Asc TCCId]
            defaultLayout $ do
                [whamlet|
                    <table>
                        <tr> 
                            <td> id  
                            <td> titulo 
                            <td> arquivo
                            <td> curso
                    <a href=@{HomeR}> Voltar
                |]
                
                
postDelTccR :: TCCId -> Handler Html
postDelTccR tcid = do 
                runDB $ delete tcid
                redirect ListTccR
