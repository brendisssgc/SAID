<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%

HttpSession sesion=request.getSession();
if(sesion.getAttribute("email")==null){
    if(request.getParameter("email")==null)
    {
        response.sendRedirect("../../../../index.jsp");
    }
}
%>