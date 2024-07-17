<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/14/2024
  Time: 09:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Note</title>
    <%@include file="all_js_css.jsp"%>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<div class="container-fluid p-0 m-0 ">
    <%@include file="navbar.jsp"%>
    <h3 style="text-align: center;"><strong><br/>Here you go for any updation in notes</strong></h3>
        <%
            int noteId = Integer.parseInt(request.getParameter("note_id").trim());
            Session s = FactoryProvider.getFactory().openSession();
            Note note= (Note) s.get(Note.class , noteId);
            s.close();
        %>

    <br>
    <div class="container">
        <h4>Fill your notes details</h4>
        <br>
        <%--    this is add form --%>
        <form action="UpdateServlet" method="post">
            <input value="<%=note.getId()%>" name="note_id" type="hidden"/>
            <div class="form-group">
                <label id="title">Title</label>
                <input required type="text" class="form-control"  placeholder="Enter the title" name="title" value="<%=note.getTitle()%>" aria-describedby="titleHelp">
            </div>
            <div class="form-group">
                <label for="content">Enter content</label>
                <textarea rows="15" id="content" name="content" class="form-control" placeholder="Enter your content"><%=note.getContent()%></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Note</button>
        </form>
    </div>

</div>
</body>
</html>
