<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html> 
<head> 
    <title>Fisica II</title> 
	<style>
            
			
			
            #formulario1{
                
            padding:15px;
			width:350px; /*ancho total de la pagina*/ 
			height:550px;  
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
			height:550px;  
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
			height:670px;  
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
			height:870px;  
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
                
                        margin-left:500px;
                       
			}
			
                       
        </style>
        
	</head> 

	<body  bgcolor="#D0FA58"> 
            <img id="fondo" name="fondo" src="../Fondo.jpg" style="position:fixed; z-index:-1; top:0; left:0; height:100%; width:100%" />
<div id="tapa" style = "position:fixed; left:90%;z-index:0; width:10%; height:5%; background-color:#000"></div>
        <center><h1 style="text-shadow: 0 0 0.5em #fff;text-shadow: 0 0 .5em #fff;text-shadow: 0 0 .5em #fff;text-shadow: 0 0 .5em #fff;text-shadow: 0 0 .5em #fff; font-family: 'ComicSans MS'">Fisica II</h1></center>
	<table  align="center">
	<tr>
            <td><div id="formulario1" >
                    <form action="respuestas.jsp" method="post" name="preguntas1" id="frml"> 
	TRABAJO
	<br>
	Que es trabajo? <br>
	<input type="radio" name="t1" value="t1a" checked> Energia necesaria para desplazar un cuerpo 
	<br> 
	<input type="radio" name="t1" value="t1b"> Division del desplazamiento y fuerza 
	<br> 
	<input type="radio" name="t1" value="t1c"> Fuerza total aplicada 
	<br> 
	<input type="radio" name="t1" value="t1d"> Producto cruz de fuerza y desplazamiento 
	<hr width="300" align="left"> 
	 Ecuacion del trabajo para una fuerza constante. <br>
	<input type="radio" name="t2" value="t2a" checked> W = F/S  
	<br> 
	<input type="radio" name="t2" value="t2b"> W = F * S 
	<br> 
	<input type="radio" name="t2" value="t2c"> W = F + S  
	<hr width="300" align="left">  
	 Que es enregia? <br>
	<input type="radio" name="t3" value="t3a" checked> No tiene definicion  
	<br> 
	<input type="radio" name="t3" value="t3b"> F + S
	<br> 
	<input type="radio" name="t3" value="t3c"> total del trabajo realizado.  
	<br>
	<input type="radio" name="t3" value="t3d">  la capacidad para realizar un trabajo.
	<hr width="300" align="left">  
	Que es una fuerza restitutiva? <br>
	<input type="radio" name="t4" value="t4a" checked> capacidad de deformacion del resorte.  
	<br> 
	<input type="radio" name="t4" value="t4b"> regresa al resorte a su forma normal.
	<br> 
	<input type="radio" name="t4" value="t4c">  deforma al resorte.
	<br>
	<input type="radio" name="t4" value="t4d"> impide la deformacion del resorte.
	<br> 
        .....................................................................<img src="trabajo_fisico.gif" width="50" height="50">
	 
	</div></td>
	
	
	
	<td><div id="formulario2">
	
	POTENCIA
	<br>
	Que es potencia? <br>
	<input type="radio" name="p1" value="p1a" checked> Cantidad de la energia en el sistema. 
	<br> 
	<input type="radio" name="p1" value="p1b"> Velocidad con que se suministra trabajo a un sistema. 
	<br> 
	<input type="radio" name="p1" value="p1c"> Rapidez con que se sumistra trabajo a un sistema. 
	<br> 
	<input type="radio" name="p1" value="p1d"> Rapidez con que se suministra energia a un sistema.
	<hr width="300" align="left"> 
	 Ecuacion dimencional  de la potencia <br>
	<input type="radio" name="p2" value="p2a" checked> M^-1 L^2 T^-3  
	<br> 
	<input type="radio" name="p2" value="p2b"> M^2 L^2 T^-1
	<br> 
	<input type="radio" name="p2" value="p2c">   M^1 L^2 T^-3
	<hr width="300" align="left">  
	 Modelo matematico de la potencia mecanica <br>
	<input type="radio" name="p3" value="p3a" checked> P=dt/dw  
	<br> 
	<input type="radio" name="p3" value="p3b"> P=dw/dt
	<br> 
	<input type="radio" name="p3" value="p3c"> P=dw*dt  
	<br>
	<input type="radio" name="p3" value="p3d">  P=dw+dt
	<hr width="300" align="left">  
	Equivalencia de un HP en Watts.<br>
	<input type="radio" name="p4" value="p4a" checked> 755.7 Watts.  
	<br> 
	<input type="radio" name="p4" value="p4b"> 145.7 Watts
	<br> 
	<input type="radio" name="p4" value="p4c"> 745.7 Watts
	<br>
	<input type="radio" name="p4" value="p4d"> 785.7 Watts
	<br> 
	.........................................................................<img src="engranes.gif" width="50" height="50">
	
	</div></td>
	</tr>
	
	
	
	<td><div id="formulario3">
	
	
	GRAVITACION
	<br>
	Ley de gravitacion univeresal <br>
	<input type="radio" name="g1" value="g1a" checked> La fuerza gravitacional es proporcional al producto de las masas, y proporcional al cuadrado de la distancia entre ellas.
	<br> 
	<input type="radio" name="g1" value="g1b"> La fuerza gravitacional el producto de las distancias.
	<br> 
	<input type="radio" name="g1" value="g1c"> La fuerza gravitacional es proporcional al producto de las distancias, y proporcional al cuadrado de las masas. 
	<br> 
	<input type="radio" name="g1" value="g1d"> La fuerza gravitacional es proporcional al cuadrado de las masas, y proporcional al cuadrado de la distancia entre ellas. 
	<hr width="300" align="left"> 
	Modelo de Ley de Gravitacion Universal. <br>
	<input type="radio" name="g2" value="g2a" checked> GMm/m*r 
	<br> 
	<input type="radio" name="g2" value="g2b">  GMm/r*r
	<br> 
	<input type="radio" name="g2" value="g2c"> Gr*r/Mm  
	<hr width="300" align="left">  
	 Valor de la constante de gravitacion universal <br>
	<input type="radio" name="g3" value="g3a" checked> 6.67x7^-11  
	<br> 
	<input type="radio" name="g3" value="g3b"> 6.67x10^11
	<br> 
	<input type="radio" name="g3" value="g3c"> 6.77x10^-11  
	<br>
	<input type="radio" name="g3" value="g3d">  6.67x10^-11
	<hr width="300" align="left">  
	Se consideran dos masas y una distancia, si l adistancia se triplica la fuerza gravitacional... <br>
	<input type="radio" name="g4" value="g4a" checked> aumenta nueve veces  
	<br> 
	<input type="radio" name="g4" value="g4b"> aumenta una tercera parte
	<br> 
	<input type="radio" name="g4" value="g4c">  disminuye una tercera parte
	<br>
	<input type="radio" name="g4" value="g4d"> de duplica.
	<br> 
	..........................................................................<img src="gravedad.gif" width="50" height="70">
	
	</div></td>
	
	
	<td><div id="problemas">
	
	
	PROBLEMAS.<BR>
	Debes escribir la cantidad y elegir la magnitud.
	<br><hr>
	Un bloque de granito de 1380 kg,  es arrastrado hacia arriva en un plano inclinado, 
	a una velocidad constante de 1.34m/s por un pequeno motor. El coeficiente de friccion entre el bloque y el plano inclinado
	es de 0.41. Que potencia debe suministrar el motor?<br>
	<center><input type="text" size="10" name="nproblema1">
		<select name="magnitud1">
		<option>Joules*m^2</option>
		<option>Newtons*m/s^2</option>
		<option>Newtons*m/s</option>
		</select><img src="problema1.png" width="170" height="150"></center>
	<hr>
	
	Un pequeno bloque de masa m=234 g,se desliza por un carril con extremos elevados y una parte central plana. La parte plana tiene una longitud L=2.16m. 
	Las porciones curvas del carril carecen de friccion. Al atravesar la parte plana el objeto pierde 688mJ de energia mecanica  debido a la friccion.
	El objeto es soltado en el punto A, que tiene una altura h=1.05m sobre la parte plana del carril. A donde llega el objeto finalmente en reposo?<br>
	<input type="text" size="10" name="nproblema2">mts.<br><center><img src="problema2.png" width="150" height="100"></center>		
	<hr>
	
	El cometa Halley tiene un periodo de 76 anhos. En 1986 su acercamiento mayor al sol fue de 8.9x10^10 m.
	Determne su afelio y la excentricidad de su orbita.<br>
	afelio:<input type="text" size="10" name="afelio">
	excentricidad:<input type="text" size="10" name="excentricidad">
	<hr>
	
	 
	<br>........................................................................<img src="calculadora.gif" width="50" height="70">
	
	</div></td>
	</table>
	
	<div id="opciones">
	<table>
	<tr>
	<td>
	<input type="submit" value="Mostrar mis resultados"></form>	</td>
	</tr>
	</table>
	</div>

	</body> 
        
	</html> 

