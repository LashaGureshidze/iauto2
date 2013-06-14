<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ge.iauto.server.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - პარამეტრების შეცვლა</title>
<%
	if(request.getSession().getAttribute("user")==null){
		request.getRequestDispatcher("log-in.jsp").forward(request, response);
	}else{
%>
<style>
#changeButton {
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

#changeButton:hover{
	background-color: #3399FF;
	color: black;
}

#backButton {
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

#backButton:hover{
	background-color: #888888;
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

<%
	User currUser = (User)(request.getSession().getAttribute("user"));
%>

<script type="text/javascript">
function validatePasswords() {
	if (document.getElementById("pass").value == document.getElementById("rpass").value &&
			document.getElementById("pass").value.length >= 6) return true;
	return false;
}

function checkStarFieldsMatch() {
	var oldUser = document.getElementById("oldUser").value;
	var oldPass = document.getElementById("oldPass").value;
	if (oldUser == '<%=currUser.getUsername()%>' && oldPass == '<%=currUser.getPassword()%>') return true;
	return false;
}

function checkOldUser() {
	document.getElementById("userErrorLabel").innerHTML="";
	var oldUser = document.getElementById("oldUser").value;
	if (oldUser.length == 0) {
		document.getElementById("changeButton").disabled = true;
		return;
	}
	if (checkStarFieldsMatch()) {
		if (checkAllFields()) document.getElementById("changeButton").disabled = false;
		return;
	}
	if (oldUser == '<%=currUser.getUsername()%>') return;
	document.getElementById("userErrorLabel").innerHTML="შეიყვანეთ სწორი username!";
	document.getElementById("changeButton").disabled = true;
}

function checkOldPassword() {
	document.getElementById("passErrorLabel").innerHTML="";
	var oldPass = document.getElementById("oldPass").value;
	if (oldPass.length == 0) {
		document.getElementById("changeButton").disabled = true;
		return;
	}
	if (checkStarFieldsMatch()) {
		if (checkAllFields()) document.getElementById("changeButton").disabled = false;
		return;
	}
	if (oldPass == '<%=currUser.getPassword()%>') return;
	document.getElementById("passErrorLabel").innerHTML="შეიყვანეთ სწორი პაროლი!";
	document.getElementById("changeButton").disabled = true;
}

function checkAllFields() {
	if (document.getElementById("newUsername").value.length != 0 ||
			document.getElementById("newEmail").value.length != 0 ||
			validatePasswords()) return true;
	return false;
}

function checkNewUserOrEmail() {
	if (checkStarFieldsMatch() && checkAllFields()) document.getElementById("changeButton").disabled = false;
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
	if (pass.length == 0 && rpass.length == 0) {
		if (checkStarFieldsMatch() && checkAllFields()) document.getElementById("changeButton").disabled = false;
		return;
	}
	if (pass != rpass) {
		document.getElementById(pos).innerHTML = st;
		document.getElementById("changeButton").disabled = true;
	} else {
		if (pass.length < 6) {
			document.getElementById("up").innerHTML="პაროლი უნდა შეიცავდეს მინიმუმ 6 სიმბოლოს!";
			document.getElementById("changeButton").disabled = true;
		} else if (checkStarFieldsMatch()) document.getElementById("changeButton").disabled = false;
	}
}
</script>

<%@include file="menu-bar.jsp"%>
</head>
<body>
	<fieldset class="fieldSet" style="background-color:rgb(240,240,240); width:770px; margin:auto;">
	<form action="ChangeParameterServlet" method="post">
	<table width="100%" border="0">
		<%
			@SuppressWarnings("unchecked")
			List<String> error = (List<String>)request.getAttribute("errorList");
		%>
		<tr>
			<td class="reg_class_label" style="width:300px;">
				ახალი username: 
			</td>
			<td class="reg_class_value">					
				<input class="field" id="newUsername" type="text" size="20" name="newUsername" <% if (error != null) out.println("value='" + request.getParameter("newUsername") + "'"); %> onchange="checkNewUserOrEmail()">
				<% if (error != null && error.get(0) != null) out.println("<font size='2' color='red' >" + error.get(0) + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				ახალი პაროლი: 
			</td>
			<td class="reg_class_value">					
				<input class="field" id="pass" type="password" size="20" name="password" onchange="checkPasswordMatch('up')">
				<% out.print("<font size='2' color='red' id='up'>" + "" + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				გაიმეორეთ ახალი პაროლი: 
			</td>
			<td class="reg_class_value">					
				<input class="field" id="rpass" type="password" size="20" name="rpassword" onchange="checkPasswordMatch('down')">
				<% out.print("<font size='2' color='red' id='down'>" + "" + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px;">
				ახალი ელ-ფოსტა: 
			</td>
			<td class="reg_class_value">					
				<input class="field" id="newEmail" type="text" size="20" name="newEmail" <% if (error != null) out.println("value='" + request.getParameter("newEmail") + "'"); %> onchange="checkNewUserOrEmail()">
				<% if (error != null && error.get(1) != null) out.println("<font size='2' color='red'>" + error.get(1) + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px; padding-top:30px;">
				ძველი username<font color="red">*</font>: 
			</td>
			<td class="reg_class_value" style="padding-top:30px;">					
				<input class="field" id="oldUser" type="text" size="20" name="oldUsername" onchange="checkOldUser()">
				<% out.print("<font size='2' color='red' id='userErrorLabel'>" + "" + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td class="reg_class_label" style="width:300px; padding-bottom:30px;">
				ძველი პაროლი<font color="red">*</font>: 
			</td>
			<td class="reg_class_value" style="padding-bottom:30px">					
				<input class="field" id="oldPass" type="password" size="20" name="oldPassword" onchange="checkOldPassword()">
				<% out.print("<font size='2' color='red' id='passErrorLabel'>" + "" + "</font>"); %>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<br><input id="changeButton" type="submit" value="პარამეტრების შეცვლა" disabled="disabled"/>
			</td>
			<td>
				<br><input id="backButton" type="button" value="< უკან" onclick="javascript:history.go(-1)">
			</td>
		</tr>
	</table>
	</form>
	</fieldset>
	<%}%>
</body>
</html>
