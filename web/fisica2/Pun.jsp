<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%! Statement stmt=null; 

Connection conn=null; 
ResultSet rs=null;
String email=null;%>
<%
email=request.getParameter("email");
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost/CronosClock?user=root&password=n0m3l0");
stmt= conn.createStatement();
rs = stmt.executeQuery("select *  from puntajes where email=aes_encrypt('" + email + "','nomebusques')");

out.println("<table border='1'>");
out.println("<tr>");

out.println("<td>Conceptos Basicos</td>");
out.println("<td>juego2</td>");
out.println("<td>juego3</td>");

if(rs.next()){

out.println("<tr>");

out.println("<td>"+rs.getString("juego") +"</td>");
out.println("<td>"+rs.getString("juego2") +"</td>");
out.println("<td>"+rs.getString("juego3") +"</td>");
out.println("</tr>");
}
out.println("</table>");
try{
rs.close();
stmt.close();
conn.close();
}catch(SQLException sqlEx){};
%>