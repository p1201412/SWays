<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SilentWays</title>
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/js/modernizr.custom.25376.js" />"></script>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>   

    </head>
    <body>
        
        <div id="perspective" class="perspective effect-moveleft">
            <div class="container">
                <div class="wrapper"><!-- wrapper needed for scroll -->
                    <div class="main clearfix">
                        <center>
                            <p><button id="showMenu">Menu</button></p>
                            <h1>Generated MCQ</h1>   


                            <form name="mcq" action="/qcmCheck" method="POST" modelAttribute="mcq">
                                <div ><br>
                                    Question 1: ${mcq.getMcq().get(0).question}  ${mcq.getMcq().get(0).id}<br/><br/>
                                    <input type="radio" name="g1" value="ans1"> ${mcq.getMcq().get(0).ans1}
                                    <input type="radio" name="g1" value="ans2"> ${mcq.getMcq().get(0).ans2}
                                    <input type="radio" name="g1" value="ans3"> ${mcq.getMcq().get(0).ans3}
                                    <br/><br/><br/>
                                    Question 2:  ${mcq.getMcq().get(1).question}  ${mcq.getMcq().get(1).id}<br/><br/>
                                    <input type="radio" name="g2" value="ans1"> ${mcq.getMcq().get(1).ans1}
                                    <input type="radio" name="g2" value="ans2">${mcq.getMcq().get(1).ans2}
                                    <input type="radio" name="g2" value="ans3">${mcq.getMcq().get(1).ans3}
                                    <br/><br/><br/>
                                    Question 3:  ${mcq.getMcq().get(2).question}  ${mcq.getMcq().get(2).id}<br/><br/>
                                    <input type="radio" name="g3" value="ans1"> ${mcq.getMcq().get(2).ans1}
                                    <input type="radio" name="g3" value="ans2">${mcq.getMcq().get(2).ans2}
                                    <input type="radio" name="g3" value="ans3">${mcq.getMcq().get(2).ans3}
                                    <br/><br/><br/>  
                                Question 4: ${mcq.getMcq().get(3).question}  ${mcq.getMcq().get(3).id}<br/><br/>
                                <input type="radio" name="g1" value="ans1"> ${mcq.getMcq().get(3).ans1}
                                <input type="radio" name="g1" value="ans2"> ${mcq.getMcq().get(3).ans2}
                                <input type="radio" name="g1" value="ans3"> ${mcq.getMcq().get(3).ans3}
                                <br/><br/><br/>
                                Question 5:  ${mcq.getMcq().get(4).question}  ${mcq.getMcq().get(4).id}<br/><br/>
                                <input type="radio" name="g2" value="ans1"> ${mcq.getMcq().get(4).ans1}
                                <input type="radio" name="g2" value="ans2">${mcq.getMcq().get(4).ans2}
                                <input type="radio" name="g2" value="ans3">${mcq.getMcq().get(4).ans3}
                                <br/><br/><br/>
                                Question 6:  ${mcq.getMcq().get(5).question}  ${mcq.getMcq().get(5).id}<br/><br/>
                                <input type="radio" name="g3" value="ans1"> ${mcq.getMcq().get(5).ans1}
                                <input type="radio" name="g3" value="ans2">${mcq.getMcq().get(5).ans2}
                                <input type="radio" name="g3" value="ans3">${mcq.getMcq().get(5).ans3}
                              
                                <br/><br/><br/>
                                Question 7: ${mcq.getMcq().get(6).question}  ${mcq.getMcq().get(6).id}<br/><br/>
                                <input type="radio" name="g1" value="ans1"> ${mcq.getMcq().get(6).ans1}
                                <input type="radio" name="g1" value="ans2"> ${mcq.getMcq().get(6).ans2}
                                <input type="radio" name="g1" value="ans3"> ${mcq.getMcq().get(6).ans3}
                                <br/><br/><br/>
                                Question 8:  ${mcq.getMcq().get(7).question}  ${mcq.getMcq().get(7).id}<br/><br/>
                                <input type="radio" name="g2" value="ans1"> ${mcq.getMcq().get(7).ans1}
                                <input type="radio" name="g2" value="ans2">${mcq.getMcq().get(7).ans2}
                                <input type="radio" name="g2" value="ans3">${mcq.getMcq().get(7).ans3}
                                <br/><br/><br/>
                                Question 9:  ${mcq.getMcq().get(8).question}  ${mcq.getMcq().get(8).id}<br/><br/>
                                <input type="radio" name="g3" value="ans1"> ${mcq.getMcq().get(8).ans1}
                                <input type="radio" name="g3" value="ans2">${mcq.getMcq().get(8).ans2}
                                <input type="radio" name="g3" value="ans3">${mcq.getMcq().get(8).ans3}
   
                                <br/><br/><br/>
                                Question 10:  ${mcq.getMcq().get(9).question}  ${mcq.getMcq().get(9).id}<br/><br/>
                                <input type="radio" name="g3" value="ans1"> ${mcq.getMcq().get(9).ans1}
                                <input type="radio" name="g3" value="ans2">${mcq.getMcq().get(9).ans2}
                                <input type="radio" name="g3" value="ans3">${mcq.getMcq().get(9).ans3}
                                </br>
                                <button type="button" id="add" class="btn btn-info" onclick="check()">Send</button>
                              
                                </div>
                            </form>

                    </div><!-- /main -->
                </div><!-- wrapper -->
            </div><!-- /container -->

            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="../../index.html" class="icon-home">Home</a>
                    <a href="../../admin/viewTuto.html" class="icon-news">Tutorials</a>
                    <a href="index.html" class="icon-star">Games</a>
                    <a href="../index.html" class="icon-star">Account</a>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a href="../../admin/viewUser.html" class="icon-upload">Administration</a>
                    </sec:authorize>
                    <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                </sec:authorize>
            </nav>
                </div>
        </center>
        <script src="<c:url value="/resources/js/menu.js" />"></script>
        <script src="<c:url value="/resources/js/classie.js" />"></script>
</body>
</html>
