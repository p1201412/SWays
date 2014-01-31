<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Silent Ways</title>
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
                            

                            <c:url var="viewUsrUrl" value="/admin/viewTuto.html" />
                            <h1>Add a new's tutorial</h1>
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">
                                    Your edit attempt was not successful, try again.<br /> Caused by :
                                    ${error}
                                </div>
                            </c:if>
                            <br />

                            <c:url var="AddTutoUrl" value="/admin/addTuto" />
                            <form:form role="form" modelAttribute="tuto" method="POST" action="${AddTutoUrl}">
                                <div class="form-group">

                                    <form:label path="subject">Subject</form:label><br/>
                                    <form:input path="subject" />
                                </div>

                                <div class="form-group">
                                    <form:label path="content">Content</form:label><br/>
                                    <form:textarea path="content" rows="5" cols="30"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="authorName">AuthorName</form:label><br/>
                                    <form:input path="authorName" />
                                </div>

                                <br/>
                                <br/>
                                <button type="submit" class="btn btn-default">Add Tutorial</button><br/><br/>
                            </form:form>
                            <a href="${viewUsrUrl}"><button class="btn btn-primary">Go Back</button></a>
                            <br/>
                        </center>
                    </div><!-- /main -->
                </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="../index.html" class="icon-home">Home</a>
                    <a href="viewTuto.html" class="icon-news">Tutorials</a>
                    <a href="../user/games/index" class="icon-star">Games</a>
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
