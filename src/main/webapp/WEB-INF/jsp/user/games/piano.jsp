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
            var firstNote = '';
            var goodNote = '';
            var ex;



            $(document).ready(function() {
                $('#ex1').attr("disabled", false);
                $('#repeatEx1').hide();
                $('#validateEx1').hide();
            });


            function ex1()
            {
                //Charger exo aléatoire dans l'interval
                $('#ex1').attr("disabled", true);
                $('#repeatEx1').attr("disabled", false);
                $('#validateEx1').attr("disabled", false);
                $('#infoEx1').html("Find the minor third of the following note...");
                $('#repeatEx1').html("3");
        setTimeout(function() {$('#repeatEx1').html("2");},1000);
        setTimeout(function() {$('#repeatEx1').html("1");},2000);
        setTimeout(function() {$('#repeatEx1').html("0");},3000);
        setTimeout(function() {$('#repeatEx1').html("Repeat note");},4500);
                firstNote = '${keys.get(0).noteD}';
                goodNote = '${keys.get(0).noteA}';
        ex=1;
        setTimeout(function() {piano.play(firstNote, 4, 2);},4000);
                $('#repeatEx1').show();
                $('#validateEx1').show();

            }

            function ex2()
            {
                //Charger exo aléatoire dans l'interval
                $('#ex2').attr("disabled", true);
                $('#repeatEx2').attr("disabled", false);
                $('#validateEx2').attr("disabled", false);
                $('#infoEx2').html("Find the minor third of the following note...");
                $('#repeatEx2').html("3");
        setTimeout(function() {$('#repeatEx2').html("2");},1000);
        setTimeout(function() {$('#repeatEx2').html("1");},2000);
        setTimeout(function() {$('#repeatEx2').html("0");},3000);
        setTimeout(function() {$('#repeatEx2').html("Repeat note");},4500);
                firstNote = '${keys.get(1).noteD}';
                goodNote = '${keys.get(1).noteA}';
        ex=2;
        setTimeout(function() {piano.play(firstNote, 4, 2);},4000);
                $('#repeatEx2').show();
                $('#validateEx2').show();

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
                                alert('Error');
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
            switch(ex)
                    {
                        case 1:
                            $('#repeatEx1').hide();
                            $('#validateEx1').hide();
                            $('#infoEx1').hide();
                            $('#ex1').attr("disabled", false);
                            break;
                        case 2:
                            $('#repeatEx2').hide();
                            $('#validateEx2').hide();
                            $('#infoEx2').hide();
                            $('#ex2').attr("disabled", false);

                            break;
                    }
                    addPoints(${keys.get(ex).win});

                }
                else
                {
                    addPoints(${keys.get(ex).loose});
                }


            }


        </script>
        <c:url var="pianoUrl" value="index.html" />
        <div id="perspective" class="perspective effect-moveleft">
            <div class="container">
                <div class="wrapper"><!-- wrapper needed for scroll -->
                    <div class="main clearfix">     
                        <center>
                            <p><button id="showMenu">Menu</button></p>
                            <h1>Interval exercices</h1>
                            <div class="infoUser">
                                <h4><img src="${user.img}" alt="userImg"/><br/><br/>
                                    Points : <span id="points">${user.points}</span><br/>
                            </div>

                            <h2>Note : <span id="info">&nbsp;</span></h2>
                            <div ID="keyboard" class="keyboard-holder"></div>

                    
         
                            <button id="ex1" onclick="ex1()">Play</button>
                            <h4><div id="infoEx1"></div></h4>
                            <button id="repeatEx1" onclick="repeat()">Repeat Note</button><br/>
                            <button id="validateEx1" onclick="validate()">Validate</button>
                            <hr/>
                            <!--<button id="ex2" onclick="ex2()">Play</button>
                            <h4><div id="infoEx2"></div></h4>
                            <button id="repeatEx2" onclick="repeat()">Repeat Note</button><br/>
                            <button id="validateEx2" onclick="validate()">Validate</button>
                            -->
                            </br></br>
                            <a href="${pianoUrl}"><button class="btn btn-primary">Go Back</button></a>
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
        <script src="<c:url value="/resources/js/menu.js" />"></script>
        <script src="<c:url value="/resources/js/classie.js" />"></script>
        <script type="text/javascript">

                                var a = new AudioSynthView();
                                a.draw();

        </script>
    </body>
</html>
