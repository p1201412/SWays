<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

    <head>

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

                            <h1>List of Users</h1><br/>

                            <c:if test="${!empty users}">

                                <table class="table table-hover">
                                  
                                        <th><b>ID</b></th>
                                        <th><b>Pseudo</b></th>
                                        <th><b>Pass</b></th>
                                        <th><b>Name</b></th>
                                        <th><b>Surname</b></th>
                                        <th><b>Registration Date</b></th>
                                        <th><b>Points</b></th>
                                        <th><b>Mail</b></th>
                                        <th><b>Img</b></th>
                                        <th><b>Actions</b></th>
                                  

                                    <c:forEach items="${users}" var="user">

                                        <c:if test="${user.enabled == true}"><tr></c:if>
                                        <c:if test="${user.enabled == false}"><tr class="danger"></c:if>
                                       
                                            <th><c:out value="${user.id}"/></th>
                                            <th><c:out value="${user.pseudo}"/></th>
                                            <th><c:out value="${user.password}"/></th>
                                            <th><c:out value="${user.name}"/></th>
                                            <th><c:out value="${user.surname}"/></th>
                                            <th><c:out value="${user.registrationDate}"/></th>
                                            <th><c:out value="${user.points}"/></th>
                                            <th><c:out value="${user.mailAddress}"/></th>
                                            <th><img width="40" height="40" alt="userIcon" src="${user.img}" class="img-thumbnail"/></th>
                                        
                                            <th><a href="deleteUser/${user.id}/"><button type="button" class="btn btn-default">Delete</button></a></th>

                                            <th><a href="updateUserByAdmin/${user.id}/"><button type="button" class="btn btn-default">Update</button></a></th>

                                        </tr>

                                    </c:forEach>

                                </table>

                            </c:if>
                        </center>
                    </div><!-- /main -->
                </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="../index.html" class="icon-home">Home</a>
                    <a href="../admin/viewTuto.html" class="icon-news">Tutorials</a>
                    <a href="<c:url value="../user/index"/>" class="icon-star">Account</a>
                    <a href="../user/games/index.html" class="icon-star">Games</a>
                    <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                </sec:authorize>
            </nav> 
        </div>
        <script src="<c:url value="/resources/js/menu.js" />"></script>
        <script src="<c:url value="/resources/js/classie.js" />"></script>
    </body>

</html>
