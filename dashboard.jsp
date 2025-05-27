<%@ page import="java.sql.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head><title>Dashboard</title></head>
<body>
<h2>Welcome, <%= user %></h2>
<a href="upload.jsp">Upload eBook</a><br>
<a href="ebookList.jsp">View eBooks</a><br>
<a href="logout.jsp">Logout</a>
</body>
</html>
