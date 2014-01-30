<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/modernizr.custom.25376.js" />"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<body onload='document.f.j_username.focus();'>
<div id="perspective" class="perspective effect-moveleft">
    <div class="container">
        <div class="wrapper"><!-- wrapper needed for scroll -->
            <div class="main clearfix">
                
                    <center>
                    <p><button id="showMenu">Menu</button></p>
                    <h1>Connect yourself</h1>

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

                                            <br/>Password<br/>
                                            <input type='password' name='j_password' /><br/><br/><br/>

                                            <button class="btn btn-success" type="submit" value="submit">Connect</button>   
                    </form>            
                            <a href="passForget.html" style="color:red;">Password forgotten</a><br/><br/>
                    </center>
                </div>
            </div><!-- wrapper -->
        </div><!-- /container -->
        <nav class="outer-nav right vertical">
            <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <a href="index.html" class="icon-home">Home</a>
            <sec:authorize ifNotGranted="ROLE_ADMIN, ROLE_USER">
                <a href="signin.html" class="icon-star">Sign in</a>
            </sec:authorize>
        </nav>
    </div>
<script src="<c:url value="/resources/js/menu.js" />"></script>
<script src="<c:url value="/resources/js/classie.js" />"></script>
</body>
</html>