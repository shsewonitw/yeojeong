<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여정 관리자페이지</title>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>

</head>
<body>
<script type="text/javascript">
</script>
<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp"/>

<div style="height:200px;"></div>

<div style="width:40%; margin:auto;">


<table class="table table-hover">
  <!-- On rows -->
<caption><font size="20px"><b style="color:rgb(52,152,219);">여정 통계</b></font><i style="color:rgb(52,152,219);" class="fas fa-plane-departure fa-3x"></i></caption>
<style type="text/css">
	tr th,td{
		text-align:center;
	}
</style>
<tr class="">
  <th class="">총 유저</th>
  <th class="active">여행중인 유저</th>
  <th class="">정보제공 도시</th>
  <th class="active">동행요청 게시글</th>
  <th class="">신청된 동행요청</th>
  <th class="active">리뷰게시글</th>
</tr>

<tr class="">
  <td class="">${member_total_count} 명</td>
  <td class="active">${travel_regist_count} 명</td>
  <td class="">${city_data_count} 개</td>
  <td class="active">${withme_view_count} 개</td>
  <td class="">${withme_request_count} 개</td>
  <td class="active">${review_view_count} 개</td>
</tr>


</table>

</div>
</body>
</html>