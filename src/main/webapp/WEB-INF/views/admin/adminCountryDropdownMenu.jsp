<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<style type="text/css">
.mainDiv {
	margin: auto;
	margin-top: 20px;
	align: center;
	width: 50%;
	height: auto;
}

@import url(https://fonts.googleapis.com/css?family=Lato);

body {
	margin: 0;
}

nav {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100px;
	padding: 0 0;
	box-sizing: border-box;
}

nav::before {
	position: absolute;
	top: 5%;
	left: 0;
	width: 100%;
	color: black;
	font: 400 24px/1 'Lato', sans-serif;
	text-align: center;
}

/* common */
nav ul {
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}

nav ul::after {
	display: block;
	clear: both;
	content: '';
}

nav ul li {
	position: relative;
	float: left;
	border: 2px solid black;
}

nav
 
ul
 
li
:not
 
(
:first-child
 
)
{
border-left
:
 
none
;


}
nav ul li:hover {
	background-color: rgba(255, 255, 255, .3);
}

nav ul li a {
	display: inline-block;
	padding: 1em 4em;
	color: black;
	font: 400 18px/1 'Lato', sans-serif;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
}

nav ul ul {
	position: absolute;
	top: 100%;
	left: -2px;
}

nav ul ul li {
	float: none;
	margin: 0;
}

nav
 
ul
 
ul
 
li
:not
 
(
:first-child
 
)
{
border
:
 
2
px
 
solid
 
black
;

	
border-top
:
 
none
;


}
nav ul ul ul {
	position: absolute;
	top: -2px;
	left: 100%;
}

/* DEMO #5 */
.nav05 ul li {
	perspective: 300px;
}

.nav05 ul ul {
	visibility: hidden;
	opacity: 0;
	transition: .3s ease-in-out;
	transform: rotateX(-90deg) rotateY(0);
	transform-origin: 0 0;
}

.nav05 ul ul li {
	perspective: 1500px;
}

.nav05 ul ul ul {
	transform: rotateX(0) rotateY(-90deg);
}

.nav05 ul li:hover>ul {
	visibility: visible;
	opacity: 1;
	transform: rotateX(0) rotateY(0);
}
</style>

	
	<!-- 드롭다운 메뉴 -->
		<div style="float:left;padding-left:5%;padding-right:20%;">
			<nav class="nav05">
				<ul>
					<li style="min-width:220px;text-align:center;"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-list" aria-hidden="true"></span></a> 
						<ul>
						<li><a href="<%=request.getContextPath()%>/adminCityDataInsert" style="text-decoration: none;">　<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>　</a></li>
							<c:forEach items="${countryList }" var="country">
								<li><a href="#" style="text-decoration: none;">${country}</a>
									<ul>
										<c:forEach items="${map}" var="map">
											<c:if test="${map.key eq country}">
												<c:forEach items="${map.value }" var="city">
													<li><a
														href="<%=request.getContextPath()%>/adminCityDataUpdate?city=${city}"
														style="text-decoration: none;">${city}</a></li>
												</c:forEach>
											</c:if>
										</c:forEach>
									</ul></li>
							</c:forEach>
						</ul></li>
				</ul>
			</nav>
		</div>
	<!--  -->
