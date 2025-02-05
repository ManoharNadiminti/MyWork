<%@ page import="java.sql.*"%>

<%
String itemname=request.getParameter("search");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manohar");
    PreparedStatement ps=con.prepareStatement("select * from search where NAME=? ");
    ps.setString(1,itemname);
    ResultSet rs=ps.executeQuery();
    %>
<html>
<head>
<style>
#border1 {
  border: 2px solid #000000;
  border-radius: 50px;
}

#full{
  background-image: url();
  background-color: #FBCAFF;
  height: 500px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
:hover{
 background:purple;
 transistion:0.5s;
 text-transform:uppercase;
 }
  th:hover{
 background:#FC28FB;
 transistion:0.5s;
 text-transform:uppercase;
 }
 th {
  border: 2px dotted #781C68;
  padding: 10px;
  border-radius: 25px;
}
img{
  border: 2px dotted blue ;
  padding: 10px;
  border-radius: 50px 20px;
}
h1{
  font-style: italic;
  text-align: center;
}
</style>
<body id="full"  text="white" bgcolor="#8946A6">


<h1 style=color:#3490DE style="text-align:center"><img src="categories.png" alt="categories"><h1>

<div id="border1">
<table border=0  cellspacing=10 cellpadding=20 align="center">
 <tr >
 <%
 if(rs.next())
 { 
  %>
 <th cellspacing=5 cellpadding=20 align="center" bgcolor="#FFFDDE" width=22%><a href="in.html"><img src=<%=rs.getString(2)%> alt="fashion image" height=300 width=300></a><br><br><font color=#0F0E0E size=10><b> <%=rs.getString(1) %> <b></font></th>
 <%
 }
 %>
 
 </tr>
 
 
 </table>
 </div>
</body>
</html>
<%
}catch(Exception e){
    out.print(e);
}
%>