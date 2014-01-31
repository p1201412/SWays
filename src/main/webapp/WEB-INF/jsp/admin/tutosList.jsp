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
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/js/modernizr.custom.25376.js" />"></script>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    </head>

    <body>
        <div id="perspective" class="perspective effect-moveleft">
            <div class="container">
                <div class="wrapper"><!-- wrapper needed for scroll -->
                    <div class="main clearfix">
                        <center>
                            <p><button id="showMenu">Menu</button></p>
                            <h1>List of Tutorials</h1>

                            <c:if test="${!empty tutos}">

                                <table class="table table-hover">
                                    <tr>
                                        <th><b>ID</b></th>
                                        <th><b>ISubject</b></th>
                                        <th><b>IContent</b></th>
                                        <th><b>IAuthorName</th>
                                        <th></th>
                                    </tr>
                                    <c:forEach items="${tutos}" var="tuto">

                                        <th><c:out value="${tuto.id}"/></th>
                                        <th><c:out value="${tuto.subject}"/></th>
                                        <th><c:out value="${tuto.content}"/></th>
                                        <th><c:out value="${tuto.authorName}"/></th>

                                        <th><a href="updateTuto/${tuto.id}/"><button type="button" class="btn btn-default">Update</button></a></th>
                                        <th><a href="deleteTuto/${tuto.id}/"><button type="button" class="btn btn-default">Delete</button></a></th>
                                        
                                    </c:forEach>
                                </table>
                            </c:if>

                            <table>
                                <th><a href="addTuto.html"><button type="button" class="btn btn-default">Add Tutorial</button></a></th>
                            </table>
                            <br/><br/>
                            <th><a href="../index.html" ><button type="button" class="btn btn-primary btn-lg">Home</button></a></th>
                            <th><a href="<c:url value="/j_spring_security_logout" />" ><button type="button" class="btn btn-danger btn-lg">Logout</button></a></th>
                        </center>
                             </div><!-- /main -->
                    </div><!-- wrapper -->
            </div><!-- /container -->
                        <nav class="outer-nav right vertical">
                            <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                            <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                                <a href="../index.html" class="icon-home">Home</a>
                                <a href="../user/games/index.html" class="icon-star">Games</a>
                                <a href="../user/index.html" class="icon-star">Account</a>
                                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                                    <a href="viewUser.html" class="icon-upload">Administration</a>
                                </sec:authorize>
                                <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                            </sec:authorize>
                        </nav> 
                        <script src="<c:url value="/resources/js/menu.js" />"></script>
                        <script src="<c:url value="/resources/js/classie.js" />"></script>
                        </body>

                        </html>
