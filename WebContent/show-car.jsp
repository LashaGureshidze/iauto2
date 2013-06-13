<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ვრცლად</title>
<style>
.center {
	margin: auto;
	width: 800px;
}
.paramTable {
	border: 2px solid #D8D8D8;
	box-shadow: 4px 4px 21px -4px #858585;
	text-shadow: rgba(180, 78, 78, 0.22) 0.1em 0.1em 0.2em;
	font-weight: normal;
	margin: auto;
}
</style>
</head>

<%
	Car c = (Car)request.getAttribute("carToShow");
%>

<script type="text/javascript">
	function changeImage(image) {
		document.getElementById("big_photo").style.backgroundImage =
			"url(ImageServlet?id=" + <%=c.getId()%> + "&photoId=photo" + image + ")";
	}
</script>

<body>
	<%@include file="menu-bar.jsp"%>
	<div class="center">
		<table class="paramTable" align="center" style="margin: auto; padding-top: 5px;" width="100%" border="0"
			cellpadding="0" cellspacing="0">
			<tbody>
				<tr valign="top">
					<td align="center" width="680px" height="500px" style="position: relative;"
						id="mydeal_hover">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="640px" height="480px" align="left" valign="top">&nbsp;
										<div style="cursor: pointer; margin-top: -18px; background-image: url(ImageServlet?id=<%=c.getId()%>&photoId=photo1);
											 background-size: 100% ; width: 640px; height: 480px; border: 1px solid rgb(204, 204, 204); 
											 background-color: rgb(190, 190, 190); background-position: initial initial;
											 background-repeat: no-repeat;"
											 id="big_photo">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td align="center" width="500" height="480px">
						<div
							style="margin-top: -8px; margin-left: -2px; padding: 5px; z-index: 9999; overflow: hidden; height: 455px; position: absolute;">
							<table height="480px" width="100%" border="0" cellpadding="0" cellspacing="0">
								<tbody>
									<%
									if (c.getPhoto1()!=null) {
									%>
									<tr><td>
										<img src="ImageServlet?id=<%=c.getId()%>&photoId=photo1" height="96" width="128" border="0" onmouseover="changeImage('1');">
										<br>
									</td></tr>
									<%}%>
									<%
									if (c.getPhoto2()!=null) {
									%>
									<tr><td>
										<img src="ImageServlet?id=<%=c.getId()%>&photoId=photo2" height="96" width="128" border="0" onmouseover="changeImage('2');">
										<br>
									</td></tr>
									<%}%>
									<%
									if (c.getPhoto3()!=null) {
									%>
									<tr><td>
										<img src="ImageServlet?id=<%=c.getId()%>&photoId=photo3" height="96" width="128" border="0" onmouseover="changeImage('3');">
										<br>
									</td></tr>
									<%}%>
									<%
									if (c.getPhoto4()!=null) {
									%>
									<tr><td>
										<img src="ImageServlet?id=<%=c.getId()%>&photoId=photo4" height="96" width="128" border="0" onmouseover="changeImage('4');">
										<br>
									</td></tr>
									<%}%>
									<%
									if (c.getPhoto5()!=null) {
									%>
									<tr><td>
										<img src="ImageServlet?id=<%=c.getId()%>&photoId=photo5" height="96" width="128" border="0" onmouseover="changeImage('5');">
										<br>
									</td></tr>
									<%}%>
									<%
									if (c.getPhoto6()!=null) {
									%>
									<tr><td>
										<img src="ImageServlet?id=<%=c.getId()%>&photoId=photo6" height="96" width="128" border="0" onmouseover="changeImage('6');">
										<br>
									</td></tr>
									<%}%>
									<tr>
										<td width="100%" align="left"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<%@include file="car-info.jsp"%>
	</div>
</body>
</html>