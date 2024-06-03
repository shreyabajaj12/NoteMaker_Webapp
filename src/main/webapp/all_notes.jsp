<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.entities.Note" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <%@ include file="All_js_css.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">

    <br>
    <h1 class="text-uppercase">ALL NOTES:</h1>
    <br>
    <div class="row">
        <div class="col-12">
            <%
                Session s = FactoryProvider.getFactory().openSession();
                Query q = s.createQuery("from Note");
                List<Note> list = q.list();
                for (Note note : list) {
                    %>
            <div class="card">
                <img src="image/notepad.png" class="card-img-top m-4" style="max-width:100px"; alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"><%=note.getTitle()%></h5>
                    <p class="card-text">
                        <%=note.getContent()%>
                    </p>
                    <p class="card-date " style="margin-left: 9in"><%=note.getAddedDate()%> </p>
                    <div class="container text-center">
                    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
                </div>
                </div>
            </div>

            <%

                }
                s.close();
            %>
        </div>
    </div>

</div>
</body>
</html>
