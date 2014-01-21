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
    <center>
        
<c:url var="viewUsrUrl" value="/admin/viewUser.html" />
<h1>Update ${user.pseudo}'s account</h1>
<c:if test="${not empty error}">
		<div class="alert alert-danger">
			Your edit attempt was not successful, try again.<br /> Caused by :
			${error}
		</div>
	</c:if>
<br />

<c:url var="UpdateUserUrl" value="/admin/updateUserByAdmin/${user.id}/" />
<form:form role="form" modelAttribute="user" method="POST" action="${UpdateUserUrl}">
<form:input type="hidden" path="registrationDate" value="${user.registrationDate}"/>
<form:input type="hidden" path="points" value="${user.points}"/>
<form:input type="hidden" path="password" value="${user.password}"/>
<div class="form-group">
<form:label path="pseudo">Pseudo</form:label><br/>
    
<form:input path="pseudo" />
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

<button type="submit" class="btn btn-default">Update User</button><br/><br/>

</form:form>
<a href="${viewUsrUrl}"><button class="btn btn-primary">Go Back</button></a>
<br/>

</center>
    </body>
</html>
