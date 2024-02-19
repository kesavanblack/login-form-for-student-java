<%@page import="java.sql.*"%>
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

String uname=request.getParameter("uname");
String upwd=request.getParameter("upwd");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection=DriverManager.getConnection( "jdbc:mysql://localhost:3306/login","root","");
Statement statement=connection.createStatement(); 
ResultSet resultSet=statement.executeQuery("select * from details where Name='"+uname+"' and Password='"+upwd+"'");
if(resultSet.next())
{
response.sendRedirect("student.html");
} else{
response.sendRedirect("home.html");
}
resultSet.close();
statement.close();
connection.close();
} 
catch (SQLException ex) {
	System.err.println("error:"+ex);
}
%>

</body>
</html>