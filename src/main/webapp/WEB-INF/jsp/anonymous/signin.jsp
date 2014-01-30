<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SilentWays</title>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/js/modernizr.custom.25376.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/testForm.js" />"></script>
        <script type="text/javascript">
            

            $(document).ready(function() {
                $('#bForm').hide();
                $('#bPseudo').hide();
                $('#bPass').hide();
                $('#bMail').hide();
                $('#bMail2').hide();
                $('#bMail3').hide();
                $('#info').hide();
            });    
        
        
        function testForm(pseudo,pass1,pass2,name,surname,mail1,mail2)
        {
            var ok = true;
            var str = "";
            if(!(pseudo&&pass1&&pass2&&name&&surname&&mail1&&mail2))
            {
                $('#bForm').html("Please complete all the form");
                $('#bForm').show(500);
                ok=false;
            }
            else
            {
                $('#bForm').hide(500);
            }
                
            if(!testPasswords(pass1,pass2))
            {
                $('#bPass').html("Passwords dont match");
                $('#bPass').show(500);
                ok=false;
            }
            else
            {
                $('#bPass').hide(500);
            }
            if(!testEmails(mail1,mail2))
            {
                $('#bMail2').html("Emails dont match");
                $('#bMail2').show(500);
                ok=false;
            }
            else
            {
                $('#bMail2').hide(500);
            }
            if(!validateEmail(mail1))
            {
                $('#bMail').html("Email is not valid");
                $('#bMail').show(500);
                ok=false;
            }
            else
            {
                $('#bMail1').hide(500);
            }
            str = testPseudoExist(pseudo);
            if(str!=="")
            {
                $('#bPseudo').html(str);
                $('#bPseudo').show(500);
                ok=false;
            }
            else
            {
                $('#bPseudo').hide(500);
            }
            str = testEmailExist(mail1);
            if(str!=="")
            {
                $('#bMail3').html(str);
                $('#bMail3').show(500);
                ok=false;
            }
            else
            {
                $('#bMail3').hide(500);
            }
            return ok;
        }
        
        
        function addUser() 
        {
            // get the form values
            var pseudo = $('#pseudo').val();
            var pass1 = $('#pass1').val();
            var pass2 = $('#pass2').val();
            var name = $('#name').val();
            var surname = $('#surname').val();
            var mail1 = $('#mail1').val();
            var mail2 = $('#mail2').val();

            //Test and print
            if(testForm(pseudo,pass1,pass2,name,surname,mail1,mail2))
            {
                $.ajax
                ({
                    type: "POST",
                    url: "addUser.html",
                    data : { pseudo : pseudo, password : pass1, name : name, surname : surname, mailAddress : mail1 },
                    success: function(response)
                    {
                        // we have the response
                        $('#info').html(response);
                        $('#info').show(700);
                        $('#pseudo').val('');
                        $('#sin').hide(1000);
                    },
                    error: function(e){
                    alert('Erroree ' + e);
                    }
                });
            }  
        }
        </script>
    </head>
    <body>
<div id="perspective" class="perspective effect-moveleft">
    <div class="container">
        <div class="wrapper"><!-- wrapper needed for scroll -->
            <div class="main clearfix">
                <p><button id="showMenu">Menu</button></p>
                    <center>
                        <h1>Sign In</h1>
                        <form id="sin">
                            <div id="lblTop"></div>
                            Pseudo : <br/>
                            <input type="text" id="pseudo"><br/><br/>
                            Password : <br/>
                            <input type="password" id="pass1"><br/><br/>
                            Confirm password :  <br/>
                            <input type="password" id="pass2"><br/><br/>
                            Name : <br/>
                            <input type="text" id="name"><br/><br/>
                            Surname : <br/>
                            <input type="text" id="surname"><br/><br/>
                            Email :  <br/>
                            <input type="text" id="mail1"><br/><br/>
                            Confirm Email :  <br/>
                            <input type="text" id="mail2"><br/><br/>
                            <button type="button" id="add" class="btn btn-success" onclick="addUser()">Sign In</button><br/><br/><br/>
                            <div class="alerts">
                            <span id="bForm" class="alert"></span>
                            <span id="bPseudo" class="alert"></span>
                            <span id="bPass" class="alert"></span>
                            <span id="bMail" class="alert"></span>
                            <span id="bMail2" class="alert"></span>
                            <span id="bMail3" class="alert"></span>
                            </div>
                        </form>
                        <span id="info" class="alert"></span>

                    </center>
                </div><!-- /main -->
            </div><!-- wrapper -->
        </div><!-- /container -->
        <nav class="outer-nav right vertical">
            <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <a href="index.html" class="icon-home">Home</a>
                <a href="login.html" class="icon-lock">Login</a>
        </nav>
    </div>
    <script src="<c:url value="/resources/js/menu.js" />"></script>
    <script src="<c:url value="/resources/js/classie.js" />"></script>
</body>
</html>
