<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (request.getHeader("referer") == null)
		request.getRequestDispatcher("home-page.jsp").forward(request, response);
	if (request.getHeader("referer") != null &&
			!((String)request.getHeader("referer")).equals("http://localhost:8080/IAUTO/RegisterServlet") &&
			!((String)request.getHeader("referer")).equals("http://localhost:8080/IAUTO/user-register.jsp"))
		request.getRequestDispatcher("home-page.jsp").forward(request, response);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - რეგისტრაცია</title>
<%@include file="menu-bar.jsp"%>
<style>
div.centerStyle {
    width:600px;
    height:100px;
    margin:auto;
}
.submitButton {
	background: #66CCFF;
	padding: 3px 17px;
	color: black;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 15px;
	border-radius: 2px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border: 0px solid rgb(213, 150, 17);
	cursor: pointer;
}

.submitButton:HOVER {
	background-color: #3399FF;
	color: black;
}
.field {
	border-radius: 2px;
}
.field:HOVER {
	border-color: #99CCFF;
}
</style>
</head>
<body>
	<div class="centerStyle" align="center">
		<p>თქვენ მიერ მითითებულ ელექტრონულ ფოსტაზე გამოგეგზავნათ დამადასტურებელი კოდი.<br>
		გთხოვთ, შეიყვანოთ აღნიშნული კოდი ქვემოთ მოცემულ ტექსტურ ველში.</p>
			<form method="post" action="Register">
				<input class="field" type="text" size="20" name="code">
				<input class="submitButton" type="submit" value="დადასტურება"/>
			</form>
	</div>
</body>
</html>