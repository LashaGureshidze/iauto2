<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (request.getSession().getAttribute("user") != null)
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
}
</style>
<%@include file="menu-bar.jsp"%>
</head>
<body>
	<div class="centerStyle" align="center">
		<p style="color:green;">თქვენ წარმატებით გაიარეთ რეგისტრაცია. გთხოვთ შეხვიდეთ სისტემაში.</p>
		<form method="post" action="LoginServlet">
			<table border="0" width="50%">
				<tr>
					<td class="reg_class_label">
						მომხმარებელი: 
					</td>
					<td class="reg_class_value">					
						<input type="text" size="20" name="username">
					</td>
				</tr>
				<tr>
					<td class="reg_class_label">
						პაროლი: 
					</td>
					<td class="reg_class_value">					
						<input type="password" size="20" name="password">
					</td>
				</tr>
			</table><br>
			<input type="submit" value="სისტემაში შესვლა" />
		</form>
	</div>
</body>
</html>