<%@ page import="java.sql.*"%>
<%@ page import="java.util.regex.*"%>

<%
String username = request.getParameter("username");
String workEmail = request.getParameter("workEmail");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmPassword");
String termsAccepted = request.getParameter("checkbox");

String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

try {
    if (username == null || workEmail == null || password == null || confirmPassword == null || termsAccepted == null) {
        out.println("<p style='color:red;'>All fields are required. Please fill out the form completely.</p>");
    } else if (!password.equals(confirmPassword)) {
        out.println("<p style='color:red;'>Passwords do not match. Please try again.</p>");
    } else if (!Pattern.matches(passwordRegex, password)) {
        out.println("<p style='color:red;'>Password must meet the following requirements:</p>");
        out.println("<ul>");
        out.println("<li>Minimum 8 characters</li>");
        out.println("<li>At least one uppercase letter</li>");
        out.println("<li>At least one lowercase letter</li>");
        out.println("<li>At least one number</li>");
        out.println("<li>At least one special character</li>");
        out.println("</ul>");
    } else if (!workEmail.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
        out.println("<p style='color:red;'>Invalid email format. Please provide a valid work email.</p>");
    } else {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manohar");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO admin_register (username, work_email, password) VALUES (?, ?, ?)");
        ps.setString(1, username);
        ps.setString(2, workEmail);
        ps.setString(3, password); // Consider hashing passwords before storing
        int i = ps.executeUpdate();

        if (i != 0) {
            out.println("<p style='color:green;'>Registration completed successfully!</p>");
            response.sendRedirect("login.html"); // Redirect to login page after successful registration
        } else {
            out.println("<p style='color:red;'>Failed to register. Please try again.</p>");
        }
        conn.close();
    }
} catch (Exception e) {
    out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
}
%>