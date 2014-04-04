
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.sql.*" %>

<%! Statement stmt=null; 
ResultSet rs=null; 
Connection conn=null; %>
<%
HttpSession sesion=request.getSession();
if(sesion.getAttribute("email")==null){
    
        response.sendRedirect("../../../../index.jsp");
    }
        %>
<!DOCTYPE html>

<html>
	<head>
		<title>Menu Alumno</title>
		<LINK HREF="style.css" rel="stylesheet" TYPE="text/css">
	</head>
	<body leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0" bgcolor="#65C001">
	<img id="fondo" name="fondo" src="Fondo.jpg" style="position:fixed; z-index:-1; top:0; left:0; height:100%; width:100%" />
<div id="tapa" style = "position:fixed; left:90%;z-index:0; width:10%; height:5%; background-color:#000"></div>
		<center><table cellpadding="0" cellspacing="0" height="100%" border="0">
			<tr>
				<td height="100%" valign="top" style="padding-top: 20px;">
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="911" height="729" id="flash" align="middle">
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="allowFullScreen" value="false" />
					<param name="movie" value="flash.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="flash.swf" quality="high" bgcolor="#ffffff" width="911" height="729" name="flash" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>

					<div align="center" ><p>Copyright &copy; 2013 Design Cronos Clock S.A de C.V.</a></p></div>
				</td>
			</tr>
		</table>
		</center>
	</body>
</html>
