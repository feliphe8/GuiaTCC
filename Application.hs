{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}
{-# LANGUAGE QuasiQuotes       #-}
module Application where

import Foundation
import Yesod
import Index
import Biblioteca
import Portal
import Sobre
import Handler.Usuario
import Handler.Curso
import Handler.TipoUser
import Handler.TCC

mkYesodDispatch "App" resourcesApp
