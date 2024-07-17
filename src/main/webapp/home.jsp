<%--
  Created by IntelliJ IDEA.
  User: Yashashvini Soni
  Date: 7/13/2024
  Time: 10:13 PM
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@include file="all_js_css.jsp"%>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        .no_border{
            border: none;
        }
    </style>
    <title>Home</title>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp"%><br/><br/><br/>

    <div class="card bg-white no_border" py-5">
        <img alt="notes" class="img-fluid mx-auto" src="img/note.png" style="max-width: 400px;">
        <h1 class="text-primary text-italic text-center mt-3">Ease your life with notes<br/></h1>
        <div class="container text-center">
            <button class="btn btn-outline-primary text-center" onclick="redirectToAddNotes()">Let's Go</button>
        </div>
    </div>

</div>

<script>
    function redirectToAddNotes() {
        window.location.href = 'Addnotes.jsp';
    }
</script>

</body>
</html>
