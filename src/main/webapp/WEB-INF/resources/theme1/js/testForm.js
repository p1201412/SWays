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