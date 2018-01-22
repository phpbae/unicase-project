<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>LOGINPage</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/board.css"/>


<!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	    
	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="../assets/css/main.css">
	    <link rel="stylesheet" href="../assets/css/green.css">
	    <link rel="stylesheet" href="../assets/css/owl.carousel.css">
		<link rel="stylesheet" href="../assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="../assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="../assets/css/animate.min.css">
		<link rel="stylesheet" href="../assets/css/rateit.css">
		<link rel="stylesheet" href="../assets/css/bootstrap-select.min.css">

		

		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="../assets/css/font-awesome.min.css">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="../assets/images/favicon.ico">





<script>
	function check_form(){
		// 아이디가 비어 있는지...
		if($("#user_id").val() == ""){
			alert("사용자 아이디를 입력해주세요");
			$("#user_id").focus();
			return false;
		}
		// 비밀번호가 비어 있는지...
		if($("#user_pw").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("#user_pw").focus();
			return false;
		}
		return true;
	}
	

	
</script>
</head>
<body>

<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="../Index.credu">Home</a></li>
				<li><a href="javascript:history.back()">Back</a></li>
				<li class='active'>Login</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->
	
	<div class="container">
		<div class="row login-box">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
							<h1><span class='text-success'>LOGIN</span></h1>
		<img src="../login/image/computer.jpg" width="304" 
		     height="230" alt="컴퓨터이미지"
		     class="img-responsive"/>

				<%-- 로그인 부분 --%>
				<div class="panel panel-success">
					<div class="panel-heading" style="background:#47C83E">
					
					<h4><span class="label label-success">LOGIN</span></h4>
					
					</div>
					<div class="panel-body">
					<c:choose>
						<c:when test="${param.result eq '2'}">
							<center>
								<h3>아이디를 잘못 입력하셨습니다</h3>
							</center>
						</c:when>
						<c:when test="${param.result eq '3' }">
							<center>
								<h3>비밀번호를 잘못 입력하셨습니다</h3>
							</center>
						</c:when>
					</c:choose>
						<form class="form-horizontal" role="form"
						      method="post" action="../login_pro.credu"
						      onsubmit="return check_form()">
						      <div class="form-group">
						      	<label class="control-label col-sm-5" for="user_id">
						      		<span class="text-success">아이디 :</span>
						      	</label>
						      	<div class="col-sm-7">
						      		<input type="text" id="user_id" name="user_id"
						      		       class="form-control" placeholder="아이디" 
						      		       autocomplete="off"/>
						      	</div>
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-5" for="user_pw">
						      		<span class="text-success">비밀번호 :</span> 
						      	</label>
						      	<div class="col-sm-7">
						      		<input type="password" id="user_pw" name="user_pw"
						      		       class="form-control" placeholder="비밀번호"/>
						      	</div>
						      </div>
						      <div style="text-align: right">
							      <button type="submit" class="btn btn-success">
							      	로그인
							      </button>
							      <button type="reset" class="btn btn-success">
							      	초기화
							      </button>
						      </div>
						</form>
					</div>
				</div>
				<a href="user/add_user_form.jsp" class="btn btn-success btn-block">회원가입</a>
				<span class="text-success"> 쇼핑몰을 이용시  반드시 로그인이 필요합니다.</span>
			
			</div>
			<div class="col-sm-3"></div>
		</div>
		
	</div>
</body>
</html>










