<!-- chart.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="js" value="/resources/js" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${js}/chartBuild.js"></script>
<script type="text/javascript">
window.onload = function() {
 
var dps = [];
var dpss = [];

var xValue;
var yValue;
 
<c:forEach items="${mem}" var="dataPoints" varStatus="loop">	
xValue =  "${dataPoints.mda}";
yValue = parseFloat("${dataPoints.staff}");		
dps.push({
	label : xValue,
	y : yValue
});			
</c:forEach> 

<c:forEach items="${mem}" var="dataPoints" varStatus="loop">	
xValue =  "${dataPoints.mda}";
yValue = parseFloat("${dataPoints.salary}");		
dpss.push({
	label : xValue,
	y : yValue
});			
</c:forEach>

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "OGSG Payments Revenue"
	},
	legend: {
		cursor:"pointer",
		itemclick: toogleDataSeries
	},
	toolTip: {
		shared: true
	},
	data: [{
		type: "column",
		name: "No of Staff",
		showInLegend: true,
		dataPoints: dps
	},{
		type: "column",
		name: "Salary Paid",
		showInLegend: true,
		dataPoints: dpss
	}]
});
 
function toogleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else{
		e.dataSeries.visible = true;
	}
	chart.render();
}
 
chart.render();
}
</script>
</head>
<body>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>	
</body>
</html>    