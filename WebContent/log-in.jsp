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
<title>შესვლა</title>
<style type="text/css">
#dzebna {
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

#dzebna.hover {
	background-color: #3399FF;
	color: black;
}
</style>
</head>
<body bgcolor=#A0A0A0>
	<%@include file="menu-bar.jsp"%>
	<%
		String message = request.getParameter("message");
		if (message == null)
			message = "";
		else
			message = "სწორად შეავსეთ ველი";
	%>
	<form action="LoginServlet" method="post">
		<fieldset
			style="background-color: rgb(240, 240, 240); width: 300px; margin: auto;">
			<table width="300px" border="0">
				<tr>
					<td class="reg_class_label" style="width: 300px;">მომხმარებელი<font
						color="red">*</font>:
					</td>
					<td class="reg_class_value"><input type="text" size="20"
						name="username"></td>
				</tr>
				<tr>
					<td class="reg_class_label" style="width: 300px;">პაროლი<font
						color="red">*</font>:
					</td>
					<td class="reg_class_value"><input type="password" size="20"
						name="password"></td>
				</tr>
				<tr>
					<td align="center"><br> <input id="dzebna" type="submit"
						value="შესვლა" /></td>
					<td align="center"><font
						color="red" size="3px"><%=message%></font></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>