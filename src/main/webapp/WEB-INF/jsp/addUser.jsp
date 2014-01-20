<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head><title>Add User</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body>
<center>
<h1>Add Article</h1>

<c:url var="viewUsrUrl" value="/users.html" />

<a href="${viewUsrUrl}">Show All Users</a>

<br />

<br />

<c:url var="saveUserUrl" value="/users/save.html" />
<form:form role="form"  modelAttribute="user" method="POST" action="${saveUserUrl}">

<div class="form-group">
<form:label path="pseudo">Pseudo</form:label><br/>
<form:input path="pseudo" />
</div>
    
<div class="form-group">
<form:label path="password">Password</form:label><br/>
<form:input path="password"  type="password"/>
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
<form:label path="mailAddress">Mail</form:label><br/>
<form:input path="mailAddress" />
</div>

<div class="form-group">    
<form:label path="confirmMailAddress">Confirm mail</form:label><br/>
<form:input path="confirmMailAddress" />
</div>

<br />

<button type="submit" class="btn btn-default">Add User</button>

</form:form>
</center>
</body>

</html>