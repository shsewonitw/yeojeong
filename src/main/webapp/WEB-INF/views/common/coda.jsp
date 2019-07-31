<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>
<style type="text/css">
#footer {
    background: black;         
}
#footer h5{
	padding-left: 10px;
	border-left: 3px solid #eeeeee;
    border-right: 3px solid #eeeeee;    
    padding-bottom: 6px;
    margin-bottom: 20px;
    color:#ffffff;
}
#footer a {
    color: #ffffff;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
#footer ul.social li{
	padding: 3px 0;
}
#footer ul.social li a i {
    margin-right: 5px;
	font-size:25px;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.social li:hover a i {
	font-size:30px;
	margin-top:-10px;
}
#footer ul.social li a,
#footer ul.quick-links li a{
	color:#ffffff;
}
#footer ul.social li a:hover{
	color:#eeeeee;
}
#footer ul.quick-links li{
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.quick-links li:hover{
	padding: 3px 0;
	margin-left:5px;
	font-weight:700;
}
#footer ul.quick-links li a i{
	margin-right: 5px;
}
#footer ul.quick-links li:hover a i {
    font-weight: 700;
}

</style>
</head>
<body>
<script type="text/javascript">alert(13);</script>

<section id="footer">
		<div class="container">
			<div class="row text-center text-xs-center text-sm-left text-md-left">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5" style="text-align: center;">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="<%=request.getContextPath()%>/"><i class="fa fa-angle-double-right"></i>Main</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>With me?</a></li>
						<li><a href="<%=request.getContextPath()%>/qaarticle"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="<%=request.getContextPath()%>/traveldata"><i class="fa fa-angle-double-right"></i>City Data</a></li>
						<li><a href="<%=request.getContextPath()%>/reviewlist"><i class="fa fa-angle-double-right"></i>review</a></li>
					</ul>
				</div>
				
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-square"></i></a></li>
						<li class="list-inline-item"><a href="https://twitter.com" target="_blank"><i class="fab fa-twitter-square"></i></a></li>
						<li class="list-inline-item"><a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="https://www.google.com" target="_blank"><i class="fab fa-google-plus-square"></i></i></a></li>
						<li class="list-inline-item"><a href="https://www.youtube.com" target="_blank"><i class="fab fa-youtube-square"></i></a></li>
					</ul>
				</div>				
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p><a href="https://www.nationaltransaction.com/">National Transaction Corporation</a>
					 is a Registered MSP/ISO of KB, Inc. Korea [a wholly owned subsidiary of R.O.K. TJEcorp, Sinchon, SEOUL]</p>
					<p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="https://www.sunlimetech.com" target="_blank">Yeojeong</a></p>
				</div>				
			</div>	
		</div>
	</section>

</body>
</html>