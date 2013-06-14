<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ჩემი გვერდი</title>
<style>
.aStyle tr{
	height: 25px;
}

.aStyle tr td {	
	list-style: none;
	display: inline;
}

.aStyle tr td a {
	width: 180px;
	padding: 10px 25px 10px 25px;
	text-decoration: none;
	float: left;
	color: blue;
	background-color: rgb(200, 200, 200);
	border: 0px solid rgb(10, 10, 15);
	border-radius: 2px;
}

.aStyle tr td a:hover {
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<%long userId = ((User)request.getSession().getAttribute("user")).getId();%>
	<table style="margin: auto;">
		<tr>
			<td>
				<%@include file="menu-bar.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table>
					<tr align="center">
						<td background="clear_bg.png" align="center" style="background-repeat: no-repeat" width="793" height="22">
							<a style=" font-size: 16px; text-decoration: none; color: black;" href="my-page.jsp">ჩემი გვერდი</a>
					</td>
					</tr>
				</table>
			</td>
		</tr>	
		<tr>
			<td align="left">	
				<table class="aStyle">
					<tr>
						<td><a href="add-car.jsp">განცხადების დამატება</a></td>
					</tr>
					<tr>		
						<td><a href="MyCarsServlet?id=<%=userId%>">ჩემი განცხადებები</a></td>
					</tr>
					<tr>	
						<td><a href="profile-parameters.jsp">ანგარიშის რედაქტირება</a></td>
					</tr>
				</table>
			</td>
		</tr>	
	</table>
</body>
</html>