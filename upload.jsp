<!-- <%@ page import="java.sql.*" %>
<%
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head><title>Upload eBook</title></head>
<body>
<h2>Upload eBook</h2>
<form action="uploadProcess.jsp" method="post">
  Title: <input type="text" name="title" required><br>
  Author: <input type="text" name="author" required><br>
  File URL (e.g. http://example.com/ebook.pdf): <input type="text" name="file_path" required><br>
  <input type="submit" value="Upload">
</form>
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
    <title>Upload eBook</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef1f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
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
