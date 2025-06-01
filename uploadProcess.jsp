<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%
String user = (String) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

// Get form data
String title = request.getParameter("title");
String author = request.getParameter("author");
String filePath = request.getParameter("file_path");

Connection con = null;
PreparedStatement ps = null;

try {
    // Load DB credentials from properties file
    Properties props = new Properties();
    InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
    props.load(input);

    String dbUrl = props.getProperty("db.url");
    String dbUser = props.getProperty("db.username");
    String dbPass = props.getProperty("db.password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

    // Insert eBook data
    ps = con.prepareStatement("INSERT INTO ebooks(title, author, file_path, upload_date) VALUES (?, ?, ?, NOW())");
    ps.setString(1, title);
    ps.setString(2, author);
    ps.setString(3, filePath);
    ps.executeUpdate();

    // Redirect to dashboard
    response.sendRedirect("dashboard.jsp");

} catch (Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
} finally {
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>
