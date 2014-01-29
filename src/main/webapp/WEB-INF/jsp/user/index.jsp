<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
                    <img width="200" height="200" src="${user.img}" alt="userIcon" class="img-thumbnail"/>
                <h1>Welcome ${user.name} ${user.surname}</h1>
                <br/>
                <sec:authorize ifAnyGranted="ROLE_USER">
                    Your are logged as user !<br/>
                </sec:authorize>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    Your are logged as admin !<br/>
                </sec:authorize>
                    You have ${user.points} points
                </center>
                </div><!-- /main -->
                    </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="../index.html" class="icon-home">Home</a>
                    <a href="#" class="icon-news">Tutorials</a>
                    <a href="#" class="icon-star">Games</a>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a href="../admin/viewUser.html" class="icon-upload">Administration</a>
                    </sec:authorize>
                    <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                </sec:authorize>
            </nav> 
</div>
<script src="<c:url value="/resources/js/menu.js" />"></script>
<script src="<c:url value="/resources/js/classie.js" />"></script>
</body>

</html>