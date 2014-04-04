<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.sql.*" %>
<%! Statement stmt=null; 
Connection conn=null;
int puntaje=0;
String email=null;
%>
<% 
HttpSession sesion=request.getSession();
email=(String)sesion.getAttribute("email");
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost/CronosClock?user=root&password=n0m3l0");
stmt= conn.createStatement();
if(request.getParameter("t1").equals("t1a")){puntaje++;}
if(request.getParameter("t2").equals("t2b")){puntaje++;}
if(request.getParameter("t3").equals("t3d")){puntaje++;}
if(request.getParameter("t4").equals("t4b")){puntaje++;}
if(request.getParameter("p1").equals("p1a")){puntaje++;}
if(request.getParameter("p2").equals("p2b")){puntaje++;}
if(request.getParameter("p3").equals("p3d")){puntaje++;}
if(request.getParameter("p4").equals("p4b")){puntaje++;}
if(request.getParameter("g1").equals("g1c")){puntaje++;}
if(request.getParameter("g2").equals("g2d")){puntaje++;}
if(request.getParameter("g3").equals("g3b")){puntaje++;}
if(request.getParameter("g4").equals("g4c")){puntaje++;}
if(request.getParameter("nproblema1").equals("")){puntaje+=2;}
if(request.getParameter("magnitud1").equals("")){puntaje+=2;}
if(request.getParameter("nproblema2").equals("")){puntaje+=2;}
if(request.getParameter("afelio").equals("")){puntaje+=2;}
if(request.getParameter("excentricidad").equals("")){puntaje+=2;}
puntaje=puntaje*10/22;

out.print("<script>alert('Tu calificacion es de " +puntaje+ " ');</script>");

stmt.executeUpdate("UPDATE puntajes SET juego3='"+puntaje+"' WHERE email=aes_encrypt('"+ email+"','nomebusques')");
puntaje=0;
try{
puntaje=0;
stmt.close();
conn.close();
}
catch(SQLException sqlEx){};
%>
<html> 
<head> 
    <title>Fisica II</title> 
	<style>
            
			
			
            #formulario1{
                
            padding:15px;
			width:350px; /*ancho total de la pagina*/ 
			height:250px;  
			background-color:whitesmoke;
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=60);
			-moz-opacity:.60;
			opacity:.60;
                        margin-left:50px;
                        margin-top:80px;
            } 
			
			#formulario2{
                
            padding:15px;
			width:350px; /*ancho total de la pagina*/ 
			height:250px;  
			background-color:whitesmoke;
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=60);
			-moz-opacity:.60;
			opacity:.60;
                        margin-left:50px;
                        margin-top:80px;
			} 
           #formulario3{
                
            padding:15px;
			width:350px; /*ancho total de la pagina*/ 
			height:350px;  
			background-color:whitesmoke;
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=60);
			-moz-opacity:.60;
			opacity:.60;
                        margin-left:50px;
                        margin-top:10px;
			} 
			
			#problemas{
                
            padding:15px;
			width:350px; /*ancho total de la pagina*/ 
			height:510px;  
			background-color:whitesmoke;
			-moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			-webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
			border-radius: 25px; 
			z-index:1;
			filter:alpha(opacity=60);
			-moz-opacity:.60;
			opacity:.60;
                        margin-left:50px;
                        margin-top:10px;
			}
			
			#opciones{
                
                        margin-left:10px;
                       
			}
			
                       
        </style>
        
	</head> 

	<body  bgcolor="#F7D358"> 
             <img id="fondo" name="fondo" src="../Fondo.jpg" style="position:fixed; z-index:-1; top:0; left:0; height:100%; width:100%" />
<div id="tapa" style = "position:fixed; left:90%;z-index:0; width:10%; height:5%; background-color:#000"></div>
	<center><img src="titulolasrespuestas.png" width="350" height="100"></center>
	<table  align="center">
	<tr>
	<td><div id="formulario1">
	
	TRABAJO
	<br>
	Que es trabajo? <br>
	 Energia necesaria para desplazar un cuerpo <br> <br>
	
	 Ecuacion del trabajo para una fuerza constante. <br>
	 W = F * S  <br> <br>
	
	 Que es enregia? <br>
	 la capacidad para realizar un trabajo. <br> <br>
	  
	Que es una fuerza restitutiva? <br>
	 regresa al resorte a su forma normal.
	
	</div></td>
	
	
	
	<td><div id="formulario2">
	 
	POTENCIA
	<br>
	Que es potencia? <br>
	 Rapidez con que se sumistra trabajo a un sistema. 
	<br> <br> 
	 Ecuacion dimencional  de la potencia <br>
	  M^1 L^2 T^-3 <br> <br>
	  
	 Modelo matematico de la potencia mecanica <br>
	P=dw/dt <br> <br>
	
	Equivalencia de un HP en Watts.<br>
	 745.7 Watts
	<br> <br>
	 
	</div></td>
	</tr>
	
	
	
	<td><div id="formulario3">
	<form name="preguntas3"> 
	
	GRAVITACION
	<br>
	Ley de gravitacion univeresal <br>
	La fuerza gravitacional es proporcional al producto de las masas, y proporcional al cuadrado de la distancia entre ellas.
	<br> <br>
	Modelo de Ley de Gravitacion Universal. <br>
	 GMm/r*r <br> <br>
	
	 Valor de la constante de gravitacion universal <br>
	6.67x10^-11 <br> <br>  
	Se consideran dos masas y una distancia, si l adistancia se triplica la fuerza gravitacional... <br>
	aumenta una tercera parte
		</div></td>
	
	
	<td><div id="problemas">
	<form name="problemas"> 
	
	PROBLEMAS.<BR>
	Debes escribir la cantidad y elegir la magnitud.
	<br><hr>
	Un bloque de granito de 1380 kg,  es arrastrado hacia arriva en un plano inclinado, 
	a una velocidad constante de 1.34m/s por un pequeno motor. El coeficiente de friccion entre el bloque y el plano inclinado
	es de 0.41. Que potencia debe suministrar el motor?<br>
	### NO SE ###
	<hr>
	
	Un pequeno bloque de masa m=234 g,se desliza por un carril con extremos elevados y una parte central plana. La parte plana tiene una longitud L=2.16m. 
	Las porciones curvas del carril carecen de friccion. Al atravesar la parte plana el objeto pierde 688mJ de energia mecanica  debido a la friccion.
	El objeto es soltado en el punto A, que tiene una altura h=1.05m sobre la parte plana del carril. A donde llega el objeto finalmente en reposo?<br>
	#### NO SE ###		
	<hr>
	
	El cometa Halley tiene un periodo de 76 anhos. En 1986 su acercamiento mayor al sol fue de 8.9x10^10 m.
	Determne su afelio y la excentricidad de su orbita.<br>
	afelio:### NO SE ###<br>
	excentricidad:### NO SE ###
	<hr>
	
	 
	 
	</div></td>
	</table>
	
	<div id="opciones">
	<center><a href="../Perfil.jsp">Ir a mi perfil...</a></center>
	</div>

	</body> 
	</html> 