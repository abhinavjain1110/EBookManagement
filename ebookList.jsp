<!-- <%@ page import="java.sql.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head><title>eBook List</title></head>
<body>
<h2>Available eBooks</h2>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Title</th><th>Author</th><th>Download</th>
    </tr>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ebook", "root", "sidd1611");
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
    out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
} finally {
    try { if (rs != null) rs.close(); } catch(Exception e) {}
    try { if (stmt != null) stmt.close(); } catch(Exception e) {}
    try { if (con != null) con.close(); } catch(Exception e) {}
}
%>
</table>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
 -->
<%@ page import="java.sql.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>eBook List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f8;
            padding: 40px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-link:hover {
            background-color: #0056b3;
        }
    </style>
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
