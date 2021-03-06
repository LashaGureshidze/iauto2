<%@page import="ge.iauto.server.model.CarModel"%>
<%@page import="ge.iauto.server.model.CarMake"%>
<%@page import="java.util.HashMap"%>
<%@page import="ge.iauto.server.model.Location"%>
<%@page import="java.util.Iterator"%>
<%@page import="ge.iauto.server.model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge</title>
<style type="text/css">


#axali_dzebna {
	width: 814px;
	background-repeat: no-repeat;
	background-image: url(bg.png);
	border: 2px solid #D8D8D8;
	box-shadow: 4px 4px 21px -4px #858585;
	text-shadow: rgba(180, 78, 78, 0.22) 0.1em 0.1em 0.2em;
	font-weight: normal;
	margin: auto;
}

#gamochenili {
	height: 110px;
}

.sigane {
	display: inline-block;
	width: 200px;
	text-align: center;
}

.fasi_weli_garbeni {
	width: 71px;
	height: 22px;
}

.seleqtebi {
	width: 150px;
	height: 28px;
	border-radius: 2px;
	border-color: #F0F0F0;
	margin-top: 3px;
	text-shadow: rgba(78, 78, 78, 0.12) 0.1em 0.1em 0.2em;
}

.dzebna {
	margin-top: 10px;
	margin-bottom: 10px;
	min-width: 150px;
	padding: 7px 20px;
	text-align: center;
	font-weight: bold;
	font-size: 19px;
	line-height: 126%;
	border-color: #3b6e22 #3b6e22 #2c5115;
	border: 1px solid;
	-webkit-border-radius: 5px;
	color: #fff;
	letter-spacing: 1px;
	position: relative;
	text-shadow: 0 1px 2px rgba(0,0,0,0.5);
	margin: 0;
	font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
	font-size: 15px;
	background-color: rgb(52, 129, 213);
	-webkit-box-shadow: inset 0 1px 1px rgb(136, 180, 227);
}

.dzebna:hover {
	background-color: #3399FF;
	color: white;
}
.field {
	border-radius: 3px;
}
.field:HOVER {
	border-color: #A5D3FF;
}
.seleqtebi:HOVER {
	border-color: #99CCFF;
}
</style>

<script type="text/javascript">
	function BoxChange(selectObj) {
		var idx = selectObj.selectedIndex;
		var which = selectObj.options[idx].text;
		var cSelect = document.getElementById("carmodel_id");
		while (cSelect.options.length > 0) cSelect.remove(0);
		var newOption;
		if (which == "მწარმოებელი" || which == "ყველა") {
			newOption = document.createElement("option");
			newOption.value = "";
			newOption.text = "მოდელი";
			try {
				cSelect.add(newOption); 
			} catch (e) {
				cSelect.appendChild(newOption);
			}	
			return;
		}
		<%
		@SuppressWarnings("unchecked")
		HashMap<String,Long> car = (HashMap<String,Long>)request.getServletContext().getAttribute("idByName");
		@SuppressWarnings("unchecked")
		HashMap<Long,CarMake> models = (HashMap<Long,CarMake>)request.getServletContext().getAttribute("carById");
		for(String name : car.keySet()){	
		%>
			if(which == "<%=name%>"){
				newOption = document.createElement("option");
				newOption.value = "";
				newOption.text = "მოდელი";
				try {
					cSelect.add(newOption); 
				} catch (e) {
					cSelect.appendChild(newOption);
				}	
			<%
				for(CarModel model : models.get(car.get(name)).getModels()){
			%>
					newOption = document.createElement("option");
					newOption.value = "<%=model.getId()%>";
					newOption.text = "<%=model.getName()%>";
					try {
						cSelect.add(newOption); 
					} catch (e) {
						cSelect.appendChild(newOption);
					}
			<%
				}
			%>		
			}
		<%
		}
		%>
	}
	
	function isNumber(e) {
		var charCode;
	    if (window.event) charCode = window.event.keyCode;
	    else if (e) {
	    	charCode = e.which;
	    } else return true;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
	    return true;
	}
