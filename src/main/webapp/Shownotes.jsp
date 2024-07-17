<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page import="static jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.title" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/14/2024
  Time: 03:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Notes</title>
    <%@include file="all_js_css.jsp"%>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<div class="container-fluid p-0 m-0 ">
    <%@include file="navbar.jsp"%>
    <div class="container">
        <div class="row">
            <h1 class="upper-case">All notes : </h1>
            <%
                Session s = FactoryProvider.getFactory().openSession();

                Query q = s.createQuery("from Note");
                List<Note> list = q.list();
                for (Note n : list){
            %>
                <div class="card m-3" >
                    <img src="img/note.png" style="max-width: 300px; max-height: 500px;" class="card-img-top" alt="notes">
                    <div class="card-body">
                        <h5 class="card-title"><strong><%=n.getTitle()%></strong></h5>
                        <p class="card-text"><strong><%=n.getContent()%></strong></p>
                        <h6 class="card-text"><i>Note Id : <%=n.getId()%></i></h6>
                        <h6 class="card-text"><i>Note Date : <%=n.getAddedDate()%></i></h6>
                        <a href="DeleteServlet?note_id=<%=n.getId()%>" class="btn btn-danger">Delete</a>
                        <a href="Updatenotes.jsp?note_id=<%=n.getId()%>" class="btn btn-primary">Update</a>
                    </div>
                </div>
            <%--                 out.println("<br/><strong>"+n.getTitle()+"  :<br/>  "+n.getContent()+"</strong><br/>");--%>
            <%

                }

                s.close();
            %>
    </div>
</div>
</body>
</html>
