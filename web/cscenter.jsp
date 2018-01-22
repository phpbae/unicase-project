<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            
<!DOCTYPE html>

<html>
<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>쇼핑몰 CS Center</title>

	    <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    
	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<!-- Demo Purpose Only. Should be removed in production : END -->

		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">

		<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

	</head>
    <body class="cnt-home">
	
	
	<%-- 상단메뉴 --%>	
	<jsp:include page="TOP.jsp"/>
		

<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="Index.credu">Home</a></li>
				<li class='active'>CS Center</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

	<div class="container">
		<div class="row cscenter-box">
			<div class="col-sm-12">
				<h1>CS Center</h1>
				<%-- 고객센터 부분 --%>
				<div class="col-sm-7">
					<div class="panel panel-success">
						<div class="panel-body">
							<div class="jumbotron">
   								 <h1 align="center">UNICASE</h1> 
							</div>
							<div class="col-sm-6">
								
									<h3>ONLINE STORE</h3>
									<h2>070.1234.5678</h2>
									평일 10:00 ~ 1700 / 토·일·공유일 휴무<br /> (점심시간 13:00 ~ 14:00)<br />
									서울특별시 강남구 역삼동 삼성SDS멀티캠퍼스
								
							</div>
							<div class="col-sm-6">
								
									<h3>A/S CENTER</h3>
									<h2>080.9876.5432</h2>
									평일 10:00 ~ 1700 / 토·일·공유일 휴무<br /> (점심시간 13:00 ~ 14:00)<br />
									서울특별시 강남구 역삼동 삼성SDS멀티캠퍼스
								
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-success">
						<div class="panel-body">
						<div class="col-sm-4">
							<p><img src="assets/images/FAQ.jpg" style="margin-top: 20px"/></p>
							<p><img src="assets/images/Q&A.jpg" width="129" height="72" style="margin-top: 90px"></p>
						</div>
						<div class= "col-sm-8">
						
						<p>
						<h3>FAQ</h3>
						UNICASE 이용시 궁금한 점이 있으신가요?<br/>
						1:1 문의 전 FAQ를 통해 검색하시면<br/>
						보다 빠른 답을 찾으실 수 있습니다.
						<a href="faq.jsp" class="btn btn-warning" role="button">FAQ바로가기</a>
						
						<hr style="border:dotted 1px green;">
						<p>
						<h3>1:1문의</h3>
						FAQ를 통해 궁금증을 풀지 못하셨다면<br/>
						1:1 문의를 이용해 주세요.
						<a href="board_main.credu" class="btn btn-warning" role="button">1:1문의 바로가기</a>
					
						</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>

<%-- FOOT2 --%>
	<jsp:include page="FOOT2.jsp"></jsp:include>


</body>
</html>