<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head><title>Connect</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body>
<center>
<h1>Connect</h1>

<br />

<br />
<form:form role="form"  modelAttribute="user" method="POST" action="/SWFin/login.html">

<div class="form-group">
<form:label path="pseudo">Pseudo</form:label><br/>
<form:input path="pseudo" />
</div>
    
<div class="form-group">
<form:label path="password">Password</form:label><br/>
<form:input path="password"  type="password"/>
</div>
<br />

<button type="submit" class="btn btn-default">Connect</button>

</form:form>
</center>
</body>

</html>