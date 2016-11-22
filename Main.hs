{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
import Application () -- for YesodDispatch instance
import Foundation
import Yesod
import Yesod.Static
import Control.Monad.Logger (runStdoutLoggingT)
import Database.Persist.Postgresql

connStr :: ConnectionString
connStr = "dbname=dfssd69v30a4j7 host=ec2-23-23-208-32.compute-1.amazonaws.com user=wcvqrcfcjcirwm password=ec2xmNo9Vq-5TrT24iRbMsSgct port=5432"


main :: IO ()
main = runStdoutLoggingT $ withPostgresqlPool connStr 10 $ \pool -> liftIO $ do 
       runSqlPersistMPool (runMigration migrateAll) pool
       static@(Static settings) <- static "static"
       warp 8080 (App static pool) 
