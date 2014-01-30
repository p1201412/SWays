<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Silent Ways</title>
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
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
        <sec:authorize ifAnyGranted="ROLE_ADMIN, ROLE_USER">
            <li><a href="#">Forum</a></li>
            <li><a href="#">Games</a></li>
            <li><a href="#">Tutorials</a></li>
        </sec:authorize>
        <sec:authorize ifNotGranted="ROLE_ADMIN, ROLE_USER">
            <li><a href="signin.html">Sign In</a></li>
            <li><a href="login.html">Sign Up</a></li>
        </sec:authorize>    
    </ul>
    <sec:authorize ifAnyGranted="ROLE_ADMIN, ROLE_USER">
        <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Account <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="user/index.html">View account</a></li>
            <li><a href="<c:url value="/user/updateUser" />">Edit account</a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
        </ul>
      </li>
    </ul>
    </sec:authorize>
      <sec:authorize ifAnyGranted="ROLE_ADMIN">
        <ul class="nav navbar-nav navbar-right">
           <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administration <b class="caret"></b></a>
             <ul class="dropdown-menu">
                 <li><a href="admin/viewUser.html">Manage users</a></li>
                 <li><a href="#">Manage forum</a></li>
                 <li><a href="#">Manage games</a></li>
                 <li><a href="#">Manage tutorials</a></li>
             </ul>
           </li>
         </ul>
    </sec:authorize>
  </div><!-- /.navbar-collapse -->
</nav>

    <center>
       
<c:url var="backUrl" value="/user/index.html" />
<h1>Update your account</h1>
<c:url var="UpdateUserUrl" value="/user/updateUser" />

<c:if test="${not empty error}">
		<div class="alert alert-danger">
			Your edit attempt was not successful, try again.<br /> Caused by :
			${error}
		</div>
	</c:if>
<br />

<form:form role="form" modelAttribute="user" method="POST" action="${UpdateUserUrl}">
<form:input type="hidden" path="registrationDate" value="${user.registrationDate}"/>
<form:input type="hidden" path="points" value="${user.points}"/>
<form:input type="hidden" path="enabled" value="${user.enabled}"/>
<div class="form-group">
<form:label path="pseudo">Pseudo</form:label><br/>
    
<form:input path="pseudo" />
</div>
    
<div class="form-group">
<form:label path="password">Password</form:label><br/>
<form:input path="password" value=" " type="password"/>
</div>

<div class="form-group">
<form:label path="confirmPassword">Confirm password</form:label><br/>
<form:input path="confirmPassword"  type="password"/>
</div>

    
<div class="form-group">
<form:label path="name">Name</form:label><br/>
<form:input path="name" />
</div>
  
<div class="form-group">
<form:label path="surname">Surname</form:label><br/>
<form:input path="surname" />
</div>

<div class="form-group">
<form:label path="img">Image</form:label><br/>
<form:input path="img" />
</div>
    
<div class="form-group">    
<form:label path="mailAddress">Mail</form:label><br/>
<form:input path="mailAddress" />
</div>

<div class="form-group">    
<form:label path="confirmMailAddress">Confirm mail</form:label><br/>
<form:input path="confirmMailAddress" />
</div>


<br />
<br/>

<button type="submit" class="btn btn-success">Update User</button><br/><br/>

</form:form>
</center>
    </body>
</html>
