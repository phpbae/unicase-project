<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bean.*" %>
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

	    <title>Pay_Result</title>

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

		
		<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="../assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="../assets/images/favicon.ico">

		<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->


<script>
function return_value()
{
	var result = "<%=request.getParameter("result")%>";
	switch(result){
	//주문결과 성공시 부모창으로 값을 반환
	case "1":
		opener.return_value_from_popup(result);
		self.close();
		break;
	}
}
$(function(){
	return_value();
});

function nextWin() {
	
	location.href = "../index.jsp";
	
}

</script>
</head>
<body class="cnt-home" onload="setTimeout('nextWin()', 2000)">

<div class="container">
	<div class="panel panel-primary">
	     <div class="panel-heading">결제완료</div>
	     <div class="panel-body"><%=((MemberBean)session.getAttribute("login")).getUser_name() %>님의 주문이 정상적으로 완료 되었습니다.(2초후 Page 이동)</div>
	</div>
</div>

</body>
</html>