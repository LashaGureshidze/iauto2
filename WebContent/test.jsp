<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ge.iauto.server.model.Car"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%
	Car car = (Car)request.getAttribute("carToShow");
%>

<body>
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td align="right" style="width: 50%;">
							მწარმოებელი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCarmake().getName()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							მოდელი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCarmodel().getName()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							გამოშვების წელი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getYear()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კატეგორია:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCategory().getName()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							საწვავის ტიპი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getFuel()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ძრავის მოცულობა:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getEngine()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							გარბენი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getKilometer()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ცილინდრები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCylinder()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							გადაცემათა კოლოფი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getGearbox()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							წამყვანი თვლები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getActionwheel()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კარები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getDoors()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							საჭე:
						</td>
						<td align="left" style="width: 50%;">
							<%
								if(!car.isRightsteeringwheel())out.print("მარჯვნივ");
								if(car.isRightsteeringwheel()) out.print("მარცხნივ");
							%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ფერი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getColor()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							აირბაგები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getAirbag()%>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td align="right" style="width: 50%;">
							ABS:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isAbs()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ელ.შუშები:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isWindow()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კონდენციონერი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isConditioner()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კლიმატკონტროლი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isClimat()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ტყავის სალონი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isLeather()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							დისკები:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isWheel()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ნავიგაცია:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isNavigation()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ცენტრალური საკეტი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isCentrallock()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ლუქი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isTopwindow()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							სიგნალიზაცია:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isSequrity()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ბორტკომპიუტერი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isComputer()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ჰიდრავლიკა:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isHydraulics()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							პარკინგკონტროლი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isParkcontrol()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ტურბო:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isTurbo()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>