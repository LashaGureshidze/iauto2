<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ჩემი გვერდი</title>
<style>
.center {
	margin: auto;
	width: 700px;
}
.aStyle2 {
	color: rgb(140, 140, 140);
	font-weight: bold;
	font-size: 13px;
	text-decoration: none;
}
.aStyle2:HOVER {
	color: #3399FF;
	font-weight: bold;
	font-size: 13px;
	text-decoration: none;
}
</style>
</head>
<body>

	<%@include file="menu-bar.jsp"%>
	<div class="center">
		<table>
			<tr align="center">
				<td height="25px">
					<div style="background-repeat: no-repeat; background-image: url(clear_bg.png); background-size: 700px 25px; height: 25px; width: 700px;">
						<a style="font-weight: bold; font-size: 13px; text-decoration: none; color: #ffffff;"
						href="my-page.jsp">ჩემი გვერდი</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="center"
		style="font-family: verdana; padding: 5px; border-radius: 3px; border: 2px solid #D8D8D8; box-shadow: 4px 4px 21px -4px #858585;">
		<table>
			<tr align="center">
				<td width="25%" valign="top" align="left"><a
					class="aStyle2" href="add-cars.jsp">განცხადების დამატება</a> <br> <a
					class="aStyle2" href="/IAUTO/MyCarsServlet">ჩემი განცხადებები</a> <br> <a
					class="aStyle2" href="profile-parameters.jsp">ანგარიშის რედაქტირება</a> <br> <a
					class="aStyle2" href="profile-parameters.jsp">პაროლის შეცვლა</a> <br> <a
					class="aStyle2" href="/IAUTO/LogoutServlet">გასვლა</a><br></td>
			</tr>
		</table>
	</div>
</body>
</html>