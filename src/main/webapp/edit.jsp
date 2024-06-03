<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: C..VISION
  Date: 02-06-2024
  Time: 00:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%@include file="All_js_css.jsp"%>
</head>
<body>
<div class="container">
  <%@include file="navbar.jsp"%>
  <h1>Make changes to ur notes</h1>
    <%
        int noteId=Integer.parseInt(request.getParameter("note_id").trim());
        Session s= FactoryProvider.getFactory().openSession();
        Note note=(Note) s.get(Note.class, noteId);
    %>
    <form action="UpdateServlet" method="post">
<input value="<%=note.getId()%>" name="noteId" type="hidden"/>
        <div class="mb-3">
            <label for="title" >Note Title</label>
            <input required type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp"
                   placeholder="Enter Here!!"
                    value="<%=note.getTitle()%>"
            />

        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Note Content</label>
            <textarea required
                      name="content"
                      id="content"
                      placeholder="Enter Content!!"
                      class="form-control"
                      style="height:300px"><%=note.getContent()%>
            </textarea>
        </div>
        <div class="container text-center">
            <button type="Submit" class="btn btn-success">Save Updated</button>
        </div>
    </form>
</div>

</body>
</html>
