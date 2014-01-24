<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head><title>Add User</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body>
<center>
<h1>Acount activation</h1>

<br />
<br />
<c:if test="${not empty msg}">
		<div class="alert alert-danger">
			Failed to activate your account : <br />
			${msg}
		</div>
	</c:if>
<c:url var="saveUserUrl" value="/${linkGen}" />
<form:form role="form"  modelAttribute="user" method="POST" action="${saveUserUrl}">
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
<form:label path="key">Activation Key :</form:label><br/>
<form:input path="key" />
</div>
<br />
<button type="submit" class="btn btn-default">Activate</button>

</form:form>
</center>
</body>

</html>