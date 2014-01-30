<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Silent Ways</title>
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/js/modernizr.custom.25376.js" />"></script>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/testForm.js" />"></script>
        <script type="text/javascript">
            function testEmail(mail)
            {
                var id = ${user.id};
                var str = "";
                $.ajax
                        ({
                            type: "GET",
                            async: false,
                            url: "isEmailWithoutId.html",
                            data: {mail: mail, id: id},
                            success: function(response)
                            {
                                str = response;
                            },
                            error: function(e)
                            {
                                alert("ERREUR");
                            }
                        });
                return str;
            }
            function validateEmail(mail)
            {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(mail);
            }
            function testForm(pass1, pass2, mail1, mail2)
            {


                var str = "";
                var ok = true;

                if (pass1 !== pass2)
                {
                    alert("Pass");
                    ok = false;
                }
                if (mail1 !== "")
                {
                    if (validateEmail(mail1))
                    {
                        if (mail1 !== mail2)
                        {
                            ok = false;
                        }
                        else
                        {
                            str = testEmail(mail1);
                            if (str !== "")
                            {
                                ok = false;
                            }
                        }
                    }
                    else
                    {
                        ok = false;
                    }
                }
                return ok;
            }
            function edit()
            {
                var pass1 = $('#pass1').val();
                var pass2 = $('#pass2').val();
                var name = $('#name').val();
                var surname = $('#surname').val();
                var mail1 = $('#mail1').val();
                var mail2 = $('#mail2').val();
                var img = $('#img').val();
                var id = ${user.id};

                if (pass1 === "" && pass2 === "" && name === "" && surname === "" && mail1 === "" && mail2 === "" && img === "")
                {

                }
                else
                {
                    if (testForm(pass1, pass2, mail1, mail2))
                    {
                        $.ajax
                                ({
                                    type: "POST",
                                    url: "editUser.html",
                                    data: {password: pass1, name: name, surname: surname, mailAddress: mail1, id: id, img: img},
                                    success: function(response)
                                    {
                                        $('#info').html(response);
                                        $('#edt').hide();
                                    },
                                    error: function(e) {
                                        alert('Erroree ' + e);
                                    }
                                });
                    }
                }
            }


        </script>
    </head>
    <body>
        <div id="perspective" class="perspective effect-moveleft">
            <div class="container">
                <div class="wrapper"><!-- wrapper needed for scroll -->
                    <div class="main clearfix">     
                        <center>
                            <p><button id="showMenu">Menu</button></p>
                            <br />
                            <h1>Edit Account</h1>
                            <form id="edt">

                                Password : <br/>
                                <input type="password" id="pass1" placeholder=""><br/><br/>
                                Confirm password : <br/>
                                <input type="password" id="pass2" placeholder=""><br/><br/>
                                Name : <br/>
                                <input type="text" id="name" placeholder="${user.name}"><br/><br/>
                                Surname : <br/>
                                <input type="text" id="surname" placeholder="${user.surname}"><br/><br/>
                                Image : <br/>
                                <input type="text" id="img" placeholder="${user.img}"><br/><br/>
                                Email : <br/>
                                <input type="text" id="mail1" placeholder="${user.mailAddress}"><br/><br/>
                                Confirm Email : <br/>
                                <input type="text" id="mail2" placeholder="${user.mailAddress}"><br/><br/>

                                <button type="button" id="add" class="btn btn-success" onclick="edit()">Edit account</button>
                            </form>
                            <span id="info"></span><br/>
                            <a href="index.html"><button>Go back</button></a>
                        </center>
                    </div><!-- /main -->
                </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="../index.html" class="icon-home">Home</a>
                    <a href="#" class="icon-news">Tutorials</a>
                    <a href="../user/games/index.html" class="icon-star">Games</a>
                    <a href="<c:url value="../admin/viewUser.html"/>" class="icon-star">Administration</a>
                    <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                </sec:authorize>
            </nav> 
        </div>
        <script src="<c:url value="/resources/js/menu.js" />"></script>
        <script src="<c:url value="/resources/js/classie.js" />"></script>
    </body>
</html>
