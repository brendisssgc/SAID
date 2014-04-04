<%-- 
    Document   : principal
    Created on : 29/03/2014, 03:37:16 AM
    Author     : GOMEZ CABALLERO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Menu</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
        <link href="defaultprin.css" rel="stylesheet" type="text/css" media="all" />
        <link href="fontsprin.css" rel="stylesheet" type="text/css" media="all" />
    </head>

    <body>
        <div id="page" class="container">
            <div id="header">
                <div id="logo">
                    <img src="images/pic02.jpg" alt="" />
                    <h1><a href="fisica2\perfil.jsp">Ver Perfil</a></h1>
                    <span>Design by Monkey Soft</span>
                </div>
                
                <div id="menu">
                    <ul>
                        <li class="current_page_item"><a href="fisica2\Teoria\index.html" accesskey="1" target="princi" title="">Teor&iacute;a</a></li>
                        <li><a href="fisica2\menupract\menu.jsp" target="princi" accesskey="2" title="">pr&aacute;ctica</a></li>
                        <li><a href="fisica2\Examen\examen.jsp" target="princi" accesskey="3" title="">Examen</a></li>
                        <li><a href="fisica2\index.html" target="princi" accesskey="4" title="">Foro</a></li>
                        <li><a href="#" target="princi" accesskey="5" title="">Asesorias</a></li>
                        <li><a href="fisica2\Empresa\index.html" target="princi" accesskey="6" title="">Conocenos</a></li>
                    </ul>
                </div>
            </div>
            <iframe id="princi" name="princi" style=" position:absolute; width:55%; height:90%; left:32%;top:1%; border:none">
            </iframe>
        </div>
        
        <div id="copyright">
            <span>Copyright (c) 2014 Monkey Soft All rights reserved. | Design by Monkey Soft.</span>
        </div>
    </body>
</html>
