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

<style type="text/css">
    .container{
    margin:0;
    padding:0;
    background : url(<c:url value="/resources/img/bg.jpg" />) no-repeat center fixed; 
    -webkit-background-size: cover; 
    -moz-background-size: cover; 
    -o-background-size: cover; 
    background-size: cover; }
</style>
</head>
<body>
    <div id="perspective" class="perspective effect-moveleft">
            <div class="container">
                    <div class="wrapper"><!-- wrapper needed for scroll -->
                            <div class="main clearfix">
                                            <p><button id="showMenu">Menu</button></p>
                            </div><!-- /main -->
                    </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="index.html" class="icon-home">Home</a>
                    <a href="admin/viewTuto.html" class="icon-news">Tutorials</a>
                    <a href="user/games/index.html" class="icon-star">Games</a>
                    <a href="user/index.html" class="icon-upload">Account</a>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a href="admin/viewUser.html" class="icon-upload">Administration</a>
                    </sec:authorize>
                    <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                </sec:authorize>
                
                <sec:authorize ifNotGranted="ROLE_ADMIN, ROLE_USER">
                    <a href="login.html" class="icon-lock">Login</a>
                    <a href="signin.html" class="icon-star">Sign in</a>
                </sec:authorize>
            </nav>
    </div>
     <script src="<c:url value="/resources/js/menu.js" />"></script>
<script src="<c:url value="/resources/js/classie.js" />"></script>
</body>
</html>
