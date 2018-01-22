<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="bean.*"%>


<%
	//파라미터 한글 처리.
	request.setCharacterEncoding("utf-8");

	MemberBean bean = (MemberBean) session.getAttribute("login");
%>

<!DOCTYPE html>

<html>
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="MediaCenter, Template, eCommerce">
<meta name="robots" content="all">

<title>쇼핑몰 Admin</title>

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

<link href="assets/css/green.css" rel="alternate stylesheet"
	title="Green color">
<link href="assets/css/blue.css" rel="alternate stylesheet"
	title="Blue color">
<link href="assets/css/red.css" rel="alternate stylesheet"
	title="Red color">
<link href="assets/css/orange.css" rel="alternate stylesheet"
	title="Orange color">
<link href="assets/css/dark-green.css" rel="alternate stylesheet"
	title="Darkgreen color">
<!-- Demo Purpose Only. Should be removed in production : END -->


<!-- Icons/Glyphs -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
<!--[if lt IE 9]>
         <script src="assets/js/html5shiv.js"></script>
         <script src="assets/js/respond.min.js"></script>
      <![endif]-->

<script type="text/javascript">
	function msg() {
		alert("Logoff");
	}
</script>

</head>
<body class="cnt-home">




	<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<li><a href="Index.credu">Home</a></li>
					
					<% 
							if (bean == null || bean.isLogin_check() == false){
						%>
						
						<% } else{%>
						
						<li><a href="logout.credu" onclick="msg()">Logoff</a></li>
						<li class='active'><i class="icon fa fa-lock"></i> Admin</li>
							
							<% if(bean.getUser_grade()==1 || bean.getUser_grade()==2){ %>
								
								<%  response.sendRedirect("index.jsp"); %>
							
							<% } %>
						<% } %>
				</ul>
			</div>
			<!-- /.breadcrumb-inner -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.breadcrumb -->


	<div class="container">

		<div class="row cscenter-box">

			<div class="col-sm-12">
				<h2>Admin Page</h2>

				<%-- Admin 관리 카테고리 --%>
				<div class="col-sm-12">

					<div class="panel panel-success">
						<div class="panel-body">

							<div class="col-sm-6">
								<div class="panel panel-primary">
									<div class="panel-heading">회원관리</div>
									<div class="panel-body">
										<center>
											<a href="member.credu" class="btn btn-danger"
												role="button">회원관리하기</a>
										</center>
									</div>
								</div>
							</div>
							<%-- col-sm-6 --%>

							<div class="col-sm-6">
								<div class="panel panel-success">
									<div class="panel-heading">Q&A관리</div>
									<div class="panel-body">
										<center>
											<a href="board_main.credu" class="btn btn-warning"
												role="button">Q&A관리하기</a>
										</center>
									</div>
								</div>
							</div>
							<%-- col-sm-6 --%>

							<hr style="border: dotted 1px green;">

							<div class="col-sm-6">

								<div class="panel panel-primary">
									<div class="panel-heading">공지관리</div>
									<div class="panel-body">
										<center>
											<a href="notice.credu" class="btn btn-danger"
												role="button">공지사항관리하기</a>
										</center>
									</div>
								</div>
							</div>
							<%-- col-sm-6 --%>

							<div class="col-sm-6">
								<div class="panel panel-success">
									<div class="panel-heading">상품관리</div>
									<div class="panel-body">
										<center>
											<a href="ItemMainBoard.credu" class="btn btn-warning"
												role="button">상품관리하기</a>
										</center>
									</div>
								</div>
							</div>
							<%-- col-sm-6 --%>

							<hr style="border: dotted 1px green;">

							<div class="col-sm-6">

								<div class="panel panel-primary">
									<div class="panel-heading">주문관리</div>
									<div class="panel-body">
										<center>
											<a href="odermange_main.credu" class="btn btn-danger"
												role="button">주문관리하기</a>
										</center>
									</div>
								</div>

							</div>
							<%-- col-sm-6 --%>


							<div class="col-sm-6">

								<div class="panel panel-success">
									<div class="panel-heading">배송관리</div>
									<div class="panel-body">
										<center>
											<a href="admin_delivery.credu" class="btn btn-warning"
												role="button">배송관리하기</a>
										</center>
									</div>
								</div>

							</div>
							<%-- col-sm-6 --%>



						</div>





					</div>

				</div>


			</div>

		</div>
	</div>



</body>
</html>