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
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>
<body>

<div class="container">
    <h2>Welcome, <%= user %>!</h2>
    <a href="upload.jsp"><i class="fas fa-upload"></i>Upload eBook</a>
    <a href="ebookList.jsp"><i class="fas fa-sign-out-alt"></i> View eBooks</a>
    <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i>  Logout</a>
</div>

</body>
</html>
