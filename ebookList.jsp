<!-- <%@ page import="java.sql.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<%
Properties props = new Properties();
InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
props.load(input);

String url = props.getProperty("db.url");
String username = props.getProperty("db.username");
String password = props.getProperty("db.password");

Connection con = DriverManager.getConnection(url, username, password);
%>

<!DOCTYPE html>
<html>
<head>
    <title>eBook List</title>
    <link rel="stylesheet" type="text/css" href="css/ebook.css">
</head>
<body>

<h2>Available eBooks</h2>

<table>
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Download</th>
    </tr>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "sidd1611");
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM ebooks");

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
        <td><a href="<%= rs.getString("file_path") %>" target="_blank">Download</a></td>
    </tr>
<%
    }
} catch(Exception e) {
%>
    <tr><td colspan="3" style="color: red;">Error: <%= e.getMessage() %></td></tr>
<%
} finally {
    try { if (rs != null) rs.close(); } catch(Exception e) {}
    try { if (stmt != null) stmt.close(); } catch(Exception e) {}
    try { if (con != null) con.close(); } catch(Exception e) {}
}
%>
</table>

<a class="back-link" href="dashboard.jsp">← Back to Dashboard</a>

</body>
</html>
 -->
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}

Properties props = new Properties();
InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
props.load(input);

String url = props.getProperty("db.url");
String username = props.getProperty("db.username");
String password = props.getProperty("db.password");

Connection con = null;
Statement stmt = null;
ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>eBook List</title>
    <link rel="stylesheet" type="text/css" href="css/ebook.css">
</head>
<body>

<h2>Available eBooks</h2>

<table>
    <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Download</th>
    </tr>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, username, password);
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM ebooks");

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
        <td><a href="<%= rs.getString("file_path") %>" target="_blank">Download</a></td>
    </tr>
<%
    }
} catch(Exception e) {
%>
    <tr><td colspan="3" style="color: red;">Error: <%= e.getMessage() %></td></tr>
<%
} finally {
    try { if (rs != null) rs.close(); } catch(Exception e) {}
    try { if (stmt != null) stmt.close(); } catch(Exception e) {}
    try { if (con != null) con.close(); } catch(Exception e) {}
}
%>
</table>

<a class="back-link" href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>
