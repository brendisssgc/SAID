<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@page import="java.sql.*" %>
<%! Statement stmt=null; 
ResultSet rs=null; 
Connection conn=null; %>
<% 
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost/CronosClock?user=root&password=n0m3l0");
stmt= conn.createStatement();
rs = stmt.executeQuery("Select aes_decrypt(pass,'nomebusques') from usuarios where email=aes_encrypt('"+request.getParameter("email")+"','nomebusques')");
response.getWriter().write(request.getParameter("email"));
if(rs.next())
{
   
    
        
            if(request.getParameter("pass").equals(rs.getString("aes_decrypt(pass,'nomebusques')"))){
            response.getWriter().write("si");}
        
}
response.getWriter().write(request.getParameter("email"));
try{
rs.close();
stmt.close();
conn.close();
}
catch(SQLException sqlEx){};
%>