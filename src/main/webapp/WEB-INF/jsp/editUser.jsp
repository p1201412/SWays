<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Silent Ways</title>
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    </head>
    <body>
    <center>
        
<c:url var="viewUsrUrl" value="/users.html" />
<a href="${viewUsrUrl}">Show All Users</a>


<h1>Update User</h1>
<c:url var="UpdateUserUrl" value="/users/updateUser/${user.id}/" />
<form:form role="form" modelAttribute="user" method="POST" action="${UpdateUserUrl}">
<form:input type="hidden" path="registrationDate" value="${user.registrationDate}"/>
<form:input type="hidden" path="points" value="${user.points}"/>
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

<form:label path="rights">Droits</form:label><br/>
<form:radiobutton path="rights" value="0"/>Utilisateur 
<br/>
<form:radiobutton path="rights" value="50"/>Modérateur
<br/>
<form:radiobutton path="rights" value="100"/>Webmaster
<br/>

<br />
<br/>

<button type="submit" class="btn btn-default">Update User</button>

</form:form>
</center>
    </body>
</html>
