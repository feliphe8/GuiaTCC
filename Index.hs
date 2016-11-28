{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module Index where

import Foundation
import Yesod
import Yesod.Static

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Guia TCC"
    addStylesheetRemote "https://fonts.googleapis.com/icon?family=Material+Icons"
    addStylesheetRemote "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"
    addStylesheet $ StaticR css_custom_css
    toWidgetHead[hamlet|
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="shortcut icon" href=@{StaticR img_guiatccicone_png}>
    |]
    [whamlet|
    
    <div id="container">
    
        <nav>
          <div class="nav-wrapper grey lighten-3">
            <a id="logotipo" href=@{HomeR} class="left brand-logo"><img width="220px" class="responsive-img" src=@{StaticR img_guiatcc2_png} alt=""></a>
            <ul id="menu nav-mobile" class="right hide-on-med-and-down">
              <li><a class="blue-text text-darken-1" href=@{PortalR}><i class="material-icons left">language</i>Portal TCC</a></li>
              <li><a class="red-text text-darken-1" href=@{BibliotecaR}><i class="material-icons left">book</i>Biblioteca TCC</a></li>
              <li><a class="grey-text text-darken-2" href=@{SobreR}><i class="material-icons left">info</i>Sobre</a></li>

        <section class="content">
          <div class="parallax-container">
            <div class="parallax"><img src=@{StaticR img_road_jpg}></div>
                <img src=@{StaticR img_guiatccicone_png}>
                <h2>Seja Bem Vindo ao Guia TCC</h2>
                <p>Aqui você encontra tudo o que precisa saber para começar seu TCC, temos uma biblioteca onde se pode pesquisar a respeito do que já foi apresentado na banca e temos tambem um portal de dúvidas onde se tem tudo e como consiste um TCC</p>
          <div class="block b-position-index">
            <div class="description d-position-index">
              <h3 class="blue-text"><i class="medium material-icons">language</i>Portal TCC</h3>
              <p class="paragrafo">Temos uma documentação muito rica a respeito do que é um TCC, por onde começar, o que são as normas ABNT e como utiliza-lá. Fique a vontade para explorar nossa documentação.</p>
              <a class="waves-effect waves-light btn-large blue" href=@{PortalR}><i class="material-icons right">keyboard_arrow_right</i>Explorar Portal</a>
            <div class="description d-position-index">
              <h3 class="red-text"><i class="medium material-icons">book</i>Biblioteca TCC</h3>
              <p class="paragrafo">Na Biblioteca temos um repositório muito extenso de trabalhos onde você pode conferir se alguém já apresentou algo parecido com sua idéia nos anos anteriores.</p>
              <a class="waves-effect waves-light btn-large red" href=@{BibliotecaR}><i class="material-icons right">keyboard_arrow_right</i>Explorar Biblioteca</a>

        
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
    <script type="text/javascript" src=@{StaticR js_custom_js}></script>

    |]