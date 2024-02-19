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
String sname=request.getParameter("sname");
String splace=request.getParameter("splace");
int sage=Integer.parseInt(request.getParameter("sage"));
int sphoneno=Integer.parseInt(request.getParameter("sphoneno"));
String sdeparment=request.getParameter("sdepartment");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/login","root","");
PreparedStatement pst = con.prepareStatement("insert into stddetails(name,place,age,phoneno,department) values(?,?,?,?,?)");
pst.setString(1,sname);
pst.setString(2,splace);
pst.setInt(3,sage);
pst.setInt(4,sphoneno);
pst.setString(5,sdeparment);
int ans=pst.executeUpdate();
if(ans==1)
{
response.sendRedirect("welcome.html");
} else{
out.println("INVALID");
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