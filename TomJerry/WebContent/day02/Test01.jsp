<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test01 JSP Page</title>
<link rel="stylesheet" href="../css/w3.css">
<link rel="stylesheet"href="../css/user.css">
</head>
<%
	int num1 = 1;
%>
<body>
	<div class="w3-content w3-center mxw">
	<%@ include file="sub01.jsp" %>
		<div class="m3 w3-blue box">box1<%=num1++ %></div>
		<div class="m3 w3-blue box">box2<%=num1++ %></div>
		<div class="m3 w3-blue box">box3<%=num1++ %></div>
	</div>
</body>
</html>