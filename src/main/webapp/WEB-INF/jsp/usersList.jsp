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

<a href="users/add.html"><button type="button" class="btn btn-primary">Add User</button></a><br/><br/>

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

<th>Rights</th>

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
<th><c:out value="${user.rights}"/></th>

<th><a href="users/delete/${user.id}/"><button type="button" class="btn btn-default">Delete</button></a></th>

<th><a href="users/updateUser/${user.id}/"><button type="button" class="btn btn-default">Update</button></a></th>

</tr>

</c:forEach>

</table>

</c:if>
</center>
</body>

</html>