<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<title>로그인 화면</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="resources/css/kh_bootstrap.min.css?asd=asdda"
	rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script src="resources/js/kh_bootstrap.min.js"></script>


<style type="text/css">
th, td {
	padding-bottom: 8px;
}

.img_attr {
	height: 45%;
}

#kakao-login-btn>img{
width: 100%;
}
</style>




</head>
<body>
<c:if test="${not empty login_message }">

</c:if>

	<div style="height: 25%;"></div>
	<div
		style="color: rgb(52, 152, 219); margin: auto; font-family: sans-serif; font-size: 30px; text-align: center;">
		<img
			style="width: auto; height: auto; max-width: 100px; max-height: 100px;"
			src="<%=request.getContextPath()%>/resources/images/logo.png"
			alt="logo"> <b>여정
			로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
	</div>

	<form:form modelAttribute="member" class="form-inline">

		<table style="margin: auto;">

			<tr>
				<th>
					<div class="input-group" style="width: 100%">
						<div class="input-group-addon">
							<img class="img_attr"
								src="<%=request.getContextPath()%>/resources/images/login_id.png"
								alt="login_id">
						</div>
						<form:input class="form-control" path="member_id"
							placeholder="아이디" />
					</div>
				</th>
			</tr>
			<tr>
				<th>
					<div class="input-group" style="width: 100%">
						<div class="input-group-addon">
							<img class="img_attr"
								src="<%=request.getContextPath()%>/resources/images/login_password.png"
								alt="login_password">
						</div>
						<form:password class="form-control" path="password"
							placeholder="비밀번호" />
					</div>
				</th>
			</tr>
			<tr>
				<td><label><input type="checkbox" style=""
						name="rememberID"
						${cookie.rememberID.value != null ? "checked" : "" } /> 아이디 저장</label></td>
			</tr>
			<tr>
				<th>
					<button style="width: 100%" type="submit" class="btn btn-primary">로그인</button>
				</th>
			</tr>
			<tr>
				
				<th style="text-align: center; " >
					<a id="kakao-login-btn" style=""></a>
				</th>
				
			</tr>
		</table>
	</form:form>
	
	
	
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
	 //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('9e1736773b70f53443f16edce448d44d');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        
        Kakao.API.request({
        	
        	url: '/v2/user/me',
            success: function(res) {
            	
            	
             var userID = res.id;      //유저의 카카오톡 고유 id
             var userEmail = res.kakao_account.email;   //유저의 이메일
             var usergender  = res.kakao_account.gender; //유저가 등록한 별명
             
             $("#kakao_id").val(userID);
             $("#kakao_email").val(userEmail);
             $("#kakao_gender").val(usergender);
             
             $("#target").submit();
             
            },
            fail: function(error) {
             alert("통신오류. 관리자에게 문의하세요");
            }
        	
        });
        
       
      },
      fail: function(err) {
         alert("통신오류. 관리자에게 문의하세요");
      }
    });
		            
	</script>
	<form action="<%=request.getContextPath()%>/regist_Kakao" id="target" method="get">
	<input type="hidden" id="kakao_id" name="kakao_id" value="" >
	<input type="hidden" id="kakao_email" name="kakao_email" value="" >
	<input type="hidden" id="kakao_gender" name="kakao_gender" value="" >
	
	</form>
	

</body>
</html>