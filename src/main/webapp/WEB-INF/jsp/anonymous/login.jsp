<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body onload='document.f.j_username.focus();'>
<center>
	<h3>Connect yourself</h3>
 
	<c:if test="${not empty error}">
		<div class="alert alert-danger">
			Your login attempt was not successful, try again.<br /> Caused by :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
        <br/>
	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>
 
				User<br/>
				<input type='text' name='j_username' value=''><br/>
                                
                                Password<br/>
				<input type='password' name='j_password' /><br/><br/><br/>

				<button class="btn btn-default" type="submit" value="submit">Connect</button>   
                                <button class="btn btn-default" type="reset">Reset</button>
	</form>
                
                <a href="index.html"><button class="btn btn-default">Return to Home</button></a>
</center>
</body>
</html>