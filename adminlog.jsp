
<%@ page import="java.sql.*"%>

<%

String EMAIL=request.getParameter("c");
String PASSWORD=request.getParameter("pass");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manohar");
    PreparedStatement ps=con.prepareStatement("select * from adregister where EMAIL=? and PASSWORD=?");
    ps.setString(1,EMAIL);
    ps.setString(2,PASSWORD);
    ResultSet x=ps.executeQuery();
    if(x.next()){
        out.print("login Sucessfully Completed....");
        response.sendRedirect("4but.html");
    }else{
        out.print("login not Sucessfully Completed....");
        out.print("USERID and PASSWORD are incorrect");
    }
       

}catch(Exception e){
    out.print(e);
}
%>
