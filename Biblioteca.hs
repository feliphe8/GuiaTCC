{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module Biblioteca where

import Foundation
import Yesod
import Yesod.Static
import Data.Text
import Control.Applicative
import Database.Persist.Postgresql

getBibliotecaR :: Handler Html
getBibliotecaR = do
    tccs <- runDB $ selectList [] [Asc TCCId]
    defaultLayout $ do
    setTitle "Guia TCC"
    addStylesheetRemote "https://fonts.googleapis.com/icon?family=Material+Icons"
    addStylesheetRemote "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"
    addStylesheet $ StaticR css_custom_css
    toWidgetHead[hamlet|
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="shortcut icon" href=@{StaticR img_guiatccicone_png} >
    |]
    [whamlet|
    <div id="container">
    
        <nav>
          <div class="nav-wrapper grey lighten-3">
            <a id="logotipo" href=@{HomeR} class="left brand-logo"><img width="220px" class="responsive-img" src=@{StaticR img_guiatcc2_png} alt=""></a>
            <ul id="menu nav-mobile" class="right hide-on-med-and-down">
              <li><a class="blue-text text-darken-1" href=@{PortalR}><i class="material-icons left">language</i>Portal TCC</a></li>
              <li class="active"><a class="red-text text-darken-1" href=@{BibliotecaR}><i class="material-icons left">book</i>Biblioteca TCC</a></li>
              <li><a class="grey-text text-darken-2" href=@{SobreR}><i class="material-icons left">info</i>Sobre</a></li>

        <section class="content">
          <h3 class="red-text center d-position-sobre"><i class="medium material-icons">book</i>Biblioteca TCC</h3>
          <div class="container block">
            <p class="paragrafo">
              Nossa biblioteca TCC dispõe de todos os trabalhos de conclusão de curso disponíveis em nosso banco de dados, eles estão divididos pelos cursos disponíveis na Faculdade, fique a vontade e consulte o que for de sua relevância.
  
          $forall Entity tcid tcc <- tccs
            <div class="row container">
              <div class="col s12">
                <div class="card-panel">
                  <h3>#{tCCTitulo        tcc}</h3>
                  <ul>
                    <li><span class="text-bolder">Integrantes</span>: #{tCCIntegrantes   tcc} </li>
                    <li><span class="text-bolder">Curso</span>: Sistemas para Internet </li>
                    <li><span class="text-bolder">Orientador</span>: #{tCCOrientador    tcc} </li>
                    <li><span class="text-bolder">Descriçao</span>: #{tCCDescricao        tcc} </li>
                  <p>
          
        <footer class="page-footer grey lighten-3">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <img src=@{StaticR img_guiatcc2_png} width="200px">

              <div class="col l4 offset-l2 s12">
                <ul>
                  <li><a class="grey-text text-darken-2" href=@{HomeR}>Página Inicial</a></li>
                  <li><a class="grey-text text-darken-2" href=@{PortalR}>Portal TCC</a></li>
                  <li><a class="grey-text text-darken-2" href=@{BibliotecaR}>Biblioteca TCC</a></li>
                  <li><a class="grey-text text-darken-2" href=@{SobreR}>Sobre</a></li>

          <div class="footer-copyright grey-text text-darken-2">
            <div class="container">
              <p>© 2016 Copyright <a href=@{LoginUsuarioR}>Painel Admin</a></p>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>

    |]
    
postBibliotecaR :: Handler Html
postBibliotecaR = undefined