<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/15/2024
  Time: 08:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Note</title>
    <%@include file="all_js_css.jsp"%>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript">
        window.onload = function() {
            var notFound = '<%= request.getAttribute("notFound") != null %>';
            if (notFound == 'true') {
                alert("Note not found.");
            }
        }
    </script>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row">
        <h1 class="upper-case">Searched note : </h1>
         <%
             note = (Note) request.getAttribute("note");
            if(note!=null){
         %>
        <div class="card m-3" >
            <img src="img/note.png" style="max-width: 300px; max-height: 500px;" class="card-img-top" alt="notes">
            <div class="card-body">
                <h5 class="card-title"><strong><%=note.getTitle()%></strong></h5>
                <p class="card-text"><strong><%=note.getContent()%></strong></p>
                <h6 class="card-text"><i>Note Id : <%=note.getId()%></i></h6>
                <h6 class="card-text"><i>Note Date : <%=note.getAddedDate()%></i></h6>
                <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                <a href="Updatenotes.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
