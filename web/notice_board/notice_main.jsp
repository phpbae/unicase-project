<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.*" %>


<% 

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

<title>Notice Manage</title>

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
	
	
	$(function(){
		$("#notice_list tbody tr").click(function(){
			// tr 태그에서 idx 값을 얻어온다.
			// 일반 javaScript(data-이름)
			// 태그이름.data.이름
			var idx = $(this).data("idx");
			// 이동한다.
			location.href="notice_read.credu?notice_idx=" + idx;
		});
		
		
		
	});
	

</script>
</head>
<body>
	<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<li><a href="Index.credu">Home</a></li>
					<li><a href="administrator.credu">Back</a></li>
					
					    <% 
							if (bean == null || bean.isLogin_check() == false){
						%>
						
						<% } else{%>
						
						<li><a href="logout.credu" onclick="msg()">Logoff</a></li>
						<li class='active'><i class="icon fa fa-lock"></i> Admin_Notice Manage</li>
							
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
		
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
			<h4 class="info-box-heading green">Notice List</h4>
			
			<table class="table table-hover" id="notice_list">
				<thead>
					<tr>
						<th width="10%">#</th>
						<th>Notice Title</th>
						<th width="20%">Writer</th>
					</tr>
				</thead>
			
				<tbody>
			
					<%
					ArrayList<notice_Bean> list	= (ArrayList<notice_Bean>)request.getAttribute("list");
					
					// 데이터의 개수만큼 반복
					for(notice_Bean notice_bean : list){
					%>
						<tr data-idx="<%=notice_bean.getNotice_num()%>">
							<td><%=notice_bean.getNotice_num()%></td>
							<td><%=notice_bean.getNotice_title()%></td>
							<td><%=notice_bean.getUser_id()%></td>
						</tr>
					<% } %>
					</tbody>
				</table>
			
				
				<%-- 글쓰기 버튼 --%>
				<form class="title" method="post" action="notice_write.credu">

					<div style="text-align: left">
						
							<%
								MemberBean member_bean = (MemberBean) session.getAttribute("login");
								int user_grade = member_bean.getUser_grade();

								if (user_grade == 3) {
							%>
							<button type="submit" class="btn btn-primary">
							공지글쓰기
							</button>
						<%	}	%>
					</div>
				</form>

			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>










