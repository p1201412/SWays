<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Exception Handling Page</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body>
<center>
<h1>Spring MVC Exception Handling</h1><br/>

<div class="alert alert-danger"><h3>${exception.exceptionMsg}</h3></div>
<a href="/index"><button type="button" class="btn btn-primary btn-lg">Home</button></a>
</center>
</body>
</html>