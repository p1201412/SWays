<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Silent Ways</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>

<body>
<div class="jumbotron">
    <center>
    <h1>Welcome ${user.name} ${user.surname}</h1>
    <br/>
    Your are logged as user !<br/><br/>
    <a href="<c:url value="/user/updateUser/${user.id}/" />" ><button type="button" class="btn btn-danger btn-lg">Edit account</button></a><br/><br/>
        <a href="<c:url value="/j_spring_security_logout" />" ><button type="button" class="btn btn-danger btn-lg">Logout</button></a><br/><br/>
    </center>
</div>
</body>

</html>