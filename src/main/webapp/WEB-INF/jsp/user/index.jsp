<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Silent Ways</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</head>

<body>
    
     <nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <a class="navbar-brand" href="user/index.html">SilentWays</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Forum</a></li>
      <li><a href="#">Games</a></li>
      <li><a href="#">Tutorials</a></li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Account <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="#">View account</a></li>
            <li><a href="<c:url value="/user/updateUser/${user.id}/" />">Edit account</a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
        </ul>
      </li>
    </ul>
      <sec:authorize ifAnyGranted="ROLE_ADMIN">
        <ul class="nav navbar-nav navbar-right">
           <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administration <b class="caret"></b></a>
             <ul class="dropdown-menu">
                 <li><a href="#">Manage users</a></li>
                 <li><a href="#">Manage forum</a></li>
                 <li><a href="#">Manage games</a></li>
                 <li><a href="#">Manage tutorials</a></li>
             </ul>
           </li>
         </ul>
    </sec:authorize>
  </div><!-- /.navbar-collapse -->
</nav>
    
<div class="jumbotron">
    <center>
        <img width="200" height="200" src="${user.img}" alt="userIcon" class="img-thumbnail"/>
    <h1>Welcome ${user.name} ${user.surname}</h1>
    <br/>
    <sec:authorize ifAnyGranted="ROLE_USER">
        Your are logged as user !<br/><br/>
    </sec:authorize>
    <sec:authorize ifAnyGranted="ROLE_ADMIN">
        Your are logged as admin !<br/><br/>
        <a href="../admin/viewUser.html"><button type="button" class="btn btn-primary btn-lg">Go into admin's part</button></a><br/><br/>
    </sec:authorize>
    <a href="<c:url value="/user/updateUser/${user.id}/" />" ><button type="button" class="btn btn-danger btn-lg">Edit account</button></a><br/><br/>
        <a href="<c:url value="/j_spring_security_logout" />" ><button type="button" class="btn btn-danger btn-lg">Logout</button></a><br/><br/>
    </center>
</div>
</body>

</html>