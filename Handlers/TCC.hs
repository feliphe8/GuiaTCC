{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
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
    <*> (fmap ((Arquivo "") . Just) $ fileAFormReq "Required file")
    
cursos = do
    entidades <- runDB $ selectList [] [Asc CursoNomeCurso]
    optionsPairs $ fmap (\ent -> (cursoSiglaCurso $ entityVal ent, entityKey ent)) entidades

getTccR :: Handler Html
getTccR = do
    (widget, enctype) <- generateFormPost formTCC
    defaultLayout $ widgetForm TccR enctype widget "Cadastre o TCC"
    
postTccR :: Handler Html
postTccR = do
            ((res, form), enctype) <- runFormPost formTCC
            case res of
                FormSuccess tcc -> (writeToServer $ arq $ tCCNomeArquivo tcc) >> (runDB $ insert tcc) >> redirect TccR
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
                            <td> integrantes
                            <td> cursoid
                            <td> orientador
                            <td> arquivo
                            <td>
                        $forall Entity tcid tcc <- tccs
                            <tr>
                                <form action=@{DelTccR tcid} method=post>
                                    <td> #{fromSqlKey      tcid}  
                                    <td> #{tccTitulo        tcc} 
                                    <td> #{tccIntegrantes   tcc} 
                                    <td> #{tccCursoid       tcc}
                                    <td> #{tccOrientador    tcc}
                                    <td> #{tccNomearquivo   tcc}
                                    <td> <input type="submit">
                    <a href=@{HomeR}> Voltar
                |]
                
                
postDelTccR :: TCCId -> Handler Html
postDelTccR tcid = do 
                runDB $ delete tcid
                redirect ListTccR
