<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SilentWays</title>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">   
        
    </head>
    <body>
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
            </div>
            <br/>
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
            </div>
            <br/>
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
            </div>
            <br/>
            <br/><br/><br/>
            Question 10:  ${mcq.getMcq().get(9).question}  ${mcq.getMcq().get(9).id}<br/><br/>
            <input type="radio" name="g3" value="ans1"> ${mcq.getMcq().get(9).ans1}
            <input type="radio" name="g3" value="ans2">${mcq.getMcq().get(9).ans2}
            <input type="radio" name="g3" value="ans3">${mcq.getMcq().get(9).ans3}
            </div>
            <br/>
            <button type="button" id="add" class="btn btn-info" onclick="check()">Send</button>
        </form>
          
    </body>
</html>
