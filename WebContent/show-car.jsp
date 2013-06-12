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
	width: 80%;
}
</style>
</head>
<body>
	<div class="center">
		<%@include file="menu-bar.jsp"%>

		<table style="padding-top: 5px;" width="100%" border="0"
			cellpadding="0" cellspacing="0">
			<tbody>
				<tr valign="top">
					<td align="center" width="680px" style="position: relative;"
						id="mydeal_hover">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="640px" height="480px" align="left" valign="top">&nbsp;
										<div onclick="nextPic();"
											style="cursor: pointer; margin-top: -18px; background-image: url(m4.jpg);
											 width: 640px; height: 480px; border: 1px solid rgb(204, 204, 204); 
											 background-color: rgb(190, 190, 190); background-position: initial initial;
											 background-repeat: initial initial;"
											 id="big_photo"></div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td align="center" valign="top" width="500">
						<div id="photosDiv"
							style="margin-top: -8px; margin-left: -2px; padding: 5px; background-color: rgb(248, 248, 248); z-index: 9999; overflow: hidden; height: 455px; position: absolute;">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
												<td valign="top" align="center"><a> <img
												
												style="cursor: pointer; border: solid 1px #cccccc; background-color: #bebebe;"
												width="110" src="m1.jpg" border="0"></a></td>
									</tr>
									<tr>
										<td align="center"><a><img 

												style="cursor: pointer; margin-top: 6px; border: solid 1px #cccccc; background-color: #bebebe;"
												width="110" src="m2.jpg" border="0"></a></td>
									</tr>
									<tr>
										<td align="center"><a><img 

												style="cursor: pointer; margin-top: 6px; border: solid 1px #cccccc; background-color: #bebebe;"
												width="110" src="m3.jpg" border="0"></a></td>
									</tr>
									<tr>
										<td align="center"><a><img 

												style="cursor: pointer; margin-top: 6px; border: solid 1px #cccccc; background-color: #bebebe;"
												width="110" src="m4.jpg" border="0"></a></td>
									</tr>
									<tr>
										<td align="center"><a><img 

												style="cursor: pointer; margin-top: 6px; border: solid 1px #cccccc; background-color: #bebebe;"
												width="110" src="m5.jpg" border="0"></a></td>
									</tr>
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