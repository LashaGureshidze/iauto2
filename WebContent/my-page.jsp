<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ჩემი გვერდი</title>
<style>
a:hover,a:active {
	font-family: monospace;
}

a:visited,a:link {
	text-decoration: none;
}

a:visited,a:link {
	color: black;
}

a:hover,a:active {
	color: orange;
}

.center {
	margin: auto;
	width: 70%;
}
</style>
</head>
<body>

	<%@include file="menu-bar.jsp"%>
	<div class="center">
		<table>
			<tr align="center">
				<td background="clear_bg.png" align="center"
					style="background-repeat: no-repeat" width="793" height="22"><a
					style="font-weight: bold; font-size: 13px; text-decoration: none; color: #ffffff;"
					href="my-page.jsp">ჩემი გვერდი</a></td>
			</tr>
		</table>
	</div>
	<div class="center"
		style="font-family: verdana; padding: 5px; border-radius: 5px; border: 2px solid #3399FF;">
		<table>
			<tr align="center">

				<td width="25%" valign="top" align="left"><a
					href="add-cars.jsp">განცხადების დამატება</a> <br> <a
					href="my-cars.jsp">ჩემი განცხადებები</a> <br> <a
					href="profile-parameters.jsp">ანგარიშის რედაქტირება</a> <br> <a
					href="profile-parameters.jsp">პაროლის შეცვლა</a> <br> <a
					href="/IAUTO/LogoutServlet">გასვლა</a><br></td>
			</tr>
		</table>
	</div>
</body>
</html>