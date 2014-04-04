<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@page import="java.sql.*" %>
<%! Statement stmt=null; 
Connection conn=null;
ResultSet rs=null;
%>
<% 
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost/CronosClock?user=root&password=n0m3l0");
stmt= conn.createStatement();
rs = stmt.executeQuery("Select aes_decrypt(pass,'nomebusques') from usuarios where email=aes_encrypt('"+request.getParameter("email")+"','nomebusques')");
if(rs.next())
{
   
    
        
            if(request.getParameter("pass").equals(rs.getString("aes_decrypt(pass,'nomebusques')"))){
            response.getWriter().write("<h1>Contraseña modificada con exito</h1>");}else{
            out.println("<script> parent.location.href='Cerrar.jsp'; </script>");
            
            
            }
        
}
stmt.executeUpdate("UPDATE usuarios SET pass=aes_encrypt('" +request.getParameter("pass1")+"','nomebusques') where email=aes_encrypt('" +request.getParameter("email")+"','nomebusques')");
try{
stmt.close();
conn.close();
}
catch(SQLException sqlEx){};
%>
