<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

<head>

<title>All Users</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>

<body>
<center>
    <h1>List of Users</h1>

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

<th>Actions</th>

<th></th>

</tr>

<c:forEach items="${users}" var="user">

<tr>

<th><c:out value="${user.id}"/></th>
<th><c:out value="${user.pseudo}"/></th>
<th><c:out value="${user.password}"/></th>
<th><c:out value="${user.name}"/></th>
<th><c:out value="${user.surname}"/></th>
<th><c:out value="${user.registrationDate}"/></th>
<th><c:out value="${user.points}"/></th>
<th><c:out value="${user.mailAddress}"/></th>

<th><a href="deleteUser/${user.id}/"><button type="button" class="btn btn-default">Delete</button></a></th>

<th><a href="updateUserByAdmin/${user.id}/"><button type="button" class="btn btn-default">Update</button></a></th>

</tr>

</c:forEach>

</table>

</c:if>
<br/><br/>
<a href="index.html" ><button type="button" class="btn btn-primary btn-lg">Home</button></a><br/><br/>
<br/>
<a href="<c:url value="/j_spring_security_logout" />" ><button type="button" class="btn btn-danger btn-lg">Logout</button></a><br/><br/>
</center>
</body>

</html>