<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%! Statement stmt=null; 
ResultSet rs=null;
Connection conn=null; %>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost/CronosClock?user=root&password=n0m3l0");
stmt= conn.createStatement();
rs  = stmt.executeQuery("select aes_decrypt(usuarios.boleta,'nomebusques'),usuarios.nombre,usuarios.apellidos,puntajes.juego,puntajes.juego2,puntajes.juego3  from usuarios,puntajes where usuarios.email=puntajes.email and usuarios.tipo='Normal' ");
out.println("<table border='1'>");
out.println("<tr>");
out.println("<td>Boleta</td>");
out.println("<td>Nombre</td>");
out.println("<td>Conceptos Basicos</td>");
out.println("<td>juego2</td>");
out.println("<td>Examen</td>");

while(rs.next())
{

out.println("<tr>");
out.println("<td>"+rs.getString("aes_decrypt(usuarios.boleta,'nomebusques')") +"</td>");
out.println("<td>"+rs.getString("apellidos")+" "+rs.getString("nombre") +"</td>");
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