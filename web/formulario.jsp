<%-- 
    Document   : formulario
    Created on : 29/03/2014, 12:52:29 AM
    Author     : GOMEZ CABALLERO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>

        <script type="text/javascript">
            function oculta(id){
        	var elDiv=document.getElementById(id);
        	elDiv.style.display='none';
            }
            function muestra(id){
            	var elDiv=document.getElementById(id);
        	elDiv.style.display='block';
            }
        </script>
    </head>
	
    <body>
        <input name="selec" id="selec" value="1" type="radio" onclick="muestra('DivAlumno'); oculta('DivProfesor');" /> Alumno
        <input name="selec" id="selec" value="2" type="radio" onclick="muestra('DivProfesor'); oculta('DivAlumno');" /> Profesor

        <div id="DivAlumno" style="display:none">
            <form action="Registrado.jsp"  method="Post" id="frml">
                <table width="25%" border="0">
                    <tr>
                        <td><span class="txt">Boleta: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="bol" type="text" id="bol" size="40" maxlength="10" onKeyUp="validar()" placeholder="Numero de boleta"/>   
                        </span></td>
                        <td><span class="txt"><img id="a1" class="ima" src="images/tache.jpg"/></span>
                        </td>
                    </tr>
<!--hola mundo-->
                    <tr>
                        <td width="40%"><span class="txt">Nombre(s): </span></td>
                        <td width="34%"><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="nombre" type="text" id="nombre" size="40" maxlength="20" value="" onKeyUp="validar()" placeholder="Escriba su nombre"/>   
                        </span></td>
                        <td width="26%"><span class="txt"><img id="a2" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Apellido Paterno: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="apep" type="text" id="apep" size="40" maxlength="20" value="" onKeyUp="validar()" placeholder="Escribe tu apellido paterno"/>   
                        </span></td>
                        <td><span class="txt"><img id="a3" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Apellido Materno: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="apem" type="text" id="apem" size="40" maxlength="20" value="" onKeyUp="validar()" placeholder="Escribe tu apellido materno"/>   
                        </span></td>
                        <td><span class="txt"><img id="a4" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Grupo: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="gru" type="text" id="gru" size="6" maxlength="4" value="" onKeyUp="validar()" placeholder="Grupo"/>   
                        </span></td>
                        <td><span class="txt"><img id="a5" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">E-mail</span> :</td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="email" type="text" id="email" size="40" maxlength="40" onKeyUp="validar()" placeholder="Escriba su direccion de correo"/>   
                        </span></td>
                        <td><span class="txt"><img id="a6" class="ima" src="images/tache.jpg"/></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Contraseña:</span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="pass" type="password" id="pass" size="40" maxlength="8" onKeyUp="validar()" placeholder="Escriba una contraseña min 8 digitos"/>   
                        </span></td>
                        <td><span class="txt"><img id="a7" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Confirmar:</span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input type="password" name="pass1" id="pass1" size="40" maxlength="8" onKeyUp="validar()" placeholder="Vuelva a escribir la contraseña"/>   
                        </span></td>
                        <td><span class="txt"><img id="a8" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>
                </table>

                <p class="txt">
                    <input id="acepto" type="checkbox" onclick="validar()" /> Acepto <a href="terycon.html">terminos y condiciones</a> de la empresa.<br />
                </p>
                <input name="button" onClick="return enviar()"  id="send" type="button" value="Registrarse"/>
            </form>
        </div>
        
        <div id="DivProfesor" style="display:none">
            <form action="Registrado.jsp"  method="Post" id="frm2">
                <table width="25%" border="0">
                    <tr>
                        <td><span class="txt">Numero de empleado: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="nuem" type="text" id="nuem" size="40" maxlength="10" onKeyUp="validar()" placeholder="Escriba su numero de empleado"/>   
                        </span></td>
                        <td><span class="txt"><img id="p1" class="ima" src="images/tache.jpg"/></span>
                        </td>
                    </tr>

                    <tr>
                        <td width="40%"><span class="txt">Nombre(s): </span></td>
                        <td width="34%"><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="nompr" type="text" id="nompr" size="40" maxlength="20" value="" onKeyUp="validar()" placeholder="Escriba su nombre"/>   
                        </span></td>
                        <td width="26%"><span class="txt"><img id="p2" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Apellido Paterno: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="apepp" type="text" id="apepp" size="40" maxlength="20" value="" onKeyUp="validar()" placeholder="Escribe tu apellido paterno"/>   
                        </span></td>
                        <td><span class="txt"><img id="a3" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Apellido Materno: </span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="apemp" type="text" id="apemp" size="40" maxlength="20" value="" onKeyUp="validar()" placeholder="Escribe tu apellido materno"/>   
                        </span></td>
                        <td><span class="txt"><img id="a4" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">E-mail</span> :</td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="emailp" type="text" id="emailp" size="40" maxlength="40" onKeyUp="validar()" placeholder="Escriba su direccion de correo"/>   
                        </span></td>
                        <td><span class="txt"><img id="a5" class="ima" src="images/tache.jpg"/></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Contraseña:</span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input name="passp" type="password" id="passp" size="40" maxlength="8" onKeyUp="validar()" placeholder="Escriba una contraseña min 8 digitos"/>   
                        </span></td>
                        <td><span class="txt"><img id="a6" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>

                    <tr>
                        <td><span class="txt">Confirmar:</span></td>
                        <td><span style="font-family:'Comic Sans MS';font-weight:bold;-moz-text-fill-color: black;-moz-text-stroke-color: red;-moz-text-stroke-width: 0.75px;">
                        <input type="password" name="pass2" id="pass2" size="40" maxlength="8" onKeyUp="validar()" placeholder="Vuelva a escribir la contraseña"/>   
                        </span></td>
                        <td><span class="txt"><img id="a7" class="ima" src="images/tache.jpg" /></span>
                        </td>
                    </tr>
                </table>

                <p class="txt">
                    <input id="acepto" type="checkbox" onclick="validar()" /> Acepto <a href="terycon.html">terminos y condiciones</a> de la empresa.<br />
                </p>
                <input name="button" onClick="return enviar()"  id="send" type="button" value="Registrarse"/>
            </form>
        </div>		
    </body>
</html>
