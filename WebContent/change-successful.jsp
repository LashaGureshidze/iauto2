<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (request.getSession().getAttribute("user") == null)
		request.getRequestDispatcher("home-page.jsp").forward(request, response);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - რეგისტრაცია</title>
<style>
div.centerStyle {
    width:600px;
    height:100px;
    margin:auto;
    color:green;
}
#myPageButton {
	background: #A8A8A8;
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

#myPageButton.hover{
	background-color: #3399FF;
	color: black;
}
</style>
<%@include file="menu-bar.jsp"%>
</head>
<body>
	<div class="centerStyle" align="center">
		<p>პარამეტრების შეცვლა წარმატებით განხორციელდა.</p>
	</div>
	<div align="center">
		<a id="myPageButton" href="/IAUTO/MyPageServlet">ჩემს გვერდზე დაბრუნება</a>
	</div>
</body>
</html>