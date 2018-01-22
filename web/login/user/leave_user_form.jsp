<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 완료</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/board.css"/>
</head>
<body>
	
	<div class="container">
		<div class="row login-box">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<img src="../image/computer.jpg" width="304" height="230" alt="컴퓨터이미지"
		     		class="img-responsive"/>
				<h1><span class="text-success">Memberleave</span></h1>
				<div class="panel panel-success">				
					<div class="panel-heading">
						탈퇴페이지
					</div>
					<div class="panel-body">
						<h5>탈퇴하면 같은아이디로 가입 할수없습니다.</h5>
					</div>
				</div>
				<a href="../../leave_user.credu" 
				   class="btn btn-success btn-block">
				   탈퇴
				</a>
				<a href="../../index.jsp" 
				   class="btn btn-success btn-block">
				   취소
				</a>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>










