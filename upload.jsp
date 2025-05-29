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
    <title>Upload eBook</title>
    <link rel="stylesheet" type="text/css" href="css/upload.css">
</head>
<body>

<div class="container">
    <h2>Upload eBook</h2>
    <form action="uploadProcess.jsp" method="post">
        <input type="text" name="title" placeholder="Title" required>
        <input type="text" name="author" placeholder="Author" required>
        <input type="text" name="file_path" placeholder="File URL (e.g. https://example.com/book.pdf)" required>
        <input type="submit" value="Upload">
    </form>
    <a class="back-link" href="dashboard.jsp">⬅ Back to Dashboard</a>
</div>

</body>
</html>
