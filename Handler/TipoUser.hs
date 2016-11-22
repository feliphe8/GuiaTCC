{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Handler.TipoUser where

import Foundation
import Yesod
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql