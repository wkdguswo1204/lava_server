<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Test</title>
<link rel="stylesheet" href="../css/w3.css">
<link rel="stylesheet" href="../css/user.css">
</head>
<%
	String pid = request.getParameter("id");
	String ppw = request.getParameter("pw");
	
	if(pid != null && pid.length() != 0){
		session.setAttribute("SID", pid);
	}
	
/* 	
	// forward
	RequestDispatcher rd = request.getRequestDispatcher("/day03.Test02.jsp");
	rd.forward(request, response); */
/*
	// redirect 방식
	response.sendRedirect("Test02.jsp");
*/
%>
<jsp:forward page="/day03/Test02.jsp" >
	<jsp:param name="job" value="반장님" />
	<jsp:param name="tel" value="010-9292-4184" />
	<jsp:param name="mail" value="dDragon@increpas.com" />
</jsp:forward>
<body>
	<div class="W3-content mxw">
	<h2 class="w3-padding w3-blue w3-center w3-card-4 w3-maring-top">Test01.jsp</h2>
		<div class="w3-col w3-padding w3-card">
		<div class="w3-col">
			<h3 class="w3-col m4">I D : </h3>
			<h3 class="w3-col m8"><%=pid %> </h3>
			</div>
		<div class="w3-col">
		
			<h3 class="w3-col m4">P W : </h3>
			<h3 class="w3-col m8"><%=ppw %> </h3>
			</div>
		</div>
	</div>
</body>
</html>