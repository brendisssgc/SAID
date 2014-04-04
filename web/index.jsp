<%-- 
    Document   : index
    Created on : 29/03/2014, 11:59:05 AM
    Author     : Gaspar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenido a SAID</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
        <link href="default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    
    <body>
    <div id="header-wrapper">
        <div id="header" class="container">
            <div id="logo">
                <h1>Sistema de Aprendizaje Interactivo Digital (SAID)</h1>
            </div>
        </div>
        
        <div id="titulo" style="
            background-color:rgba(255,255,255,0.5);
            border-radius:15px;
            position:absolute;
            z-index:0; 
            left:2%;
            width:96%; 
            height:20%">
            
            <form action="seleccion.jsp" method="post" id="frm" style="left: 60%;top: 20%; position: absolute"><p class="txt">
                    Boleta : <input type="text" id="bol" name="boleta" maxlength="10">
                <br>
                Contraseña : <input type="password" id="pass" maxlength="8">
                <br>
                <input type="button" onclick="enviar();" value="Entrar" >
                </p>
            </form>
            
            ¿A&uacute;n no tienes tu cuenta? <a href="formulario.jsp">Registrate</a>
        </div>
        
        <div id="copyright" class="container">
            <p>Copyright (c) 2014 Monkey Soft All rights reserved. | Design by Monkey Soft.</p>
        </div>
        
    </body>
</html>
