{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.Curso where

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
                           
getCadastroCursR :: Handler Html
getCadastroCursR = do
             (widget, enctype) <- generateFormPost formCurso
             defaultLayout $ widgetForm CadastroCursR enctype widget "Curso"

postCadastroCursR :: Handler Html
postCadastroCursR = do
                ((result, _), _) <- runFormPost formCurso
                case result of
                    FormSuccess cadCurso -> do
                       runDB $ insert cadCurso
                       defaultLayout [whamlet|
                           <h1> #{nomeCurso cadCurso} Inserido com sucesso. 
                       |]
                    _ -> redirect CadastroCursR