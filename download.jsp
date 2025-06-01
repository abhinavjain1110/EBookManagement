<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%
int ebookId = Integer.parseInt(request.getParameter("ebook_id"));
String user = (String)session.getAttribute("user");

if (user == null) {
    response.sendRedirect("login.html");
    return;
}

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

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

    // Get file path
    ps = con.prepareStatement("SELECT file_path FROM ebooks WHERE ebook_id = ?");
    ps.setInt(1, ebookId);
    rs = ps.executeQuery();

    if (rs.next()) {
        String filePath = rs.getString("file_path");

        // Log download
        PreparedStatement log = con.prepareStatement(
            "INSERT INTO downloads(user_id, ebook_id, download_date) " +
            "VALUES ((SELECT user_id FROM users WHERE email = ?), ?, NOW())");
        log.setString(1, user);
        log.setInt(2, ebookId);
        log.executeUpdate();
        log.close();

        // Redirect to file path
        response.sendRedirect(filePath);

    } else {
        out.println("File not found.");
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>
