<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
HttpSession sesion=request.getSession();
sesion.invalidate();
response.sendRedirect("../../../../index.jsp");
%>