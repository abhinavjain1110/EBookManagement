<%@ page import="java.sql.*, java.io.*" %>
<%
int ebookId = Integer.parseInt(request.getParameter("ebook_id"));
String user = (String)session.getAttribute("user");
if(user == null) {
  response.sendRedirect("login.html");
  return;
}
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "###");
PreparedStatement ps = con.prepareStatement("SELECT file_path FROM ebooks WHERE ebook_id = ?");
ps.setInt(1, ebookId);
ResultSet rs = ps.executeQuery();
if(rs.next()) {
  String filePath = rs.getString("file_path");
  PreparedStatement log = con.prepareStatement("INSERT INTO downloads(user_id, ebook_id, download_date) VALUES ((SELECT user_id FROM users WHERE email = ?), ?, NOW())");
  log.setString(1, user);
  log.setInt(2, ebookId);
  log.executeUpdate();
  response.sendRedirect(filePath);
} else {
  out.println("File not found.");
}
%>