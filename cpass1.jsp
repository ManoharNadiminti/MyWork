
<%@ page import="java.sql.*"%>

<%

String EMAIL=request.getParameter("c");
String PASSWORD=request.getParameter("pass");
String REPASSWORD=request.getParameter("repass");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manohar");
    PreparedStatement ps=con.prepareStatement("UPDATE register SET PASSWORD=? WHERE EMAIL=?");
    if(PASSWORD.equals(REPASSWORD))
	{
	ps.setString(1,PASSWORD);
    ps.setString(2,EMAIL);
	out.println("connection sucess");
    ResultSet x=ps.executeQuery();
    if(x.next()){
        out.print("login Sucessfully Completed....");
        response.sendRedirect("login.html");
    }else{
        out.print("login not Sucessfully Completed....");
        out.print("USERID and PASSWORD are incorrect");
    }
	}
       

}catch(Exception e){
    out.print(e);
}
%>

