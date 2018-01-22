<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.*" %>

<% 

	//파라미터 한글처리
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



<title>Goods Manage</title>
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
<script>
	<%
	String page_num = request.getParameter("page_num");
	if(page_num == null){
		page_num = "1";
	}
	%>
	$(function(){
		$("#item_board_list tbody tr").click(function(){
			// tr 태그에서 idx 값을 얻어온다.
			// 일반 javaScript(data-이름)
			// 태그이름.data.이름
			var num = $(this).data("num");
			// 이동한다.
			location.href="Itemboard_read.credu?goods_num=" + num + "&page_num=<%=page_num%>";
		});
		
		
		$("#page_indicator li:nth-child(<%=page_num%>)").addClass("active");
	});
	

</script>
</head>
<body>

<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<li><a href="main_page.credu">Home</a></li>
					<li><a href="administrator.credu">Back</a></li>
					
					    <% 
							if (bean == null || bean.isLogin_check() == false){
						%>
						
						<% } else{%>
						
						<li><a href="logout.credu" onclick="msg()">Logoff</a></li>
						<li class='active'><i class="icon fa fa-lock"></i> Admin_Goods Manage</li>
							
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
		<div class="row">
		<br/>
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
					<img src="login/image/computer.jpg" width="304" 
		     height="230" alt="컴퓨터이미지"
		     class="img-responsive"/>
		     <H1>상품관리</H1>
				<div class="col-sm-10"><span class="label label-success">${sessionScope.login.user_name}님이 로그인하셨습니다.</span></div>
				
				<table class="table table-hover" id="item_board_list">
					<thead>
						<tr>
							<th width="10%">분류코드</th>
							<th wdith="10">상품코드</th>
							<th width="70%">상품이름</th>
						</tr>
					</thead>
					<tbody>
					
<%
/*
	String goods_num;
	int goods_code; 
	String goods_name;
	String goods_img; 
	String goods_brand;
	int goods_price; 
	String goods_info;
	int goods_points;
	//상품 생삭에 따른 수량
	int goods_color_num; 
	int godds_amount;
*/
%>			
					
					
					 <%
			ArrayList<ItemBean> list
				= (ArrayList<ItemBean>)request.getAttribute("list");
					// 데이터의 개수만큼 반복
					for(ItemBean goodsbean : list){
					%>
						<tr data-num="<%=goodsbean.getGoods_num()%>">
						<td><%=goodsbean.getGoods_code()%></td>
						<td><%=goodsbean.getGoods_num()%></td>
						<td><%=goodsbean.getGoods_name()%></td>		
						</tr>
					<% } %>
					</tbody>
				</table>
				페이지 번호
				<%
					// 페이지의 총 개수를 추출
					int page_cnt = (Integer)request.getAttribute("cnt");
				%>
				<div style="text-align:center">
					<ul class="pagination" id="page_indicator">
					<% for(int i = 0 ; i < page_cnt ; i++){ %>
						<li>
							<a href="ItemMainBoard.credu?page_num=<%=i+1%>"><%=i + 1%></a>
						</li>
					<% } %>
					</ul>
				</div>
				<%-- 글쓰기 버튼 --%>
				<div style="text-align:right">
					<a href="item_register.credu"
					   class="btn btn-success">
					   상품등록하기
					</a>
				<%-- 내가 쓴 글보기 버튼 --%>	
					<a href="ItemMainBoard.credu"
					   class="btn btn-success">
					  최근등록날짜로보기
					</a>					
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>










