<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%
String user = (String) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

Properties props = new Properties();
InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
props.load(input);

String url = props.getProperty("db.url");
String dbUser = props.getProperty("db.username");
String dbPass = props.getProperty("db.password");

Connection con = null;
Statement stmt = null;
ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available eBooks | LibroVault</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6fa;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.2s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h3 {
            margin: 0 0 10px;
            color: #007BFF;
        }
        .card p {
            color: #555;
            font-size: 14px;
        }
        .download-btn {
            margin-top: 15px;
            display: inline-block;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            text-align: center;
        }
        .download-btn:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            color: #007BFF;
        }
    </style>
</head>
<body>

<h2><i class="fas fa-book"></i> Available eBooks</h2>

<div class="card-container">
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, dbUser, dbPass);
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM ebooks");

    while (rs.next()) {
        String title = rs.getString("title");
        String author = rs.getString("author");
        String filePath = rs.getString("file_path");
%>
    <div class="card">
        <h3><%= title %></h3>
        <p><strong>Author:</strong> <%= author %></p>
        <a class="download-btn" href="<%= filePath %>" target="_blank"><i class="fas fa-download"></i> Download</a>
    </div>
<%
    }
} catch (Exception e) {
%>
    <p style="color: red; text-align: center;">Error: <%= e.getMessage() %></p>
<%
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>
</div>

<a class="back-link" href="dashboard.jsp">← Back to Dashboard</a>

</body>
</html>
