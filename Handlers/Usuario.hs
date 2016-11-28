{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handlers.Usuario where

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



formLogin:: Form Usuario
formLogin = renderDivs $ Usuario
    <$> areq emailField "Email"     Nothing
    <*> areq passwordField "Senha"  Nothing
    <*> areq hiddenField ""         Nothing
    
getLoginUsuarioR :: Handler Html
getLoginUsuarioR = do
    (widget,enctype)<- generateFormPost formUser
    defaultLayout $ do
    setTitle "Painel Admin"
    [whamlet|
    <div id="container">
        <section class="content container">
            <h1><i class="large material-icons">settings</i>Painel Admin</h1>
            <form action=@{LoginUsuarioR} method=post enctype=#{enctype}>
                ^{widget}
                <input type="submit" value="Entrar">
            <a href=@{HomeR}>Voltar ao Site</a>
        
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script type="text/javascript" src=@{StaticR js_custom_js}></script>
    |]

getUsuarioR :: Handler Html
getUsuarioR = do
    (widget,enctype)<- generateFormPost formUser
    defaultLayout $ do
    setTitle "Painel Admin"
    [whamlet|
    <ul>
        <li><a href=@{TccR}>Cadastrar</a>
        <li><a href=@{ListTccR}>Listar</a>
        <li><a href=@{UsuarioR}>Cadastrar Usuario</a>
        <li><a href=@{LogoffR}>Sair</a>
        
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
        
postLoginUsuarioR :: Handler Html
postLoginUsuarioR = do
    ((resultado,_),_)<- runFormPost formUser
    case resultado of
        FormSuccess user -> do
            usuario <- runDB $ selectFirst [UsuarioEmail ==. (usuarioEmail user),
                                    UsuarioSenha ==. (usuarioSenha user)] []
            case usuario of
                Nothing -> redirect LoginUsuarioR
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