</script>

</head>
<body>
	<form action="SearchServlet" method="get">
		<div id="axali_dzebna">
			<div style="margin-top: 10px;" align="center" id="gamochenili">
				<div id="pirveli_rigi">
					<span class="sigane" style="width: 150px;">
					 <select name="carmake_id" id="carmake_id" class="seleqtebi"
						onChange="BoxChange(this);" tabindex="1">
							<option value="" selected="selected">მწარმოებელი</option>
							<%
							@SuppressWarnings("unchecked")
							HashMap<String,Long> cars = (HashMap<String,Long>)request.getServletContext().getAttribute("idByName");
							for(String ids : cars.keySet()){
							%>
								<option id="<%=cars.get(ids)%>" value="<%=cars.get(ids)%>"><%=ids%></option>
							<%}%>
					</select>
					</span>
					<span class="sigane" style="text-align: right; width: 200px;">
						<a style="margin-left: -16px;">წელი</a> 
						<select id="year_from" name="year_from" tabindex="4" class="seleqtebi" style="width: 75px;">
							<option value="">დან</option>
							<%
								for (int k = 1940; k <= 2013; k++) {
							%>
							<option value=<%=k%>><%=k%></option>
							<%
								}
							%>	
					</select>
					<select id="year_to" name="year_to" tabindex="5" class="seleqtebi"
						style="width: 75px;">
							<option value="">მდე</option>
							<%
								for (int k = 1940; k <= 2013; k++) {
							%>
							<option id=<%=k%> value=<%=k%>><%=k%></option>
							<%
							}
							%>
					</select>
					</span> 
					<span class="sigane" style="text-align: right;">
					 <select id="gearbox" name="gearbox" class="seleqtebi">
							<option value="">ტრანსმისია</option>
							<option value="1">მექანიკური</option>
							<option value="2">ავტომატიკა</option>
							<option value="3">ტიპტრონიკი</option>
					</select>
					</span> 
					<span class="sigane" style="text-align: right;"> <span>განბაჟებული
						<select onChange="" id="ganbajebuli" name="ganbajebuli" id="customs_passed"
							class="seleqtebi" style="width: 47px;">
								<option value=""></option>
								<option value="1">კი</option>
								<option value="0">არა</option>
						</select>
					</span>
					</span>
				</div>
				<div id="meore_rigi">
					<span class="sigane" style="width: 150px;"> 
					<select	name="carmodel_id" id="carmodel_id" class="seleqtebi">
							<option value="" selected="selected">მოდელი</option>
					</select>
					</span> <span class="sigane" style="text-align: right; width: 200px;">
						<a style="">ფასი</a> 
						<input class="field" type="text" onkeypress="return isNumber(event)" id="price_from" name="price_from" placeholder="დან" tabindex="6" style="height: 22px; width: 69px; border-radius: 2px;" />
						<input class="field" type="text" onkeypress="return isNumber(event)" id="price_to" name="price_to" placeholder="მდე" tabindex="7" style="height: 22px; width: 69px; border-radius: 2px;">
					</span> <span class="sigane" style="text-align: right;">
					 <select id="fuel" name="fuel" class="seleqtebi">
							<option value="">საწვავის ტიპი</option>
							<option value="1">ელექტრო</option>
							<option value="2">ბენზინი</option>
							<option value="3">დიზელი</option>
					</select>
					</span> 
					<span class="sigane" style="text-align: right;"> <span>მარჯვენა
							საჭე <select id="rightsteeringwheel" name="rightsteeringwheel" class="seleqtebi" style="width: 47px;">
								<option value=""></option>
								<option value="1">კი</option>
								<option value="0">არა</option>
						</select>
					</span>
					</span>
				</div>
				<div id="mesame_rigi">
					<span class="sigane" style="width: 150px;">
					 <select id="category_id" name="category_id" class="seleqtebi">
							<option value="" selected="selected">კატეგორია</option>
							<%
							@SuppressWarnings("unchecked")
							List<Category> categeory = (List<Category>) request
									.getServletContext().getAttribute("categories");
							Iterator<Category> it = categeory.iterator();
							while (it.hasNext()) {
								Category tmp = it.next();
							%>
							<option value=<%=tmp.getId()%>><%=tmp.getName()%></option>
							<%
								}
							%>
					</select>
					</span> <span class="sigane">
					<select	id="location_id" name="location_id" class="seleqtebi">
							<option value="">მდებარეობა</option>
							<%
							@SuppressWarnings("unchecked")
							List<Location> locat = (List<Location>) request.getServletContext()
									.getAttribute("locations");
							Iterator<Location> it1 = locat.iterator();
							while (it1.hasNext()) {
								Location tmp = it1.next();
							%>
								<option value=<%=tmp.getId()%>><%=tmp.getName()%></option>
							<%
							}
							%>
					</select>
					</span> <span class="sigane"> 
					<select class="seleqtebi" 	id="last_days" name="last_days">
							<option value="">განცხადებები</option>
							<option value="1h">ბოლო 1 საათი</option>
							<option value="2h">ბოლო 2 საათი</option>
							<option value="3h">ბოლო 3 საათი</option>

							<option value="1d">ბოლო 1 დღე</option>
							<option value="2d">ბოლო 2 დღე</option>
							<option value="3d">ბოლო 3 დღე</option>

							<option value="1w">ბოლო 1 კვირა</option>
							<option value="2w">ბოლო 2 კვირა</option>
							<option value="3w">ბოლო 3 კვირა</option>

							<option value="1m">ბოლო 1 თვე</option>
					</select>
					</span> 
					<span class="sigane">
						<button class="dzebna">ძებნა</button>
					</span>
				</div>
			</div>.
		</div>
	</form>
	<script type="text/javascript">
	function myfunc(elmnt,value){
		for(var i=0; i < elmnt.options.length; i++)
		{
		  if(elmnt.options[i].value == value)
		    elmnt.selectedIndex = i;
		}
	}
	myfunc(document.getElementById("carmake_id"),"<%=request.getParameter("carmake_id")%>");
	BoxChange(document.getElementById("carmake_id"));
	myfunc(document.getElementById("year_from"),"<%=request.getParameter("year_from")%>");
	myfunc(document.getElementById("year_to"),"<%=request.getParameter("year_to")%>");
	myfunc(document.getElementById("gearbox"),"<%=request.getParameter("gearbox")%>");
	myfunc(document.getElementById("ganbajebuli"),"<%=request.getParameter("ganbajebuli")%>");
	myfunc(document.getElementById("carmodel_id"),"<%=request.getParameter("carmodel_id")%>");
	myfunc(document.getElementById("rightsteeringwheel"),"<%=request.getParameter("rightsteeringwheel")%>");
	myfunc(document.getElementById("fuel"),"<%=request.getParameter("fuel")%>");
	myfunc(document.getElementById("category_id"),"<%=request.getParameter("category_id")%>");
	myfunc(document.getElementById("location_id"),"<%=request.getParameter("location_id")%>");
	myfunc(document.getElementById("last_days"),"<%=request.getParameter("last_days")%>");
	<%
	if(request.getParameter("price_from") != null && !request.getParameter("price_from").equals("")){
		try {
			Integer.parseInt(request.getParameter("price_from"));   
		%>
			document.getElementById("price_from").value = "<%=request.getParameter("price_from")%>";
		<%
		} catch (NumberFormatException e) {
		
		}
		%>
	<%}
	if(request.getParameter("price_to") != null && !request.getParameter("price_to").equals("")){
		try {
			Integer.parseInt(request.getParameter("price_to"));   
			%>
			document.getElementById("price_to").value = "<%=request.getParameter("price_to")%>";
			<%
		} catch (NumberFormatException e) {
			
		}%>
	<%}%>
	</script>
</body>
</html>