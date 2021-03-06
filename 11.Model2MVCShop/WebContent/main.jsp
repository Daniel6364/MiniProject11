<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
        
        .jumbotron {
        	background-color: rgba(192,192,192,0.3);
        }
        
        .jumbotron h1 {
        	text-align: center;
        	text-transform: uppercase;
        	line-height: 0.5;
        	color: navy;
        }
        
        .jumbotron p {
        	text-indent: 30px;
    		text-align: justify;
  			letter-spacing: 5px;
  			color: red;
        }
        
        .item h1, h4 {
        	color: lime;
        }
        
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
   	
   	<!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Welcom to <hr/>Model2 MVC Shop</h1>
        <p>J2SE, RDBMS, JDBC, Servlet & JSP, Java Framework, HTML5, UI Framework 학습 후 Mini-Project 진행</p>
      </div>


		<!-- Carousel Start -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<div class="item active">
					<img src="/images/chicago01.jpg" alt="chicago01" style="width: 100%;">
					<div class="carousel-caption">
						<h1>Beautiful Chicago Sunset</h1>
						<h4>This sunset would be the best one among what you see ever.</h4>
					</div>
				</div>

				<div class="item">
					<img src="/images/chicago02.jpg" alt="chicago02" style="width: 100%;">
					<div class="carousel-caption">
						<h1>Amazing Architectures</h1>
						<h4>You can enjoy the wonderful architecture forest.</h4>
					</div>
				</div>

				<div class="item">
					<img src="/images/chicago03.jpg" alt="chicago03" style="width: 100%;">
					<div class="carousel-caption">
						<h1>Fantastic Cloud Bean</h1>
						<h4>This statue of bean is so shine in middle of the park.</h4>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- Carousel End -->


		<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
        <h3>나폴레옹은 이렇게 말했다.</h3>
        <p>"오늘 나의 불행은 언젠가 내가 잘못 보낸 시간의 보복이다."</p>
  	 	<h3>"... 장벽은 절실하게 원하지 않는 사람들을 걸러내려고 존재합니다. 장벽은. 당신이 아니라 '다른' 사람들을 멈추게 하려고 거기 있는 것이지요."</h3>
        <h3>혜광스님</h3>
        <p>행복한 삶의 비결은.</p>
        <p>좋아하는 일을 하는 것이 아리라,</p>
        <p>지금 하는 일을 좋아하는 것입니다.</p>
  	 </div>

</body>

</html>