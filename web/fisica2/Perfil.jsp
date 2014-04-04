<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%

HttpSession sesion=request.getSession();
if(null==sesion.getAttribute("email")){
    
        response.sendRedirect("../../../../index.jsp");
    }else{
        
if(sesion.getAttribute("tipo").toString().equals("Administrador")){response.sendRedirect("profe.jsp");}else
    if(sesion.getAttribute("tipo").toString().equals("Normal")){response.sendRedirect("alumnos.jsp");}else{response.sendRedirect("../../../../index.jsp");sesion.invalidate();}
    }%>