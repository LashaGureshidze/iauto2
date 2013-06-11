<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (request.getHeader("referer") == null)
		request.getRequestDispatcher("home-page.jsp").forward(request, response);
	if (request.getHeader("referer") != null &&
			!((String)request.getHeader("referer")).equals("http://localhost:8080/IAUTO/Verification"))
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
</style>
</head>
<body>
	<div class="centerStyle" align="center">
		<p>თქვენ მიერ მითითებული დამადასტურებელი კოდი არ არის სწორი! გთხოვთ, შეიყვანოთ თავიდან.</p>
			<form method="post" action="Register">
				<input type="text" size="20" name="code">
				<input type="submit" value="დადასტურება"/>
			</form>
	</div>
</body>
</html>
