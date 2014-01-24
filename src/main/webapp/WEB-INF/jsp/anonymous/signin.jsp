<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Add Users using ajax</title>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript">
        function testPseudoExist(pseudo)
        {
            var str = "";
            $.ajax
            ({
                type: "GET",
                async: false,
                url: "isPseudoExist.html",
                data: "pseudo=" + pseudo,
                success: function(response)
                {
                    str=response;
                },
                error: function(e)
                {
                    return "Error from server" + e;
                }
            });
            return str;
        }
        
              
        function testEmailExist(mail)
        {
            var str = "";
            $.ajax
            ({
                type: "GET",
                async: false,
                url: "isEmailExist.html",
                data: "mail=" + mail,
                success: function(response)
                {
                    str=response;
                },
                error: function(e)
                {
                    return "Error from server" + e;
                }
            });
            return str;
        }
        
        function testPasswords(p1,p2)
        {
            return p1===p2;
        }
        
        function testEmails(e1,e2)
        {
            return e1===e2;
        }
        
        function validateEmail(mail) 
        { 
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(mail);
        } 
        
        function testForm(pseudo,pass1,pass2,name,surname,mail1,mail2)
        {
            var ok = true;
            var str = "";
            if(!(pseudo&&pass1&&pass2&&name&&surname&&mail1&&mail2))
            {
                $('#lblTop').html("Please complete all the form");
                ok=false;
            }
            else
            {
                $('#lblTop').html("");
            }
                
            if(!testPasswords(pass1,pass2))
            {
                $('#lblPassword').html("Passwords don't match");
                ok=false;
            }
            else
            {
                $('#lblPassword').html("");
            }
            if(!testEmails(mail1,mail2))
            {
                $('#lblMail2').html("Emails don't match");
                ok=false;
            }
            else
            {
                $('#lblMail2').html("");
            }
            if(!validateEmail(mail1))
            {
                $('#lblMail').html("Email is not valid");
                ok=false;
            }
            else
            {
                $('#lblMail').html("");
            }
            str = testPseudoExist(pseudo);
            if(str!=="")
            {
                $('#lblPseudo').html(str);
                ok=false;
            }
            else
            {
                $('#lblPseudo').html("");
            }
            str = testEmailExist(mail1);
            if(str!=="")
            {
                $('#lblMail').html(str);
                ok=false;
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
                    url: "add.html",
                    data: "pseudo=" + pseudo,
                    success: function(response)
                    {
                        // we have the response
                        $('#info').html(response);
                        $('#pseudo').val('');
                    },
                    error: function(e){
                    alert('Error ' + e);
                    }
                });
            }  
        }
        </script>
    </head>
    <body>
        <h1>Sign In</h1>
        <form id="sin">
            <div id="lblTop"></div>
            Pseudo : <input type="text" id="pseudo"><div id="lblPseudo"></div><br/>
            Password : <input type="password" id="pass1"><div id="lblPassword"></div><br/>
            Confirm password : <input type="password" id="pass2"><br/>
            Name : <input type="text" id="name"><br/>
            Surname : <input type="text" id="surname"></div><br/>
            Email : <input type="text" id="mail1"><div id="lblMail"></div><br/>
            Confirm Email : <input type="text" id="mail2"><div id="lblMail2"></div><br/>
            <input type="button" value="Sign In" onclick="addUser()"><br/>
            <div id="info"></div>
        </form>

    </body>
</html>
