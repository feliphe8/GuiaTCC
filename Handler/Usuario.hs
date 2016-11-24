{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Usuario where

import Foundation
import Yesod
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql

formUser :: Form Usuario
formUser = renderDivs $ Usuario
    <$> areq emailField    "Email"    Nothing
    <*> areq passwordField "Senha"    Nothing
    <*> areq (selectField usuario) "Tipo de usuário" Nothing
    
usuario = do
    entidades <- runDB $ selectList [] [Asc TipoUserTipo] 
    optionsPairs $ fmap (\ent -> (tipoUserTipo $ entityVal ent, entityKey ent)) entidades
    
getLoginR :: Handler Html
getLoginR = do
    (widget,enctype)<- generateFormPost formUser
    defaultLayout $ do
        [whamlet|
            <form action=@{LoginR} method=post enctype=#{enctype}>
                ^{widget}
                <input type="submit" value="Logar">
        |]

getUsuarioR :: Handler Html
getUsuarioR = do
    (widget,enctype)<- generateFormPost formUser
    defaultLayout $ do
        [whamlet|
            <h1> Cadastro de Usuário
            <form action=@{UsuarioR} method=post enctype=#{enctype}>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postUsuarioR :: Handler Html
postUsuarioR = do
    ((resultado,_),_)<- runFormPost formUser
    case resultado of
        FormSuccess user -> do
            uid <- runDB $ insert user
            defaultLayout [whamlet|
                Usuário cadastrado com e-mail #{usuarioEmail user}
            |]
        _ -> redirect HomeR
        
postLoginR :: Handler Html
postLoginR = do
    ((resultado,_),_)<- runFormPost formUser
    case resultado of
        FormSuccess user -> do
            usuario <- runDB $ selectFirst [UsuarioEmail ==. (usuarioEmail user),
                                    UsuarioSenha ==. (usuarioSenha user)] []
            case usuario of
                Nothing -> redirect LoginR
                Just (Entity uid _) -> do
                    setSession "_ID" (pack $ show uid)
                    redirect PainelR
        _ -> redirect HomeR
        
getPainelR :: Handler Html
getPainelR = do
    userId <- lookupSession "_ID"
    case userId of
       Just str -> do
           usuario <- runDB $ get404 (read (unpack str))
           defaultLayout [whamlet|
               <h1> Logadoooo com #{usuarioEmail usuario}!!!! 
           |]
       Nothing -> defaultLayout [whamlet|
        <h1> Não Logadoooo!!!! 
    |]
    
postLogoffR :: Handler Html
postLogoffR = do
    deleteSession "_ID"
    redirect HomeR