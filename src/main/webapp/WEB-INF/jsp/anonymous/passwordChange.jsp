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
       
<c:url var="backUrl" value="/index.html" />
<h1>Update your password</h1>
<c:url var="UpdateUserUrl" value="/forgot/${linkGenForgot}" />

<c:if test="${not empty error}">
		<div class="alert alert-danger">
			Your edit attempt was not successful, try again.<br /> Caused by :
			${error}
		</div>
	</c:if>
<br />${user.id}

<form:form role="form" modelAttribute="user" method="POST" action="${UpdateUserUrl}">
<form:input type="hidden" path="registrationDate" value="${user.registrationDate}"/>
<form:input type="hidden" path="points" value="${user.points}"/>
<form:input type="hidden" path="id" value="${user.id}"/>
<form:input type="hidden" path="enabled" value="${user.enabled}"/>
<form:input type="hidden" path="pseudo" value="${user.pseudo}"/>
<form:input type="hidden" path="name" value="${user.name}"/>
<form:input type="hidden" path="surname" value="${user.surname}"/>
<form:input type="hidden" path="img" value="${user.img}"/>
<form:input type="hidden" path="mailAddress" value="${user.mailAddress}"/>
    
<div class="form-group">
<form:label path="password">Password</form:label><br/>
<form:input path="password" value=" " type="password"/>
</div>

<div class="form-group">
<form:label path="confirmPassword">Confirm password</form:label><br/>
<form:input path="confirmPassword"  type="password"/>
</div>


<br />
<br/>

<button type="submit" class="btn btn-default">Send</button><br/><br/>

</form:form>
<a href="${backUrl}"><button class="btn btn-primary">Go Back</button></a>
<br/>

</center>
    </body>
</html>
