<%-- 
    Document   : tutosList
    Created on : 29 janv. 2014, 22:59:22
    Author     : Louis
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

    <head>

        <title>All Tutorials</title>
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    </head>

    <body>
    <center>
        <h1>List of Tutorials</h1>

        <c:if test="${!empty tutos}">

            <table class="table table-hover">

                <tr>

                    <th>ID</th>

                    <th>Subject</th>

                    <th>Content</th>

                    <th>AuthorName</th>

                    <th></th>

                </tr>

                <c:forEach items="${tutos}" var="tuto">

                        <th><c:out value="${tuto.id}"/></th>
                        <th><c:out value="${tuto.subject}"/></th>
                        <th><c:out value="${tuto.content}"/></th>
                        <th><c:out value="${tuto.authorName}"/></th>
                    

                        <th><a href="deleteTuto/${tuto.id}/">Delete</a></th>
                        <th><a href="updateTuto/${tuto.id}/"><button type="button" class="btn btn-default">Update</button></a></th>
                        <th><a href="addTuto.html"><button type="button" class="btn btn-default">Add Tutorial</button></a></th>

                    </tr>

                </c:forEach>

            </table>

        </c:if>
        <br/><br/>
        <a href="index.html" ><button type="button" class="btn btn-primary btn-lg">Home</button></a><br/><br/>
        <br/>
        <a href="<c:url value="/j_spring_security_logout" />" ><button type="button" class="btn btn-danger btn-lg">Logout</button></a><br/><br/>
    </center>
</body>

</html>
