
<%@ page import="java.sql.*"%>

<%

String EMAIL=request.getParameter("userame");
String PASSWORD=request.getParameter("password");

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manohar");
    PreparedStatement ps=con.prepareStatement("select * from register where EMAIL=? and PASSWORD=?");
    ps.setString(1,EMAIL);
    ps.setString(2,PASSWORD);
	out.println("connection sucess");
    ResultSet x=ps.executeQuery();
    if(x.next()){
        out.print("login Sucessfully Completed....");
        response.sendRedirect("____.html");
    }else{
        out.print("login not Sucessfully Completed....");
        out.print("USERID and PASSWORD are incorrect");
    }
}catch(Exception e){
    out.print(e);
}
%>

