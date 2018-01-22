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

	    <title>ContactPage</title>

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
				<li class='active'>Contact</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-bd">
	<div class="container">
		<div class="row inner-bottom-sm">
			<div class="contact-page">
				<div class="col-md-12 contact-map outer-bottom-vs">
					<iframe src="http://map.naver.com/?menu=location&mapMode=0&lat=37.5004875&lng=127.0394715&dlevel=12&searchCoord=127.0333571%3B37.4954844&query=7IK87ISxc2Rz66mA7Yuw7Lqg7Y287Iqk&mpx=09680640%3A37.4954844%2C127.0333571%3AZ11%3A0.0199315%2C0.0143070&tab=1&rpanel=n-f&enc=b64" width="600" height="450"  style="border:0"></iframe>
				</div>
				<div class="col-md-9 contact-form">
	<div class="col-md-12 contact-title">
		<h4>Contact Form(E-MAIL)</h4>
	</div>
	<div class="col-md-4 ">
		<form class="register-form" role="form">
			<div class="form-group">
		    <label class="info-title" for="exampleInputName">Your Name <span>*</span></label>
		    <input type="text" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Name">
		  </div>
		</form>
	</div>
	<div class="col-md-4">
		<form class="register-form" role="form">
			<div class="form-group">
		    <label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
		    <input type="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" placeholder="user@naver.com">
		  </div>
		</form>
	</div>
	<div class="col-md-4">
		<form class="register-form" role="form">
			<div class="form-group">
		    <label class="info-title" for="exampleInputTitle">Title <span>*</span></label>
		    <input type="text" class="form-control unicase-form-control text-input" id="exampleInputTitle" placeholder="Title">
		  </div>
		</form>
	</div>
	<div class="col-md-12">
		<form class="register-form" role="form">
			<div class="form-group">
		    <label class="info-title" for="exampleInputComments">Your Comments <span>*</span></label>
		    <textarea class="form-control unicase-form-control" id="exampleInputComments"></textarea>
		  </div>
		</form>
	</div>
	<div class="col-md-12 outer-bottom-small m-t-20">
		<button type="submit" class="btn-upper btn btn-primary checkout-page-button">Send Message</button>
	</div>
</div>
<div class="col-md-3 contact-info">
	<div class="contact-title">
		<h4>INFORMATION</h4>
	</div>
	<div class="clearfix address">
		<span class="contact-i"><i class="fa fa-map-marker"></i></span>
		<span class="contact-span">(Kor)서울특별시 테헤란로 212</span>
	</div>
	<div class="clearfix phone-no">
		<span class="contact-i"><i class="fa fa-mobile"></i></span>
		<span class="contact-span">(02)3429-5114 <br>(02)3429-5112</span>
	</div>
	<div class="clearfix email">
		<span class="contact-i"><i class="fa fa-envelope"></i></span>
		<span class="contact-span">z1004man@naver.com <br>yidongky@naver.com</span>
	</div>
</div>			</div><!-- /.contact-page -->
		</div><!-- /.row -->
	
	</div><!-- /.container -->
</div><!-- /.body-content -->


	<%-- FOOT2 --%>
	<jsp:include page="FOOT2.jsp"></jsp:include>


</body>
</html>