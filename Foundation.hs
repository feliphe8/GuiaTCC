{-# LANGUAGE OverloadedStrings, TypeFamilies, QuasiQuotes,
             TemplateHaskell, GADTs, FlexibleContexts,
             MultiParamTypeClasses, DeriveDataTypeable, EmptyDataDecls,
             GeneralizedNewtypeDeriving, ViewPatterns, FlexibleInstances #-}
module Foundation where

import Yesod
import Yesod.Static
import Yesod.Auth
import Data.Text
import Pdf
import System.FilePath
import System.Directory
import qualified Data.Text as T
import Database.Persist.Postgresql
    ( ConnectionPool, SqlBackend, runSqlPool)

staticFiles "static"

data App = App {getStatic :: Static, connPool :: ConnectionPool }

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Usuario
    email       Text
    senha       Text
    tipouserid  TipoUserId
    deriving Show
    
TipoUser
    tipo        Text
    deriving    Show
    
TCC
    titulo      Text
    integrantes Text
    cursoid     CursoId
    orientador  Text
    descricao   Text
    deriving Show
    
Curso
    nomeCurso   Text
    siglaCurso  Text sqltype=varchar(3)
    deriving Show
|]
    
mkYesodData "App" $(parseRoutesFile "routes")
    
type Form a = Html -> MForm Handler (FormResult a, Widget)

instance Yesod App where
    authRoute _ = Just LoginUsuarioR
    
    isAuthorized LoginUsuarioR _ = return Authorized
    isAuthorized HomeR _ = return Authorized
    isAuthorized UsuarioR _ = return Authorized
    isAuthorized BibliotecaR _ = return Authorized
    isAuthorized PortalR _ = return Authorized
    isAuthorized SobreR _ = return Authorized
    isAuthorized TccR _ = return Authorized
    isAuthorized ListTccR _ = return Authorized
    isAuthorized _ _ = return Authorized
    
isComum :: Handler AuthResult
isComum = do
   msu <- lookupSession "_ID"
   case msu of
       Just _ -> return Authorized
       Nothing -> return AuthenticationRequired

isAdmin :: Handler AuthResult
isAdmin = do
    msu <- lookupSession "_ADMIN"
    case msu of
        Just "admin" -> return Authorized
        Nothing -> return AuthenticationRequired
       
instance YesodPersist App where
   type YesodPersistBackend App = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

widgetForm :: Route App -> Enctype -> Widget -> Text -> Widget
widgetForm x enctype widget y = $(whamletFile "templates/form.hamlet")


-- UPLOAD ARQUIVO PDF
-- uploadDirectory :: FilePath
-- uploadDirectory = "static"

-- writeToServer :: Maybe FileInfo -> Handler FilePath 
-- writeToServer Nothing = undefined
-- writeToServer (Just file) = do
--     let filename = T.unpack $ fileName file
--         path = imageFilePath filename
--     liftIO $ fileMove file path 
--     return filename

-- imageFilePath :: String -> FilePath
-- imageFilePath f = uploadDirectory </> f