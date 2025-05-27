<%@ page import="java.sql.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}

String title = request.getParameter("title");
String author = request.getParameter("author");
String filePath = request.getParameter("file_path");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ebook", "root", "sidd1611");

    ps = con.prepareStatement("INSERT INTO ebooks(title, author, file_path, upload_date) VALUES (?, ?, ?, NOW())");
    ps.setString(1, title);
    ps.setString(2, author);
    ps.setString(3, filePath);
    ps.executeUpdate();

    response.sendRedirect("dashboard.jsp");

} catch(Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
} finally {
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>
