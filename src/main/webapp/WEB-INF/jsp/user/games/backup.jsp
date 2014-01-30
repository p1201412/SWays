<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SilentWays</title>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/js/modernizr.custom.25376.js" />"></script>
        <script src="<c:url value="/resources/js/audiosynth.js" />"></script>
        <script src="<c:url value="/resources/js/audiosynthView.js" />"></script>
        <style>

	.key { position: absolute; font-family: Helvetica; font-weight: 100; font-size: 12px;
		border: 1px solid rgba(32,32,32,0.2);
		border-radius: 0px 0px 5px 5px;
		cursor:pointer;
		box-shadow: 0px 5px 1px rgba(32,32,32,0.2);
		-webkit-transition: margin 0.05s ease, background-color 0.05s ease, box-shadow 0.05s ease; }
	.key:hover { background-color: rgb(255,192,32); }
		
	.key .label { position: absolute; bottom: 5px; text-align: center; left: 0px; right: 0px; }

	.black { background-color: rgb(32,32,32); color: #ffffff; z-index: 1; text-shadow: 0px -1px 1px rgba(255,255,255,0.5); }
	
	.white { background-color: #ffffff; color: rgb(32,32,32); z-index: 0; text-shadow: 0px 1px 1px rgba(32,32,32,0.5); }
	
	.source a { color: rgb(255,96,96); }
	.source a:link, .source a:visited, .source a:active { color: rgb(255,96,96); }
	.source a:hover { color: rgb(255,128,128); }
	
	.small { font-size: 20px; }
	
	.keyboard-options { margin: 30px auto; width: auto; text-align: center; font-size: 12px; font-weight: 200; padding:10px; }
	
	.keyboard-holder { margin: 30px auto; height: 200px; position:relative; user-select:none; -webkit-user-select:none;-moz-user-select:none;-o-user-select:none; }
        
        td
{
padding-left: 25px;
padding-right: 25px;
text-align: center;
}
        
</style>
    </head>
    <body>
        <script type="text/javascript">
    var piano = Synth.createInstrument('piano');
    var exercice = 0;
    var firstNote = '';
    var goodNote = '';
    
    

    $(document).ready(function() {
        
        
        
        
        $('#ex1').attr("disabled", false);
        $('#repeatEx1').hide();
        $('#validateEx1').hide();
        
        $('#ex2').attr("disabled", true);
        $('#repeatEx2').hide();
        $('#validateEx2').hide();
        
        $('#ex3').attr("disabled", true);
        $('#repeatEx3').hide();
        $('#validateEx3').hide();
        
        $('#to100').hide();
        $('#to200').hide();
        $('#to300').hide();
        
        if(${user.points}<100)
        {
            $("#to100").show();
        }
        else
        {
            if(${user.points}>=100 && ${user.points}<200 )
            {
                $("#to200").show();
            }
            else
            {
                if(${user.points}>=200 && ${user.points}<300)
                {
                    $("#to300").show();
                }
                else
                {
                    $("#over").show();
                }
            }
        }
        
        

       
    });


    function ex1()
    {
        $('#ex1').attr("disabled", true);
        $('#infoEx1').html("Find the minor third of the following note...");
        $('#repeatEx1').html("3");
        setTimeout(function() {$('#repeatEx1').html("2");},1000);
        setTimeout(function() {$('#repeatEx1').html("1");},2000);
        setTimeout(function() {$('#repeatEx1').html("0");},3000);
        setTimeout(function() {$('#repeatEx1').html("Repeat note");},4500);
        ex = 1;
        firstNote = 'C';
        goodNote = 'D#';
        setTimeout(function() {piano.play(firstNote, 4, 2);},4000);
        $('#repeatEx1').show();
        $('#validateEx1').show();
        
    }
    
    function ex2()
    {
        $('#ex2').attr("disabled", true);
        $('#infoEx2').html("Find the minor third of the following note...");
        $('#repeatEx2').html("3");
        setTimeout(function() {$('#repeatEx2').html("2");},1000);
        setTimeout(function() {$('#repeatEx2').html("1");},2000);
        setTimeout(function() {$('#repeatEx2').html("0");},3000);
        setTimeout(function() {$('#repeatEx2').html("Repeat note");},4500);
        ex = 2;
        firstNote = 'F';
        goodNote = 'G#';
        setTimeout(function() {piano.play(firstNote, 4, 2);},4000);
        $('#repeatEx2').show();
        $('#validateEx2').show();
        
    }
    
    function ex3()
    {
        $('#ex3').attr("disabled", true);
        $('#infoEx3').html("Find the major third of the following note...");
        $('#repeatEx3').html("3");
        setTimeout(function() {$('#repeatEx3').html("2");},1000);
        setTimeout(function() {$('#repeatEx3').html("1");},2000);
        setTimeout(function() {$('#repeatEx3').html("0");},3000);
        setTimeout(function() {$('#repeatEx3').html("Repeat note");},4500);
        ex = 3;
        firstNote = 'F';
        goodNote = 'A';
        setTimeout(function() {piano.play(firstNote, 4, 2);},4000);
        $('#repeatEx3').show();
        $('#validateEx3').show();
        
    }
    
    function addPoints(points)
    {
        $.ajax
                ({
                    type: "POST",
                    url: "add.html",
                    data : {points : points},
                    success: function(response)
                    {
                        $('#points').html(response);
                    },
                    error: function(e){
                    alert('Erroree');
                    }
                });
    }
    
    function repeat()
    {
        piano.play(firstNote, 4, 2);
    }
    
    function validate()
    {
        var note = document.getElementById("info").innerHTML;
        if (goodNote===note)
        {
            if(ex===1)
            {
                $('#repeatEx1').hide();
                $('#validateEx1').hide();
                $('#infoEx1').hide();
                $('#ex1').css('background-color','green');
                $('#ex2').attr("disabled", false);
            }
            if(ex===2)
            {
                $('#repeatEx2').hide();
                $('#validateEx2').hide();
                $('#infoEx2').hide();
                $('#ex2').css('background-color','green');
                $('#ex3').attr("disabled", false);
            }
            if(ex===3)
            {
                $('#repeatEx3').hide();
                $('#validateEx3').hide();
                $('#infoEx3').hide();
                $('#ex3').css('background-color','green');
            }
            addPoints(10);
            
        }
        else
        {
            addPoints(-3);
        }
    }
    
    
    
    
    
    
        </script>
        
        <div id="perspective" class="perspective effect-moveleft">
    <div class="container">
        <div class="wrapper"><!-- wrapper needed for scroll -->
            <div class="main clearfix">     
                <center>
                    <p><button id="showMenu">Menu</button></p>
                    <h1>Interval exercices</h1>
                    <div class="infoUser">
                        <h4><img src="${user.img}" alt="userImg"/><br/><br/>
                            Points : <span id="points">${user.points}</span></h4>
                    </div>
                    
                    <h2>Note : <span id="info">&nbsp;</span></h2>
                    <div ID="keyboard" class="keyboard-holder"></div>
                    
<div id="to100">
        <h3>Exercices from 0 to 100 points</h3>

    <table border="0">
    <tr>
        <th>
            <button id="ex1" onclick="ex1()">Ex 1</button>
        </th>
        <th><button id="ex2" onclick="ex2()">Ex 2</button></th>
        <th><button id="ex3" onclick="ex3()">Ex 3</button></th>
    </tr>
    <tr>
        <td><h4><div id="infoEx1"></div></h4></td>
        <td><h4><div id="infoEx2"></div></h4></td>
        <td><h4><div id="infoEx3"></div></h4></td>
    </tr>
    <tr>
        <td><button id="repeatEx1" onclick="repeat()">Repeat Note</button><br/>
            <button id="validateEx1" onclick="validate()">Validate</button></td>
        <td><button id="repeatEx2" onclick="repeat()">Repeat Note</button><br/>
            <button id="validateEx2" onclick="validate()">Validate</button></td>
        <td><button id="repeatEx3" onclick="repeat()">Repeat Note</button><br/>
            <button id="validateEx3" onclick="validate()">Validate</button></td>
    </tr>

    </table> 
</div>
    
<div id="to200">
<h3>Exercices from 100 to 200 points</h3>

<table border="0">
<tr>
    <th>
        <button id="ex1" onclick="ex1()">Ex 1</button>
    </th>
    <th><button id="ex2" onclick="ex2()">Ex 2</button></th>
    <th><button id="ex3" onclick="ex3()">Ex 3</button></th>
</tr>
<tr>
    <td><h4><div id="infoEx1"></div></h4></td>
    <td><h4><div id="infoEx2"></div></h4></td>
    <td><h4><div id="infoEx3"></div></h4></td>
</tr>
<tr>
    <td><button id="repeatEx1" onclick="repeat()">Repeat Note</button><br/>
        <button id="validateEx1" onclick="validate()">Validate</button></td>
    <td><button id="repeatEx2" onclick="repeat()">Repeat Note</button><br/>
        <button id="validateEx2" onclick="validate()">Validate</button></td>
    <td><button id="repeatEx3" onclick="repeat()">Repeat Note</button><br/>
        <button id="validateEx3" onclick="validate()">Validate</button></td>
</tr>

</table> 
</div>

<div id="to300">
<h3>Exercices from 200 to 300 points</h3>

<table border="0">
<tr>
    <th>
        <button id="ex1" onclick="ex1()">Ex 1</button>
    </th>
    <th><button id="ex2" onclick="ex2()">Ex 2</button></th>
    <th><button id="ex3" onclick="ex3()">Ex 3</button></th>
</tr>
<tr>
    <td><h4><div id="infoEx1"></div></h4></td>
    <td><h4><div id="infoEx2"></div></h4></td>
    <td><h4><div id="infoEx3"></div></h4></td>
</tr>
<tr>
    <td><button id="repeatEx1" onclick="repeat()">Repeat Note</button><br/>
        <button id="validateEx1" onclick="validate()">Validate</button></td>
    <td><button id="repeatEx2" onclick="repeat()">Repeat Note</button><br/>
        <button id="validateEx2" onclick="validate()">Validate</button></td>
    <td><button id="repeatEx3" onclick="repeat()">Repeat Note</button><br/>
        <button id="validateEx3" onclick="validate()">Validate</button></td>
</tr>

</table> 
</div>
</div><!-- /main -->
                    </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav right vertical">
                <img style="margin-left: -70px; margin-bottom: 30px;" src="<c:url value="/resources/img/head.png" />"/>
                <sec:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                    <a href="../../index.html" class="icon-home">Home</a>
                    <a href="#" class="icon-news">Tutorials</a>
                    <a href="#" class="icon-star">Games</a>
                    <a href="../index.html" class="icon-star">Account</a>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a href="../admin/viewUser.html" class="icon-upload">Administration</a>
                    </sec:authorize>
                    <a href="<c:url value="/j_spring_security_logout" />" class="icon-lock">Logout</a>
                </sec:authorize>
            </nav> 
</div>
<script src="<c:url value="/resources/js/menu.js" />"></script>
<script src="<c:url value="/resources/js/classie.js" />"></script>
<script type="text/javascript">

var a = new AudioSynthView();
a.draw();

</script>
</body>
</html>
