<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (request.getSession().getAttribute("user") != null)
		request.getRequestDispatcher("user-register-warning.jsp").forward(request, response);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - რეგისტრაცია</title>

<style>
#registerButton {
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

#registerButton.hover{
	background-color: #3399FF;
	color: black;
}
</style>

<script type="text/javascript">
function validatePasswords() {
	if (document.getElementById("pass").value == document.getElementById("rpass").value &&
			document.getElementById("pass").value.length >= 6) return true;
	return false;
}

function checkStarFields() {
	var username = document.getElementById("username").value;
	var email = document.getElementById("email").value;
	if (username.length > 0 && email.length > 0 && validatePasswords()) return true;
	return false;
}

function checkUsernameOrEmail() {
	if (checkStarFields()) document.getElementById("registerButton").disabled = false;
	else document.getElementById("changeButton").disabled = true;
}

function checkPasswordMatch(pos) {
	var st;
	if (pos == "up") st = "არ ემთხვევა ქვემოთ შეყვანილ პაროლს!";
	else st = "არ ემთხვევა ზემოთ შეყვანილ პაროლს!";
	var pass = document.getElementById("pass").value;
	var rpass = document.getElementById("rpass").value;
	document.getElementById("up").innerHTML="";
	document.getElementById("down").innerHTML="";
	if (pass.length == 0 && rpass.length == 0) return;
	if (pass != rpass) {
		document.getElementById(pos).innerHTML = st;
		document.getElementById("registerButton").disabled = true;
	} else {
		if (pass.length < 6) {
			document.getElementById("up").innerHTML="პაროლი უნდა შეიცავდეს მინიმუმ 6 სიმბოლოს!";
			document.getElementById("registerButton").disabled = true;
		} else if (checkStarFields()) document.getElementById("registerButton").disabled = false;
	}
}
</script>

<%@include file="menu-bar.jsp"%>
</head>
<body>
	<fieldset style="background-color:rgb(240,240,240); width:770px; margin:auto;">
	<form action="Verification" method="post">
	<table width="100%" border="0">
		<%
			@SuppressWarnings("unchecked")
			List<String> error = (List<String>)request.getAttribute("errorList");
		%>
		<tr>
			<td class="reg_class_label" style="width:300px;">
				მომხმარებელი (username)<font color="red">*</font>: 
			</td>
			<td class="reg_class_value">					
				<input id="username" type="text" size="20" name="username" <% if (error != null) out.println("value='" + request.getParameter("username") + "'"); %> onchange="checkUsernameOrEmail()">
				<% if (error != null && error.get(0) != null) out.println("<font size='2' color='red' >" + error.get(0) + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				პაროლი<font color="red">*</font>: 
			</td>
			<td class="reg_class_value">					
				<input id="pass" type="password" size="20" name="password" onchange="checkPasswordMatch('up')">
				<% if (error != null && error.get(1) != null) out.println("<font size='2' color='red'>" + error.get(1) + "</font>"); %>
				<% out.print("<font size='2' color='red' id='up'>" + "" + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				გაიმეორეთ პაროლი<font color="red">*</font>: 
			</td>
			<td class="reg_class_value">					
				<input id="rpass" type="password" size="20" name="rpassword" onchange="checkPasswordMatch('down')">
				<% out.print("<font size='2' color='red' id='down'>" + "" + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				სახელი: 
			</td>
			<td class="reg_class_value">					
				<input type="text" size="20" name="name" <% if (error != null) out.println("value='" + request.getParameter("name") + "'"); %> >
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				გვარი: 
			</td>
			<td class="reg_class_value">					
				<input type="text" size="20" name="lastname" <% if (error != null) out.println("value='" + request.getParameter("lastname") + "'"); %> >
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				ელ-ფოსტა<font color="red">*</font>: 
			</td>
			<td class="reg_class_value">					
				<input id="email" type="text" size="20" name="email" <% if (error != null) out.println("value='" + request.getParameter("email") + "'"); %> onchange="checkUsernameOrEmail()">
				<% if (error != null && error.get(2) != null) out.println("<font size='2' color='red'>" + error.get(2) + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				სქესი: 
			</td>
			<td class="reg_class_value">					
				<input type="radio" name="sex" value="male" checked='checked' >მამრობითი<br>
				<input type="radio" name="sex" value="female" <% if (error != null && request.getParameter("sex").equals("female")) out.println("checked='checked'"); %> >მდედრობითი
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				დაბადების წელი:
			</td>
			<td class="reg_class_value">					
				<select name="birthday">
				<%
					for (int i = 1913; i < 2004; i++)
						out.println("<option value='" + i + "'>" + i + "</option>");
				%>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center">
				<br><input id="registerButton" type="submit" value="რეგისტრაცია" disabled="disabled"/>
			</td>
		</tr>
	</table>
	</form>
	</fieldset>
</body>
</html>
