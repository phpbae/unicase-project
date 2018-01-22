<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<%@page import="bean.*"%>
<%@page import="DB.*"%>


<%

			//파라미터 한글 처리
			request.setCharacterEncoding("utf-8");

			MemberBean bean = (MemberBean) session.getAttribute("login");
			

			int tot = 0;
			// Null값일때 형변환 하면 에러가나니.. 체크
			if (request.getAttribute("tot") != null) {

				tot = (Integer) request.getAttribute("tot");

			}
	
			
			// 페이지 번호 추출
			String page_num = request.getParameter("page_num");
			if (page_num == null) {
				page_num = "1";
			}
			
			
			


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



<title>Customer_delivery Manage</title>

<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<%-- BootStrap CDN --%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
	function read() {
		location.href = "customer_delivery_read.credu"
	}
</script>

<script type="text/javascript">
	// 배송인덱스를 가지는 전역변수
	var G_delivery_idx;

	function customer_delivery_read(d_idx) {
<%--customer_delivery_read 서블릿 호출--%>
	G_delivery_idx = d_idx;
		//파라미터
		var param = {
			delivery_idx : d_idx
		}
		//요청
		$.ajax({
			
			url : "customer/customer_delivery.jsp",
			dataType : "text",
			data : param,
			type : "post",
			success : function(data) {

				$("#order_num").val(data.order_num);
				$("#order_goods_amount").val(data.order_goods_amount);
				$("#order_pay_opt").val(data.order_pay_opt);
				$("#order_invoice").val(data.order_invoice);
				$("#order_delivery_opt").val(data.order_delivery_opt);
				$("#order_date").val(data.order_date);
				$("#to_name").val(data.to_name);
				$("#to_addr").val(data.to_addr);
				$("#to_phnum").val(data.to_phnum);
			}
		});
	}
</script>
</head>
<body>

	<div class="container">
		<h2>배송 조회</h2>
		<p>
			<span class="label label-success">${sessionScope.login.user_name}님
				안녕하세요.</span>
		</p>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문수량</th>
						<th>결제방법</th>
						<th>송장번호</th>
						<th>배송방법</th>
						<th>주문날짜</th>
						<th>받는사람이름</th>
						<th>받는사람주소</th>
						<th>연락처</th>
						<th>배송결과</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="DeliveryBean" items="${requestScope.list}">

						<tr class="info">
							<td>${DeliveryBean.getOrder_num()}</td>
							<td>${DeliveryBean.getOrder_goods_amount()}</td>
							<td>${DeliveryBean.getOrder_pay_opt()}</td>
							<td>${DeliveryBean.getOrder_invoice()}</td>
							<td>${DeliveryBean.getOrder_delivery_opt()}</td>
							<td>${DeliveryBean.getOrder_date()}</td>
							<td>${DeliveryBean.getTo_name()}</td>
							<td>${DeliveryBean.getTo_addr()}</td>
							<td>${DeliveryBean.getTo_phnum()}</td>
							
							<c:choose>
							
							<c:when test="${DeliveryBean.getOrder_delivery_rs() == 0}">
							
								<td>결제완료</td>
								
							</c:when>
							
							<c:when test="${DeliveryBean.getOrder_delivery_rs() == 1}">
							
								<td>배송 준비중</td>
								
							</c:when>
							
							<c:when test="${DeliveryBean.getOrder_delivery_rs() == 2}">
							
								<td>배송중</td>
								
							</c:when>
							
							<c:when test="${DeliveryBean.getOrder_delivery_rs() == 3}">
							
								<td>배송완료</td>
								
							</c:when>
							
							
							</c:choose>
							
							
						</tr>

					</c:forEach>

				</tbody>
			</table>
			</tbody>
			</table>
		</div>
		<div class="panel with panel-danger class">
			<div class="panel-heading">배송 문의</div>
			<div class="panel-body">
				- 배송완료시점은 고객님이 실제 받으신 날짜와 차이가 있을 수 있습니다.</br> - 인터넷 배송 정보제공은 우편물배달 여부를
				고객에게 신속히 알려주는 것이 목적이며 각종 이해관계의 증거자료로 사요하기 위해서는 배달증명 서비스를 이용하시기 바랍니다.</br>
				- 조회서비스는 1년 미만의 우편물만 가능합니다.</br> - 자세한 사항은 우편고객만족센터(1588-1300)로 문의하시기
				바랍니다.
			</div>
		</div>
	</div>
</body>
</html>