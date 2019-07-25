<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/review.css">

<title>여행자들의 웃음</title>

</head>
<body>

	<div class="top"></div>
	<div class="titleDIV">여행자들의 웃음</div>
	
	<div class="formDIV">
		
		<form action="<%=request.getContextPath()%>/form/review" method="post">
			<hr>
			작성자&nbsp;&nbsp;<input type="text" name="member_id" value="{member_id}">
			<hr>
			
			
			
			</form>
	</div>

    <script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
  
    
    
</body>
</html>