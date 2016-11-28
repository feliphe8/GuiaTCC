{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handlers.Curso where

import Foundation
import Yesod
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql

formCurso :: Form Curso
formCurso = renderDivs $ Curso <$>
            areq textField "Nome do curso:" Nothing <*>
            areq textField FieldSettings{fsId=Just "hident2",
                           fsLabel="Sigla",
                           fsTooltip= Nothing,
                           fsName= Nothing,
                           fsAttrs=[("maxlength","3")]} Nothing
                           
getCadastroCursoR :: Handler Html
getCadastroCursoR = do
             (widget, enctype) <- generateFormPost formCurso
             defaultLayout $ widgetForm CadastroCursoR enctype widget "Curso"

postCadastroCursoR :: Handler Html
postCadastroCursoR = do
                ((result, _), _) <- runFormPost formCurso
                case result of
                    FormSuccess cadCurso -> do
                       cursoid <- runDB $ insert cadCurso
                       defaultLayout [whamlet|
                           <h1> #{fromSqlKey cursoid} Inserido com sucesso. 
                       |]
                    _ -> redirect CadastroCursoR