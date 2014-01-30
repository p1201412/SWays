<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

<head>

<title>All Users</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
</head>

<body>
<center>
         <nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <a class="navbar-brand" href="user/index.html">SilentWays</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
        <li><a href="../index.html">Home</a></li>
      <li><a href="#">Forum</a></li>
      <li><a href="#">Games</a></li>
      <li><a href="#">Tutorials</a></li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Account <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../user/index.html">View account</a></li>
            <li><a href="<c:url value="/user/updateUser" />">Edit account</a></li>
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
                 <li><a href="#">Manage forum</a></li>
                 <li><a href="#">Manage games</a></li>
                 <li><a href="#">Manage tutorials</a></li>
             </ul>
           </li>
         </ul>
    </sec:authorize>
  </div><!-- /.navbar-collapse -->
</nav>
        <h1>List of Users</h1><br/>

<c:if test="${!empty users}">

<table class="table table-hover">

<tr>

<th>ID</th>

<th>Pseudo</th>

<th>Pass</th>

<th>Name</th>

<th>Surname</th>

<th>Registration Date</th>

<th>Points</th>

<th>Mail</th>

<th>Img</th>

<th>Actions</th>

<th></th>

</tr>

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
<th><img width="35" height="35" alt="userIcon" src="${user.img}" class="img-thumbnail"/></th>

<th><a href="deleteUser/${user.id}/"><button type="button" class="btn btn-default">Delete</button></a></th>

<th><a href="updateUserByAdmin/${user.id}/"><button type="button" class="btn btn-default">Update</button></a></th>

</tr>

</c:forEach>

</table>

</c:if>
</center>
</body>

</html>