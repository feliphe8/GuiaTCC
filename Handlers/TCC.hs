{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
module Handlers.TCC where

import Foundation
import Yesod
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql
import Pdf

formTCC :: Form TCC
formTCC = renderDivs $ TCC
    <$> areq textField "Titulo do TCC"     Nothing
    <*> areq textField "Integrantes"       Nothing
    <*> areq (selectField cursos) "Cursos" Nothing
    <*> areq textField "Orientador"        Nothing
    <*> areq textField "Descrição"        Nothing

cursos = do
    entidades <- runDB $ selectList [] [Asc CursoNomeCurso]
    optionsPairs $ fmap (\ent -> (cursoSiglaCurso $ entityVal ent, entityKey ent)) entidades

getTccR :: Handler Html
getTccR = do
    (widget, enctype) <- generateFormPost formTCC
    defaultLayout $ do
    setTitle "Painel Admin"
    [whamlet|
    <ul>
        <li><a href=@{TccR}>Cadastrar</a>
        <li><a href=@{ListTccR}>Listar</a>
        <li><a href=@{UsuarioR}>Cadastrar Usuario</a>
        <li><a href=@{LogoffR}>Sair</a>
    |]
    widgetForm TccR enctype widget "Cadastre o TCC"
    
postTccR :: Handler Html
postTccR = do
            ((res, form), enctype) <- runFormPost formTCC
            case res of
                FormSuccess tcc -> (runDB $ insert tcc) >> redirect TccR
                _ -> redirect HomeR

getListTccR :: Handler Html
getListTccR = do
            tccs <- runDB $ selectList [] [Asc TCCId]
            defaultLayout $ do
            setTitle "Painel Admin"
            [whamlet|
            <ul>
                <li><a href=@{TccR}>Cadastrar</a>
                <li><a href=@{ListTccR}>Listar</a>
                <li><a href=@{UsuarioR}>Cadastrar Usuario</a>
                <li><a href=@{LogoffR}>Sair</a>
            <table>
                <tr> 
                    <td> Id 
                    <td> Titulo 
                    <td> Integrantes
                    <td> Curso
                    <td> Orientador
                    <td> Descrição
                    <td>
                $forall Entity tcid tcc <- tccs
                    <tr>
                        <form action=@{DelTccR tcid} method=post> 
                            <td>#{fromSqlKey      tcid}  
                            <td>#{tCCTitulo        tcc}
                            <td>#{tCCIntegrantes   tcc}
                            <td>#{show $ tCCCursoid       tcc}
                            <td>#{tCCOrientador    tcc}
                            <td>#{tCCDescricao        tcc}
                            <td> <input type="submit" value="Excluir">
            |]
                
                
postDelTccR :: TCCId -> Handler Html
postDelTccR tcid = do 
                runDB $ delete tcid
                redirect ListTccR
