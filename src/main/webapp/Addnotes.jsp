<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/13/2024
  Time: 11:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Notes</title>
  <%@include file="all_js_css.jsp"%>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<div class="container-fluid p-0 m-0 ">
  <%@include file="navbar.jsp"%>
    <br><br><br>
    <div class="container">
        <h4>Fill your notes details</h4>
        <br>
        <%--    this is add form --%>
        <form action="SaveNotesServlet" method="post">
        <div class="form-group">
                <label id="title">Title</label>
                <input required type="text" class="form-control"  placeholder="Enter the title" name="title" aria-describedby="emailHelp">
            </div>
            <div class="form-group">
                <label for="content">Enter content</label>
                <textarea rows="15" id="content" name="content" class="form-control" placeholder="Enter your content"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Note</button>
        </form>
    </div>
</div>
</body>
</html>
