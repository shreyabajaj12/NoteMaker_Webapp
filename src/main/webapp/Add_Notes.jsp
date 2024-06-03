<%--
  Created by IntelliJ IDEA.
  User: C..VISION
  Date: 01-06-2024
  Time: 08:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="All_js_css.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<br>
<div class="container-fluid m-0 p-4">
    <H1>Take Down Your Notes</H1>
    <form action="SaveNoteServlet" method="post">

        <div class="mb-3">
            <label for="title" >Note Title</label>
            <input required type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp"
            placeholder="Enter Here!!"/>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Note Content</label>
            <textarea required
                      name="content"
                    id="content"
                    placeholder="Enter Content!!"
                    class="form-control"
                    style="height:300px"
            ></textarea>
        </div>
        <div class="container text-center">
        <button type="Submit" class="btn btn-primary">Add</button>
        </div>
    </form>
</div>
</body>
</html>
