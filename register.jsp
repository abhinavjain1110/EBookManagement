<!-- <%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
      <link rel="stylesheet" type="text/css" href="css/registerjs.css">
</head>
<body>

<div class="container">
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

if (name != null && email != null && password != null) {
    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "sidd1611");

        ps = con.prepareStatement("INSERT INTO users(name, email, password) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);

        int row = ps.executeUpdate();
        if (row > 0) {
%>
            <div class="message"><h3>✅ Registration successful.<br><a href='login.jsp'>Login here</a></h3></div>
<%
        } else {
%>
            <div class="message"><h3 style="color: red;">❌ Registration failed.</h3></div>
<%
        }

    } catch(Exception e) {
%>
        <div class="message"><h3 style="color: red;">⚠️ Error: <%= e.getMessage() %></h3></div>
<%
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
} else {
%>

    <h2>Create Account</h2>
    <form method="post" action="register.jsp">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Register">
    </form>
    <div class="message">
        Already have an account? <a href="login.jsp">Login</a>
    </div>

<%
}
%>
</div>

</body>
</html>
 -->
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/registerjs.css">
</head>
<body>

<div class="container">
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

if (name != null && email != null && password != null) {
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

        ps = con.prepareStatement("INSERT INTO users(name, email, password) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);

        int row = ps.executeUpdate();
        if (row > 0) {
%>
            <div class="message"><h3>✅ Registration successful.<br><a href='login.jsp'>Login here</a></h3></div>
<%
        } else {
%>
            <div class="message"><h3 style="color: red;">❌ Registration failed.</h3></div>
<%
        }

    } catch(Exception e) {
%>
        <div class="message"><h3 style="color: red;">⚠️ Error: <%= e.getMessage() %></h3></div>
<%
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
} else {
%>

    <h2>Create Account</h2>
    <form method="post" action="register.jsp">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Register">
    </form>
    <div class="message">
        Already have an account? <a href="login.jsp">Login</a>
    </div>

<%
}
%>
</div>

</body>
</html>
