<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@page import="java.sql.*" %>
<%! Statement stmt=null; 
Connection conn=null;
ResultSet rs=null; %>
<% 
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost/CronosClock?user=root&password=n0m3l0");
stmt= conn.createStatement();
rs =stmt.executeQuery("select juego from puntajes where email=aes_encrypt('"+ request.getParameter("email")+"','nomebusques')");
if(rs.next()){
    if(Integer.parseInt(rs.getString("juego"))<Integer.parseInt(request.getParameter("pun")))
    {
        stmt.executeUpdate("UPDATE puntajes SET juego='"+request.getParameter("pun")+"' WHERE email=aes_encrypt('"+ request.getParameter("email")+"','nomebusques')");
        response.getWriter().write("si");
    }
}
try{
rs.close();
stmt.close();
conn.close();
}
catch(SQLException sqlEx){};
%>