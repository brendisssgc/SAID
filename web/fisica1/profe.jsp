<%@ page session="true" %>
<%!
String email = null;
%>
<%
 HttpSession sesion=request.getSession();
 if(sesion.getAttribute("email")==null){
    
        response.sendRedirect("../../../../index.jsp");
    }else{
 email = (String) sesion.getAttribute("email");}
%>

<html>
     <head>
    <SCRIPT  language="JavaScript" src ="paginas/validar_buscar_getElement.js"></SCRIPT>
	
		<link rel="shortcut icon" href="imagenes/albert.png">
	<title>Profesor</title>
		<SCRIPT  language="JavaScript" src ="paginas/validar_agragar_getElement.js"> </SCRIPT>
		<script language="JavaScript">
		function muestra_oculta1(id){
		if (document.getElementById){ 
		var el = document.getElementById(id); 
		el.style.display = (el.style.display == 'none') ? 'block' : 'none';
		}
		}
	

		function muestra_oculta2(id){
		if (document.getElementById){ 
		var el = document.getElementById(id);
		el.style.display = (el.style.display == 'none') ? 'block' : 'none'; 
		}
		}
		

	</script>
		<style>
		*::-moz-selection{
		   background: #5882FA;
		   color: #5882FA;
		}

		body {
			background-image: url(imagenes/fondo1.png);/* */
                        background-repeat: no-repeat;
			background-attachment: fixed;
			background-position: center;
                        background-position-x:0%;
                        background-size:100%;
                        background-position-y:absolute;
                        bgcolor-color: #666666;
			font-family:Georgia, "Times New Roman", Times, serif;
			font-size:12px;
			color:#666666;
			text-align:center; /*aqui mandamos a centrar todo el contenido*/ 
		}
		#contenedor {
			width:612px; /*ancho total de la pagina*/ 
			height:740px;  
			background-color:#81F7F3;
			margin:10px auto; /*10px arriba y abajo, y auto a los lados, para los navegadores nuevos es suficiente para centrar la pagina*/ 
			text-align:left; /*aqui alineamos todo de nuevo a la izquierda, pero dentro del contenedor*/ 
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=80);
			-moz-opacity:.80;
			opacity:.80;
			
		}
		#encabezado {
			margin:10px; /*para que no se pegue al borde*/ 
			padding:10px; /*algo de relleno*/
			width:95px; /*este ancho es para que cuadre con el texto*/ 
			height:95px; /*idem*/ 
		   
			background-color:#0101DF; /*more*/ 
			float:left; /*lo flotamos a la izquierda*/ 
			display:inline; /*(*)*/ 
			border-radius: 10px;	
                        color:blue;
		}
                #encabezado1 {
			margin:20px; /*para que no se pegue al borde*/ 
			padding:0px; /*algo de relleno*/
			width:100px; /*este ancho es para que cuadre con el texto*/ 
			height:50px; /*idem*/
			background-color:#5882FA; /*more*/
                        float:left; /*lo flotamos a la izquierda*/ 
			display:inline; /*(*)*/ 
			border-radius: 10px;	
                        color:blue;
		}
		  span.info{
			display:none;
			position:absolute;
			left:0px;
			top:20%;
			background-color:#FEA;
		  }


		#list8 { 
		 margin:10px 230px;  
		 }
		#list8 ul {
		 list-style:none; 
		 }
		#list8 ul li { 
		font-family:Georgia,serif,Times; font-size:18px; 
		}
		#list8 ul li a {
		 display:block;
		 width:300px;
		 height:28px; 
		 background-color:#5882FA; 
		 border-left:5px solid #222; 
		 border-right:5px solid #222;
		 padding-left:10px;
		  text-decoration:none;
		  color:black; }
		#list8 ul li a:hover {
		  -moz-transform:rotate(-5deg); 
		  -moz-box-shadow:10px 10px 20px #00FFFF;
		  -webkit-transform:rotate(-5deg);
		  -webkit-box-shadow:10px 10px 20px #00FFFF;
		  transform:rotate(-5deg); 
		  box-shadow:10px 10px 20px #00FFFF; }

		  


		#contenido {
			width:580px; /*el ancho mas el padding me da 600px de ancho que es loque mide la pagina */
			height:100%;
			clear:both; /*con esto nos aseguramos de que no se ponga nada a los lados*/ 
			padding:10px;
		} 
		#contenido h2 {
			font-size:16px;
			color:#0040FF;
			width:246px;
			text-transform:uppercase;
			border-bottom:1px dotted #CC3300;
		}
		#contenido h3 {
			width:246px;
			font-size:14px;
			color:#0040FF;
			border-bottom:1px dotted #999900;
		}	
		#contenido img{
			padding:10px;
		}
			
		.ex1 img{
			height: 50px;
			width: 50px;
			float: left;
			margin: 15px;
			-webkit-transition: margin 0.2s ease-out;
			-moz-transition: margin 0.2s ease-out;
			-o-transition: margin 0.2s ease-out;
		}

		.ex1 img:hover {
			margin-top: 2px;
		}

		#infomapa{
			border-bottom:1px dotted #0040FF;
			font-family:Georgia, "Times New Roman", Times, serif;
			font-size:12px;
			color:white;	
		}
		#infomapa :hover{
			style:"z-index:1;" 
			filter:alpha(opacity=10);
			-moz-opacity:.10	;
			opacity:.10	
		}
		#infomapa h3{
			font-size:16px;
			color:orange;	
		}


		#transparente {
			width:250 	px; /*ancho total de la pagina*/ 
			height:80px;    
			background-color:#FFF8F0;
			margin:1px auto; /*10px arriba y abajo, y auto a los lados, para los navegadores nuevos es suficiente para centrar la pagina*/ 
			text-align:left; /*aqui alineamos todo de nuevo a la izquierda, pero dentro del contenedor*/ 
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 10px; 
			padding:15px;	
			position:fixed;bottom:50;
			font-color:white;
		}
		#transparente img{
			width:100px;
			height:100px;  
		}
		#count{
		position:fixed;
		bottom:170;
			}
		#contenido_a_mostrar1{
			padding:20px;
			width:400px; /*ancho total de la pagina*/ 
			height:205px;  
			background-color:#FFF8F0;
			margin:10px auto; /*10px arriba y abajo, y auto a los lados, para los navegadores nuevos es suficiente para centrar la pagina*/ 
			text-align:left; /*aqui alineamos todo de nuevo a la izquierda, pero dentro del contenedor*/ 
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=90);
			-moz-opacity:.90;
			opacity:.90;
		position:fixed;
		top:100;
		}
		
		#contenido_a_mostrar2{
			padding:20px;
			width:400px; /*ancho total de la pagina*/ 
			height:290px;  
			background-color:#FF0000;
			margin:10px auto; /*10px arriba y abajo, y auto a los lados, para los navegadores nuevos es suficiente para centrar la pagina*/ 
			text-align:left; /*aqui alineamos todo de nuevo a la izquierda, pero dentro del contenedor*/ 
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=90);
			-moz-opacity:.90;
			opacity:.90;
		position:fixed;
		top:100;
		right:20;
		}
		
		ul.formularios{
				list-style:none;
				margin:0;
				padding:0;
				width:400px;
				position:fixed;
				left:380px;
				
		  }
		  ul.formularios li{
			float:left;
			margin-right: 8px;
			margin-bottom: 10px;	
			position:relative;
		  }
		 
		  ul.formularios li:hover img{
			opacity:1;
			cursor:pointer;
		  }
		  ul.formularios li span{
			display:none;
			position:absolute;
			left:0px;
			top:80%;
			background-color:#FEA;
		  }
		  ul.formularios li:hover span{
			display:block;
			
			}
			
		ul.formularios2{
				list-style:none;
				margin:0;
				padding:0;
				width:400px;
				position:fixed;
				left:1450px;
				
		  }
		  ul.formularios2 li{
			float:left;
			margin-right: 8px;
			margin-bottom: 10px;	
			position:relative;
		  }
		 
		  ul.formularios2 li:hover img{
			opacity:1;
			cursor:pointer;
		  }
		  ul.formularios2 li span{
			display:none;
			position:absolute;
			left:0px;
			top:80%;
			background-color:#FEA;
		  }
		  ul.formularios2 li:hover span{
			display:block;
			
			}		
			
		</style>
	</head>

	<body>
		<div id="contenedor">
		<div id="encabezado">
                    <img src="imagenes/albert.png" width=95px height=95px>
		</div>
                    <div id="encabezado1"><H1 size ="50"><center>Física</center></H1></div>
                    
		<br><br>

		 <div id="list8">
		   <ul>
		          <li><a href="index.jsp">Ir a la páguina de Inicio</a></li>  
                          <li><a href="Apun.jsp" target="muestra">Puntajes de los Alumnos</a></li>
                          <li><a href="Formulario.jsp?email=<%=email%>" target="muestra">Cambiar mi contraseña</a></li>
                          <li><a href="Cerrar.jsp">Cerrar sesión</a></li>
			  </ul>
		</div>


		 <div id="contenido">
		
		 
		 <h3>Bienvenido profesor:</h3>
		 <p>  </p>
		 
                 <IFRAME style="border:0px" width=100% border="0" id="muestra" name="muestra"></IFRAME>
                 
                 
                 
                  <h2></h2>
		 <p>
                     
                 <blockuote> .::E-mail: <%=email%>::.</blockuote></p>
		 </div>
		 </div>
	</body>
 </html>