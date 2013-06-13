<%@page import="ge.iauto.server.model.Car"%>
<%@page import="ge.iauto.server.model.CarModel"%>
<%@page import="ge.iauto.server.model.CarMake"%>
<%@page import="ge.iauto.server.model.Category"%>
<%@page import="ge.iauto.server.model.Location"%>
<%@page import="ge.iauto.server.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center {
	margin: auto;
	width: 80%;
}
td.det_val {
color: #000000;
text-decoration: none;
font-family: sylfaen;
font-size: 10pt;
font-style: normal;
font-weight: bold;
width: 200px;
text-align: left;
}
</style>
</head>
<body>

	<%
		long id = 0;
		String uploaddate;
		User user;
		Category category;
		CarMake carmake;
		CarModel carmodel;
		Location location;
		int year = 0;
		int month = 0;
		String currency = "";
		String kilometer = "";
		String doors = "";
		String airbag = "";
		boolean rent = false;
		String gearbox = "";
		String username = "";
		boolean abs = false;
		boolean window = false;
		boolean climat = false;
		boolean wheel = false;
		boolean topwindow = false;
		boolean computer = false;
		boolean sequrity = false;
		int price = 0;
		boolean ganbajebuli = false;
		boolean changable = false;
		boolean saleonauction = false;
		double engine = 0;
		String cylinder = "";
		String actionwheel = "";
		String fuel = "";
		String color = "";
		boolean rightsteeringwheel = false;
		boolean turbo = false;
		String telephone = "";
		boolean parkcontrol = false;
		boolean conditioner = false;
		boolean leather = false;
		boolean navigation = false;
		boolean centrallock = false;
		boolean savardzlisgatboba = false;
		boolean hydraulics = false;
		String bringyear = "";
		String vincode = "";
		String describtion = "";
		byte[] photo1;
		byte[] photo2;
		byte[] photo3;
		byte[] photo4;
		byte[] photo6;
		//Car car = (Car)request.getAttribute("carToShow");
		Car car = new Car();
		car.setAbs(true);
		car.setUsername("jondo");
		car.setTelephone("666");
		car.setPrice(10000);
		car.setTopwindow(true);
		car.setColor("mwvaneyvavilisferi");
		car.setComputer(true);
		car.setEngine(3);
		car.setGanbajebuli(true);
	%>
	<table>

		<tr valign="top">
			<td>
				<table cellspacing="0" cellpadding="0" width="100%">
					<tbody>
						<tr valign="top">
							<td>
								<table>
									<tbody>
										<tr valign="top">
											<td align="center">
												<table width="100%" border="0" cellpadding="0"
													cellspacing="0">
													<tbody>
														<tr valign="bottom">
															<td align="center" width="680px">
																<table border="0" width="100%" align="center">
																	<tbody>
																		<tr valign="top">
																			<td width="100%">
																				<div
																					style="padding-left: 10px; display: inline-block; width: 180px;">
																					<table border="0" align="left" cellspacing="0"
																						cellpadding="0">
																						<tbody>
																							<tr valign="bottom">
																								<td><table cellspacing="0" cellpadding="0">
																										<tbody>
																											<tr>
																												<td><font color="#FF0000" size="+2">
																														<%
																															out.print(car.getPrice());
																														%>$
																												</font></td>
																												<td><span style="margin-top: -10px;">&nbsp;<%
																													if (car.isGanbajebuli())
																														out.print("განბაჟებული");
																													else
																														out.print("განუბაჟებელი");
																												%></span></td>
																											</tr>
																										</tbody>
																									</table></td>
																							</tr>
																							<tr valign="top">
																								<td
																									style="padding-right: 5px; padding-top: -10px;">&nbsp;</td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
														<tr height="1" width="100%">
															<td><hr
																	style="width: 640px; margin-left: 15px; border: none; background-color: rgb(0, 128, 255); height: 1px;"></td>
														</tr>
														<tr valign="top">
															<td width="100%">
																<table width="665">
																	<tbody>
																		<tr valign="top">
																			<td style="padding-left: 0px; padding-right: 5px;"
																				width="60%" align="left"><b
																				style="font-size: 20px; color: #0080FF; margin-left: 10px;">
																					<%
																						out.print(car.getUsername());
																					%> <span style="color: #4b4b4b;"> (+995) </span> <%
 	out.print(car.getTelephone());
 %>
																			</b></td>

																			<!-- წერილის მიწერა  -->
																			<td width="40%" align="center"><a>აქანე დავდგამ სტენკას</a></td>

																		</tr>
																		<tr valign="top">
																			<td width="100%" align="left"></td>
																		</tr>

																	</tbody>
																</table>
															</td>
														</tr>

														<!--<tr height="5" bgcolor="#ffffff"><td></td></tr>-->
														<tr height="1">
															<td width="670"><hr
																	style="width: 640px; margin-left: 15px; border: none; background-color: rgb(0, 128, 255); height: 1px; margin-top: -1px;"></td>
														</tr>

													</tbody>
												</table>
											</td>
											<td align="center" width="100"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

						<tr valign="top">
							<td>
								<table width="100%">
									<tbody>
										<tr valign="top">
											<td>
												<table width="100%" border="0">

													<tbody>
														<tr>
															<td align="left" colspan="2" style="padding-left: 3px;">
																<div
																	style="width: 640px; margin-left: 13px; font-size: 15px; margin-top: -8px; text-shadow: rgba(0, 0, 0, 0.2) 0.1em 0.1em 0.2em;">
																	<%
																		out.print(car.getDescribtion());
																	%>&nbsp;
																</div>
															</td>
														</tr>
														<tr height="5">
															<td colspan="2" width="100%"><hr
																	style="width: 640px; margin-left: 12px; border: none; background-color: rgb(0, 128, 255); height: 1px;"></td>
														</tr>
														<tr>
															<td
																style="font-weight: bold; color: rgb(71, 71, 71); padding-left: 17px; line-height: 0px; padding-bottom: 12px;"
																colspan="2"><b
																style="float: right; margin-right: 34px;">ჩამოყვანილია:
																	<%
																out.print(car.getBringyear());
															%>
															</b></td>
														</tr>
														<tr>
															<td width="100%" valign="top">
																<table  width="80%" border="0"
																	cellspacing="0" align="center">
																	<!--<tr><td style="width:320px;height:0.5px;" align="right" colspan="2"><img src="imgs/line.png"></td></tr>-->
																	<tbody>
																		<tr>
																			<td align="center" valign="top" width="50%">მწარმოებელი:</td>
																			<td class="det_val_first" width="50%">
																				<%
																					out.print(car.getCarmake());
																				%>
																			</td>
																		</tr>
																		
																	
																		<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
													
																		<tr>
																			<td align="right">მოდელი:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getCarmodel());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right"><nobr>გამოშვების წელი</nobr>:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getYear());
																				%>
																			</td>
																		</tr>
																		<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">კატეგორია:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getCategory());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">საწვავის ტიპი:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getFuel());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">ძრავის მოცულობა:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getEngine());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">გარბენი:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getKilometer());
																				%> კმ.
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">ცილინდრები:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getCylinder());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right"><nobr>გადაცემათა
																					კოლოფი:</nobr></td>
																			<td class="det_val">
																				<%
																					out.print(car.getGearbox());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">წამყვანი თვლები:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getActionwheel());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">კარები:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getDoors());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">საჭე:</td>
																			<td class="det_val">
																				<%
																					if(!car.isRightsteeringwheel())out.print("მარჯვნივ");
																					if(car.isRightsteeringwheel()) out.print("მარცხნივ");
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">ფერი:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getColor());
																				%>
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td align="right">აირბეგი:</td>
																			<td class="det_val">
																				<%
																					out.print(car.getAirbag());
																				%>
																			</td>
																		</tr>
																		<tr>
																			<td align="right"></td>
																		</tr>
																	</tbody>
																</table>
															</td>
															<td align="center" width="100%" valign="top">
																<table valign="top" width="80%" border="0"
																	align="center" cellspacing="0">
																	<!--<tr><td style="width:320px;height:0.5px;" align="right" colspan="2"><img src="imgs/line.png"></td></tr>-->
																	<tbody>
																		<tr>
																			<td align="right" width="50%">ABS:</td>
																			<td class="det_val" width="50%">
																				<% if(car.isAbs()){%>
																				 <img border="0" src="plus.gif">
																				<%}%>
																				<% if(!car.isAbs()) {%>
																				<img border="0" src="minus.gif">
																				<%}%>
																			</td>
																		</tr>
																		<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ელ. შუშები:</td>
																			<td class="det_val">
																				<%
																					if(car.isWindow())
																				%> <img border="0" src="plus.gif">
																				<% if(!car.isWindow())%><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">კონდინციონერი:</td>
																			<td class="det_val">
																				<%
																					if (car.isConditioner())
																				%> <img border="0" src="plus.gif"> <% if (!car.isConditioner()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">კლიმატკონტროლი:</td>
																			<td class="det_val">
																				<%
																					if (car.isClimat())
																				%> <img border="0" src="plus.gif">
																				<% if(!car.isClimat())%><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ტყავის სალონი:</td>
																			<td class="det_val">
																				<%
																					if (car.isLeather())
																				%> <img border="0" src="plus.gif">
																				<% if (!car.isLeather()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																		<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">დისკები:</td>
																			<td class="det_val">
																				<%
																					if (car.isWheel())
																				%> <img border="0" src="plus.gif">
																				<% if (!car.isWheel()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ნავიგაცია:</td>
																			<td class="det_val">
																				<%
																					if (car.isNavigation())
																				%> <img border="0" src="plus.gif"> <% if(!car.isNavigation()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																		<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm"><nobr>ცენტრალური
																					საკეტი:</nobr></td>
																			<td class="det_val">
																				<%
																					if (car.isCentrallock())
																				%> <img border="0" src="plus.gif"> <% if (!car.isCentrallock()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ლუქი:</td>
																			<td class="det_val">
																				<%
																					if (car.isTopwindow())
																				%> <img border="0" src="plus.gif"> <% if (!car.isTopwindow()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">სიგნალიზაცია:</td>
																			<td class="det_val">
																				<%
																					if (car.isSequrity())
																				%> <img border="0" src="plus.gif"> <% if (!car.isSequrity()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ბორტკომპიუტერი:</td>
																			<td class="det_val">
																				<%
																					if (car.isComputer())
																				%> <img border="0" src="plus.gif"> <% if (!car.isComputer()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ჰიდრავლიკა:</td>
																			<td class="det_val">
																				<%
																					if (car.isHydraulics())
																				%> <img border="0" src="plus.gif"> <% if (!car.isHydraulics()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm"><nobr>სავარძლების
																					გათბობა:</nobr></td>
																			<td class="det_val">
																				<%
																					if (car.isSavardzlisgatboba())
																				%> <img border="0" src="plus.gif"> <% if (!car.isSavardzlisgatboba()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">პარკინგკონტროლი:</td>
																			<td class="det_val">
																				<%
																					if (car.isParkcontrol())
																				%> <img border="0" src="plus.gif"> <% if (!car.isParkcontrol()) %><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																		<tr>
																			<td class="det_nm">ტურბო:</td>
																			<td class="det_val">
																				<%
																					if (car.isTurbo())
																				%> <img border="0" src="plus.gif">
																				<% if (!car.isTurbo())	%><img border="0" src="minus.gif">
																			</td>
																		</tr>
																			<tr>
																			<td>
																	<div style="width: 200px; margin-left: 0px; height: 2px; background-color: rgb(0, 128, 255);"></div></td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
														<tr>
															<td colspan="2" valign="top"></td>
														</tr>
													</tbody>
												</table>
											</td>
											<td align="right" width="100">&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

					</tbody>
				</table>

			</td>
		</tr>

	</table>
</body>
</html>