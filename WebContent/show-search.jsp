<%@page import="ge.iauto.server.model.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge</title>

<style>
.readMore {
	text-decoration: none;
	color: grey
}
.readMore:HOVER {
	text-decoration: none;
	color: #3399FF;
}
.mainTable {
	width: 600px;
	background-color: rgb(240,240,240);
	box-shadow: 0 0 12px #AAAAAA;
	border-radius: 7px;
}
</style>

</head>
<body background="bg.png">
	<%@include file="menu-bar.jsp"%>
	<%@include file="search-table.jsp"%>
	<fieldset style="margin: 10px auto; width: 800px; border: 0px;">
	<table class="mainTable">
		<%
		@SuppressWarnings("unchecked")
		List<Car> list = (List<Car>)request.getAttribute("list");
		for(int i = 0 ; i < list.size() ; i++){	
			Car c = list.get(i);
		%>
		<tr>
			<td>
				<div style="background-image: url(top-line.jpg); background-size: 100%; height: 5px; width: 600px;"></div>
				<table height="110px" width="600px" bgcolor="#F8F8F8">
					<tr>
						<td width="21%">
							<a href="ShowCar?id=<%=c.getId()%>"><img src="ImageServlet?id=<%=c.getId()%>&photoId=photo1" height="96" width="128" border="0"></a>		
						</td>
						<td width="79%">
							<table width="100%" style="font-size: 10pt;">
								<tr>
									<td>
										<%=c.getCarmake().getName() + " " + c.getCarmodel().getName() + " - "%>
										<font color="red"><%=c.getPrice() + c.getCurrency()%></font>
									</td>
								</tr>
								<tr>
									<td>
										<%=c.getYear() + " წ. " + c.getEngine() + ", " + c.getFuel() + ", " + c.getGearbox() + ", "%>
										<%
										if (c.isRightsteeringwheel()) out.println("მარჯვენა საჭე, ");
										else out.println("მარცხენა საჭე, ");
										%>
										<%=c.getKilometer() + ", " + c.getLocation().getName()%>
									</td>
								</tr>
								<tr>
									<td align="right">
										<a class="readMore" href="ShowCar?id=<%=c.getId()%>">სრულად ნახვა<img alt="read-more" src="read-more.png" width="14px" height="14px" border="0px"></a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>				
			</td>
		</tr>
	<%}%>
	</table>
	</fieldset>
</body>
</html>