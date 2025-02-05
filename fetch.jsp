<%@page import="java.sql.*"%>
<%
try{
	
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manohar");
 
String sql="select * from register";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
<body bgcolor="violet">
<center>
<h1>Welcome</h1>
<h1>Welcome to user Details</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="7" align="center">user Details</th></tr>

<tr>
<td>First_Name</td>
<td>Last_Name</td>
<td>user_name</td>
<td>EMail</td>
<td>Phone</td>
<td>Password</td>
<td>Gender</td>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
</tr>
<%
}
%>
</table>
<br>
<br>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>