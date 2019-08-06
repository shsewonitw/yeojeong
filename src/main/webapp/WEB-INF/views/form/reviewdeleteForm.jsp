<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/reviewdelete.css?var=3">

<title>여행자들의 웃음 삭제</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV">여행자들의 웃음 삭제</div>
	
	<div class="formDIV">
		
		<form action="<%=request.getContextPath()%>/reviewdelete" method="post">
			<div style="margin-left: 40%;">
			<input type="hidden" name="article_id" value="${ articleNo.article_id }">
			<label >정말 삭제하시겠습니까?</label><br><br><br>
			<button type="submit" class="button" class="submitmagin" >삭제</button>
			<button type="button" class="button" class="submitmagin" onclick="location.href='<%=request.getContextPath()%>/reviewlist'">취소</button>
			</div>
		</form>
	</div>

</body>




</html>