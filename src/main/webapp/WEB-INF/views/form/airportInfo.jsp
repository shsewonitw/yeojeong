<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>


<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">	
	
	
<meta charset="UTF-8">
<title>공항 정보</title>

</head>
<body style="overflow:scroll;">

<div style="height:200px;"></div>




<h1>gate1 : ${airportInfo.gate1}</h1>
<h1>gate2 : ${airportInfo.gate2}</h1>
<h1>gate3 : ${airportInfo.gate3}</h1>
<h1>gate4 : ${airportInfo.gate4}</h1>
<h1>gateinfo1 : ${airportInfo.gateinfo1}</h1>
<h1>gateinfo2 : ${airportInfo.gateinfo2}</h1>
<h1>gateinfo3 : ${airportInfo.gateinfo3}</h1>
<h1>gateinfo4 : ${airportInfo.gateinfo4}</h1>


</body>
</html>