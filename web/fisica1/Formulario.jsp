<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!String email=null;%>
<%
email= request.getParameter("email"); 
%>
<html>
<style type="text/css">
.txt{
font-family:'Comic Sans MS';
font-weight:bold;
-webkit-text-fill-color: black; 
-webkit-text-stroke-color: white; 
-webkit-text-stroke-width: .4px;
}
input
{
font-family:'Comic Sans MS';
font-weight:bold;
border-radius:5px;
border-style:ridge;
border-width:medium;
background-color:rgba(120,120,120,0);
}
select
{

font-family:'Comic Sans MS';
font-weight:bold;
border-radius:5px;
border-style:ridge;
border-width:medium;
background-color:rgba(120,120,120,0);
}
.ima{
	width:20; 
	height:20; 
	visibility:hidden
	}
	
input:-moz-placeholder {

    color:    #000;
    font-weight: bold;
}

input::-webkit-input-placeholder {
    color:    #000;
    font-weight: bold;
}
</style>

<head>
    
</head>


<body onLoad="validar()">

						
		
                    <FORM action="Registrado.jsp?email=<%=email%>""  METHOD="Post" id="frml">
						  <table width="25%" border="0">
                                                      <tr>
						      <td><span class="txt">Contraseña actual:</span></td>
						      <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;
  -moz-text-stroke-color: red;
  -moz-text-stroke-width: 0.75px;">
                                                              <input name="pass" type="password" id="pass" size="40" maxlength="40" onKeyUp="validar()" placeholder="Escriba una contraseña min 8 digitos"/>   
						      </span></td>
                              <td><span class="txt"><img id="i1" class="ima" src="imagenes/tache.jpg" /></span>
                              </td>
					        </tr>
                                                      <tr>
						      <td><span class="txt">Contraseña:</span></td>
						      <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;
  -moz-text-stroke-color: red;
  -moz-text-stroke-width: 0.75px;">
                                                              <input name="pass1" type="password" id="pass1" size="40" maxlength="40" onKeyUp="validar()" placeholder="Escriba una contraseña min 8 digitos"/>   
						      </span></td>
                              <td><span class="txt"><img id="i2" class="ima" src="imagenes/tache.jpg" /></span>
                              </td>
					        </tr>
                                                <tr>
                                                    <td><span class="txt">Confirmar: <%=email%></span></td>
						      <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;
  -moz-text-stroke-color: red;
  -moz-text-stroke-width: 0.75px;">
                                                              <input name="pass2" type="password" id="pass2" size="40" maxlength="40" onKeyUp="validar()" placeholder="Escriba una contraseña min 8 digitos"/>   
						      </span></td>
                              <td><span class="txt"><img id="i3" class="ima" src="imagenes/tache.jpg" /></span>
                              </td>
					        </tr>
						    
						    
						    
						    
						    
						    
                            
					      </table>
						  
		  <input name="button" onClick="return enviar()"  id="send" type="button" value="Cambiar contraseña"  style=" border-radius:5px; background-color:#33FF33; height:6%; width:25%; position:absolute;border-style:groove;  font-family:'Comic Sans MS';font-weight:bold" /></FORM>
</body>

<script type="text/javascript">
var correcto = 0;
var ajax=null;
var response = null;
if (window.XMLHttpRequest) {
  // Si es Mozilla, Safari etc
  ajax = new XMLHttpRequest ();
 }else{alert("Exception AJAX");} 

function validar(){	
	correcto = 0;
	document.getElementById("i1").style.visibility="hidden";
	document.getElementById("i2").style.visibility="hidden";
	document.getElementById("i3").style.visibility="hidden";
	
	
	document.getElementById("pass").value=="" ? document.getElementById("i1").style.visibility="visible" : /^[\w\W´ñÑáéíóú]{8,40}$/.test(document.getElementById("pass").value) ? correcto += 1 : document.getElementById("i1").style.visibility="visible";;
	
	document.getElementById("pass1").value=="" ? document.getElementById("i2").style.visibility="visible" : /^[\w\W´ñÑáéíóú]{8,40}$/.test(document.getElementById("pass1").value) ? correcto += 1 : document.getElementById("i2").style.visibility="visible";;
	
	document.getElementById("pass2").value==document.getElementById("pass1").value? correcto += 1 : document.getElementById("i3").style.visibility="visible";;
	
            
    }



function enviar()
{
    if(correcto != 3) 
    {
        alert("verifique que todos los campos sean correctos antes de continuar");
        document.getElementById("pass").value="";
        document.getElementById("pass1").value="";
        document.getElementById("pass2").value="";
    }else{

        
                document.getElementById("frml").submit();

            
}   
}
</script>
</html>
