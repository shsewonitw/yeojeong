<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>

<script type="text/javascript">
function modify(member_id,tel, birth, email){
	var selection_tel = "."+member_id+"_tel";
	var selection_birth = "."+member_id+"_birth";
	var selection_email = "."+member_id+"_email";
	$(selection_tel).html("<input style='width:50%;marin:0px;' class='form-control' type='text' name='tel' id='"+member_id+"_tel' value='"+tel+"' required>");
	$(selection_birth).html("<input style='width:50%;marin:0px;' class='form-control' type='text' name='birth' id='"+member_id+"_birth' value='"+birth+"' required>");
	$(selection_email).html("<input style='width:50%;marin:0px;' class='form-control' type='text' name='email' id='"+member_id+"_email' value='"+email+"' required>");
	
	$("#"+member_id+"_modify").css("display","none");
	$("#"+member_id+"_modify_accept").css("display","inline-block");
	$("#"+member_id+"_modify_reject").css("display","inline-block");
}

function modify_accept(member_id){
	var modify_data = $("#"+member_id+"_modify_form").serialize();
	modify_data += "&member_id="+member_id;
	
	var tel = $("#"+member_id+"_tel").val();
	var birth = $("#"+member_id+"_birth").val();
	var email = $("#"+member_id+"_email").val();
	
	var selection_tel = "."+member_id+"_tel";
	var selection_birth = "."+member_id+"_birth";
	var selection_email = "."+member_id+"_email";
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/adminMemberModify",
		type : "get",
		data : modify_data,
		dataType : "text",
		success : function(data) {
			if (eval(data)) {
				
				$(selection_tel).html(tel);
				$(selection_birth).html(birth);
				$(selection_email).html(email);
				
				$("#"+member_id+"_modify").css("display","inline-block");
				$("#"+member_id+"_modify_accept").css("display","none");
				$("#"+member_id+"_modify_reject").css("display","none");
				$("#"+member_id+"_modify").attr("onclick","modify('"+member_id+"','"+tel+"','"+birth+"','"+email+"')");
			} else {
				alert("정보를 확인해주세요");
			}
		},
		error : function(data) {
			alert("통신오류(관리자에게 문의하세요.)");
		}
	});
	
}

function modify_reject(member_id,tel, birth, email){
	var selection_tel = "."+member_id+"_tel";
	var selection_birth = "."+member_id+"_birth";
	var selection_email = "."+member_id+"_email";
	$(selection_tel).html(tel);
	$(selection_birth).html(birth);
	$(selection_email).html(email);
	
	$("#"+member_id+"_modify").css("display","inline-block");
	$("#"+member_id+"_modify_accept").css("display","none");
	$("#"+member_id+"_modify_reject").css("display","none");
}
</script>

<!-- 회원 상세 정보 -->
<c:forEach items="${member_list}" var="member">
	<div id="div_${member.member_id}" class="div_member_all" style="margin:auto;text-align:center;display:none;">
		<div class="jumbotron" style="margin:auto;text-align:left; background-color:#E9EAEA; padding-left:40px; padding-right:40px" >
		  <h2>
		  <c:if test="${member.gender eq 1 }" var="r">
		  <i style="color:pink;" class="fas fa-female fa-1x"></i>
		  </c:if>
		  <c:if test="${not r}">
		  <i style="color:blue;" class="fas fa-male fa-1x"></i>
		  </c:if>
		  ${member.member_id} ( ${member.name} ) 님의 정보 <sub><font size="2px">등록일 ${member.regist_date}</font></sub></h2>
		  
		  <hr style="border: solid #dedede; border-witdh:1px 0 0;">		
		  <form id="${member.member_id}_modify_form" method="GET">
		  <p><b>전화번호</b></p>
		  <div class="${member.member_id}_tel" style="height:34px;">${member.tel}</div>

		  <hr style="border: solid #dedede; border-witdh:1px 0 0;">	
		  	
		  <p><b>생일</b></p>
		  <div class="${member.member_id}_birth" style="height:34px;">${member.birth}</div>
		  
		  <hr style="border: solid #dedede; border-witdh:1px 0 0;">		
		  
		  <p><b>이메일</b></p>
		  <div class="${member.member_id}_email" style="height:34px;">${member.email}</div>
		  
		  </form>
		  <hr style="border: solid #dedede; border-witdh:1px 0 0;">		
		  
		  <p><a id="${member.member_id}_modify" class="btn btn-primary btn-lg" href="javascript:void(0);" onclick="modify('${member.member_id}','${member.tel}','${member.birth}','${member.email}');" role="button"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a></p>
		  <a id="${member.member_id}_modify_accept" style="display:none;" class="btn btn-primary btn-lg" href="javascript:void(0);" onclick="modify_accept('${member.member_id}');" role="button"><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span></a>
		  <a id="${member.member_id}_modify_reject" style="display:none;" class="btn btn-primary btn-lg" href="javascript:void(0);" onclick="modify_reject('${member.member_id}','${member.tel}','${member.birth}','${member.email}');" role="button"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span></a>
		</div>
	

	</div>
</c:forEach>