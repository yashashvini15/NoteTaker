<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.entities.Note" %>
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <a class="navbar-brand" href="home.jsp">NoteTaker</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Addnotes.jsp">Add Notes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="Shownotes.jsp">Show Notes</a>
            </li>
        </ul>
        <%
            Session s1= FactoryProvider.getFactory().openSession();
            Note note=(Note)s1.get(Note.class,1);

        %>
        <form action="SearchServlet" method="post" class="form-inline my-2 my-lg-0">
<%--            <input value="<%=note.getId()%>" name="note_id" type="hidden"/>--%>
            <input class="form-control mr-sm-2" name="searchid" type="search" placeholder="Search" aria-label="Search" aria-describedby="Enter note id">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
        <%
            s1.close();
        %>
    </div>
</nav>