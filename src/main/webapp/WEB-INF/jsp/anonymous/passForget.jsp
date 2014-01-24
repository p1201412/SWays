<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgotten Password</title>
    </head>
    <body>
        <h3>Forgotten Password : </h3>
        <br/>
        <c:if test="${not empty error}">
		<div class="alert alert-danger">
			Your edit attempt was not successful, try again.<br /> Caused by :
			${error}
		</div>
	</c:if>
	<c:url var="Url" value="/sendForgotMail" />
<form:form role="form" modelAttribute="user" method="POST" action="${Url}">


<div class="form-group">    
<form:label path="mailAddress">Mail</form:label><br/>
<form:input path="mailAddress" />
</div>

<br />

<button type="submit" class="btn btn-default">Send</button>

</form:form>
    </body>
</html>
