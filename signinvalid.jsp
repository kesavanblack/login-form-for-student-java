<%@page import="java.sql.*"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String nname=request.getParameter("nname");
String npwd=request.getParameter("npwd");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/login","root","");
PreparedStatement pst = con.prepareStatement("insert into details(Name,Password) values(?,?)");
pst.setString(1,nname);
pst.setString(2,npwd);
int ans=pst.executeUpdate();
if(ans==1)
{
response.sendRedirect("home.html");

} else{
	out.println("VALID");
}
pst.close();
con.close();
} 
catch (SQLException ex) {
	System.err.println("error:"+ex);
}

%>
</body>
</html>