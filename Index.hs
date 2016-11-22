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
    |]
    [whamlet|
        <div id="background">
            <nav>
                <div class="nav-wrapper grey lighten-3">
                    <a id="logotipo" href=@{HomeR} class="left brand-logo"><img width="220px" class="responsive-img" src=@{StaticR img_guiatcc2_png} alt=""></a>
                    <ul id="menu nav-mobile" class="right hide-on-med-and-down">
                        <li>
                            <a class="red-text text-darken-1" href=@{PortalR}>
                                <i class="material-icons left">language</i>
                                Portal TCC
                        <li><a class="blue-text text-darken-1" href=@{BibliotecaR}><i class="material-icons left">explore</i>Biblioteca TCC</a></li>
                        <li><a class="grey-text text-darken-2" href=@{SobreR}><i class="material-icons left">info</i>Sobre</a></li>
                    
                
            
            <div id="cont-principal" class="row container">
                <img class="responsive-img center" width="300px" src=@{StaticR img_guiatccicone_png} alt="" />
                <div class="col s12">
                    <h1 class="center white-text">Seja Bem Vindo ao Guia de TCC</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                
            
            <div class="row cartoes">
            
                <div class="col s3 left offset-s3">
                    <div class="card red darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">Portal TCC</span>
                            <p>Tem dúvidas sobre "o que é" e "como começar" o seu TCC da Fatec Rubens Lara? Aqui é onde você vai encontrar as respostas de todas suas perguntas(ou da maioria delas.</p>
                        
                        <div class="card-action">
                            <a href=@{PortalR}>Acessar o Portal</a>
                        
                    
                
                <div class="col s3 right pull-s3">
                    <div class="card blue darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">Biblioteca TCC</span>
                            <p>Um mundo inteiro de TCC para você se inspirar, pesquisar e até ver se sua idéia já foi pensada por outra pessoa, tudo isso ao alcance de suas mãos(ou dedos !!!).</p>
                        
                        <div class="card-action">
                            <a href=@{BibliotecaR}>Acessar a Biblioteca</a>
                        
                    
                
            
            <footer class="page-footer grey lighten-3">
                <div class="container">
                    <div class="row">
                        <div class="col l6 s12">
                            <h5 class="grey-text text-darken-2">Guia TCC da Fatec Rubens Lara</h5>
                        
                        <div class="col l4 offset-l2 s12">
                            <ul>
                                <li><a class="grey-text text-darken-2" href=@{HomeR}>Página Inicial</a></li>
                                <li><a class="grey-text text-darken-2" href=@{PortalR}>Portal TCC</a></li>
                                <li><a class="grey-text text-darken-2" href=@{BibliotecaR}>Biblioteca TCC</a></li>
                                <li><a class="grey-text text-darken-2" href=@{SobreR}>Sobre</a></li>
                            
                        
                    
                
                <div class="footer-copyright grey-text text-darken-2">
                    <div class="container">
                        © 2016 Copyright Centro Paula Souza
                    
                
            
        
    |]