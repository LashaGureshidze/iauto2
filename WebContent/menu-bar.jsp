<%@page import="ge.iauto.server.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge</title>

<style type="text/css">
.menu {
	height: 25px;
}

.menu td {
	list-style: none;
	display: inline;
}

.menu td a {
	text-shadow: 0 0 0.2em #000;
	padding: 10px 25px 10px 25px;
	text-decoration: none;
	float: left;
	color: black;
	background-color: rgb(200, 200, 200);
	border: 0px solid rgb(10, 10, 15);
	border-radius: 2px;
}

.menu td a:hover {
	background-color: #3399FF;
	color: white;
}
</style>
</head>
<body background="bg.png">
	<table align="center">
		<tr>
			<td>
				<table>
					<tr class="menu">
						<td><a href="/IAUTO/HomeServlet">მთავარი</a></td>
						<td><a href="/IAUTO/MyPageServlet">ჩემი გვერდი</a></td>
						<td><a href="/IAUTO/CalculatorServlet">განბჟების
								კალკულატორი</a></td>
						<%
							if (request.getSession().getAttribute("user") == null) {
						%>
						<td><a href="/IAUTO/RegisterServlet">რეგისტრაცია</a></td>
						<td><a href="log-in.jsp">შესვლა</a></td>
						<%
							} else {
								User user = (User) request.getSession().getAttribute("user");
								String name = user.getUsername();
						%>
						<td><a href="/IAUTO/MyPageServlet"><%=name%> </a></td>
						<td><a href="/IAUTO/LogoutServlet">გამოსვლა</a></td>
						<%
							}
						%>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><a href="/IAUTO/HomeServlet"><img src="iautoLogo.gif"
					width="300" height="80" style="border: 0px solid rgb(10, 10, 15)"></a>
				<a href="/IAUTO/AddCar"><img alt="" src="add.png"
					style="vertical-align: 70%; border: 0px solid rgb(10, 10, 15)"></a>
				<a href="https://www.facebook.com/pages/IAutoge/155285524650712" target="_blank"><img
					src="facebook_share.png" width="140" height="50"
					style="border: 0px solid rgb(10, 10, 15); vertical-align: 70%" /></a></td>
		</tr>
	</table>
</body>
</html>