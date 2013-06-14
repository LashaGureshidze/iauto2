<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - რეგისტრაცია</title>
<style>
div.centerStyle {
    width:600px;
    height:100px;
    margin:auto;
}
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

#dzebna:hover {
	background-color: #3399FF;
	color: black;
}
.fieldSet {
	background-repeat: no-repeat;
	background-image: url(bg.png);
	box-shadow: 0 0 12px #AAAAAA;
	width: 770px;
	margin: auto;
	border-radius: 7px;
}
.field {
	border-radius: 3px;
}
.field:HOVER {
	border-color: #99CCFF;
}
</style>
<%@include file="menu-bar.jsp"%>
</head>
<body>
	<%
		String message = request.getParameter("message");
		if (message == null)
			message = "";
		else
			message = "სწორად შეავსეთ ველი";
	%>
	<div class="centerStyle" align="center">
		<p style="color:green;">თქვენ წარმატებით გაიარეთ რეგისტრაცია. გთხოვთ შეხვიდეთ სისტემაში.</p>
		<form method="post" action="LoginServlet">
			<fieldset class="fieldSet"
			style="background-color: rgb(240, 240, 240); width: 300px; margin: auto;">
			<table width="300px" border="0">
				<tr>
					<td class="reg_class_label" style="width: 300px;">მომხმარებელი<font
						color="red">*</font>:
					</td>
					<td class="reg_class_value"><input class="field" type="text" size="20"
						name="username"></td>
				</tr>
				<tr>
					<td class="reg_class_label" style="width: 300px;">პაროლი<font
						color="red">*</font>:
					</td>
					<td class="reg_class_value"><input class="field" type="password" size="20"
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
	</div>
</body>
</html>