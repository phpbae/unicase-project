<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DB.*"%>
<%@ page import="review.*"%>
<%@ page import="bean.*"%>

<% 
	//파라미터 한글처리
	request.setCharacterEncoding("utf-8"); 
	MemberBean bean = (MemberBean) session.getAttribute("login");		
	 int tot = 0;
	 // Null값일때 형변환 하면 에러가나니.. 체크
	 if(request.getAttribute("tot") != null){
		 tot = (Integer)request.getAttribute("tot");
	 }
	 int align = 0;
	 if(request.getParameter("align")!= null){
		 align = Integer.parseInt(request.getParameter("align"));
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Delivery Manage</title>
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
	function admin_page() {
		location.href="administrator.credu";		
	}
	function read() {
		location.href="delivery_read.credu"
	}
</script>
      
<script type="text/javascript">
	// 배송인덱스를 가지는 전역변수
	var G_order_num;
	
	function delivery_read(d_num){
		<%--delivery_read 서블릿 호출--%>
		G_order_num = d_num;
		//파라미터
		
		var param = {
				order_num : d_num
		}
		//요청
		$.ajax({
			url : "delivery_read.credu",
			dataType : "json",
			data : param,
			type : "post",
			success : function(data){
			
				
				$("#order_num").val(data.order_num);
				$("#user_id").val(data.user_id);
				$("#order_user_name").val(data.order_user_name);
				$("#order_goods_amount").val(data.order_goods_amount);
				$("#order_pay_opt").val(data.order_pay_opt);
				$("#order_state").val(data.order_state);
				$("#order_date").val(data.order_date);
				$("#order_invoice").val(data.order_invoice);
				$("#order_delivery_opt").val(data.order_delivery_opt);
				$("#to_name").val(data.to_name);
				$("#to_addr").val(data.to_addr);
				$("#to_phnum").val(data.to_phnum);
				
				$("#order_delivery_rs > option").removeAttr("selected");
				$("#order_delivery_rs > option").eq(data.user_grade-1).attr("selected", "selected");
			}
		});
	}
	
	function delivery_change() {
		<%-- delivery_change 서블릿 호출 --%>
		//파라미터
		var param = {
				delivery_idx : G_delivery_idx
		}
		var align = <%=align%>;
			//요청
			$.ajax({
				url : "delivery_change.credu",
				dataType : "text",
				data : param,
				type : "post",
				success : function(data) {
					alert("배송상태가 수정 되었습니다.");
					G_delivery_idx = null; //전역변수 초기화
					location.href = "delivery_change.credu";
				}
			});
		} //delivery_change()
		
		function delivery_delete() {
			<%-- delivery_delete 서블릿 호출--%>
			//파라미터
			var param = {
					delivery_idx : G_delivery_idx
			}
			$.ajax({
				url : "delivery_delete.credu",
				dataType : "text",
				data : param,
				type : "post",
				success : function(data){
					alert("해당 배송정보가 삭제 되었습니다.");
					G_delivery_idx = null;
					location.href = "delivery_delete.credu";
				}
				
			});
		}
</script>
</head>
<body>
<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="administrator.credu">Back</a></li>
					<%
						if (bean == null || bean.isLogin_check() == false) {
					%>
					<%
						} else {
					%>
					<li><a href="logout.credu" onclick="msg()">Logoff</a></li>
					<li class='active'><i class="icon fa fa-lock"></i>
						Admin_Delivery Manage</li>
					<%
						if (bean.getUser_grade() == 1 || bean.getUser_grade() == 2) {
					%>
					<%
						response.sendRedirect("index.jsp");
					%>
					<%	}	%>
					<%}	%>
				</ul>
			</div>
			<!-- /.breadcrumb-inner -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.breadcrumb -->
	
	<div class="container">
		<h4 class="info-box-heading green">Delivery List</h4>
		
		<form action="admin_delivery.credu" method="post">	
		Search
		<input class="search-field" placeholder="Order_Num" name="search" id="search">
		<button class="btn btn-primary" type="submit"><i class="icon fa fa-search"></i>검색</button> 
		<button class="btn btn-primary" type="button" onclick="admin_page()"><i class="icon fa fa-bars"></i>처음으로</button> 
		<div class="btn-group" align="right">
    		<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >
    			정렬<span class="caret"></span>
    		</button>
    		  <ul class="dropdown-menu">
    		   <li><a href="admin_delivery.credu?align=0">
     		   		<% if(align ==0){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
     		   결제완료 내림차순</a>
     		   </li>
    		  <li><a href="admin_delivery.credu?align=1">
     		   		<% if(align !=0 && align ==1){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
     		   배송준비중 내림차순</a>
     		   </li>
     		   <li><a href="admin_delivery.credu?align=2">
     		   <% if(align !=0 && align ==2){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
     		  	 배송중 내림차순</a></li>
    		   <li><a href="admin_delivery.credu?align=3">
    		   	<% if(align !=0 && align ==3){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
    		    배송완료 내림차순</a></li>
  			  </ul>
  			</div>
		</form>
		
		<table class="table">
			<thead>
				<tr>
						<th>주문번호</th>
						<th>아이디</th>
						<th>주문자</th>
						<th>결제방법</th>
						<th>배송방법</th>
						<th>주문날짜</th>
						<th>배송결과</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach var="DeliveryBean" items="${requestScope.list}">
				
				<tr class="info">
				  <td><a id="ID" data-toggle="modal" data-target="#myModal2" onclick="delivery_read(${DeliveryBean.order_num})">${DeliveryBean.order_num}</a></td>
					<td>${DeliveryBean.user_id}</td>
					<td>${DeliveryBean.order_user_name}</td>
					<td>${DeliveryBean.order_pay_opt}</td>
					<td>${DeliveryBean.order_delivery_opt}</td>
					<td>${DeliveryBean.order_date}</td>
					
					<c:choose>
						<%-- if(a == 0){ --%>
						<c:when test="${DeliveryBean.order_delivery_rs == 0}">
							<td>결제완료</td>
						</c:when>
						<%-- } else if(a == 1){ --%>
						<c:when test="${DeliveryBean.order_delivery_rs == 1}">
							<td>배송준비중</td>
						</c:when>
						<%-- } else if(a == 2){ --%>
						<c:when test="${DeliveryBean.order_delivery_rs == 2}">
							<td>배송중</td>
						</c:when>
						<%-- } else if(a ==3){ --%>
						<c:when test="${DeliveryBean.order_delivery_rs == 3}">
							<td>배송완료</td>
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				<div class="row">
			<div class="col-sm-6">
			
				<div style="text-align:left">
					<ul class="pagination" id="page_num">
						<li>
						 <% for(int i = 1 ; i<=tot ; i++){ %>
   						 <a href="delivery_read.credu?Page_num=<%=i%>"><%=i%></a>
  						 <% } %>
										
						</li>
					</ul>
				</div>
				<div class="col-sm-2"></div>
			<div class="col-sm-4 text-success" style="text-align: right;">
  			</div>
  			</div>
  			</div>
  			<!-- Modal2 _ delivery read -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delivery Detail</h4>
        </div>
    
        <div class="modal-body">
          	<%-- form --%>
          	<form action="delivery_memberupdate.credu" class="form-horizontal" method="post">
    		<%-- order_num --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">주문번호</label>
      		<div class="col-sm-10">
        		<input type="text" class="form-control" name="order_num" id="order_num" value="" readonly="readonly">
      		</div>
    		</div>
    		<%-- user_id --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">아이디</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_id" id="user_id" value="" readonly="readonly">
      		</div>
    		</div>
    		<%-- user_name --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">주문자</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="order_user_name" id="order_user_name" value=""  readonly="readonly">
      		</div>
    		</div>
    		<%-- order_goods_amount --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">주문수량</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="order_goods_amount" id="order_goods_amount" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		<%-- order_pay_opt --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">결제방법</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="order_pay_opt" id="order_pay_opt" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		<%-- order_invoice --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">송장번호</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="order_invoice" id="order_invoice" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		<%-- regdate --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">배송방법</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="order_delivery_opt" id="order_delivery_opt" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		<%-- to_name --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">받는 사람의 이름</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="to_name" id="to_name" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		<%-- to_addr --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">받는 사람의 주소</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="to_addr" id="to_addr" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		
    		<%-- to_phnum --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">받는 사람 휴대폰</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="to_phnum" id="to_phnum" value="" readonly="readonly">
      		</div>
    		</div>
    		
    		<%-- order_delivery_rs --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">배송상태</label>
      		<div class="col-sm-10">          
        	 	<select class="form-control" id="order_delivery_rs" name="order_delivery_rs" onchange="this">
			     <option value="1">배송준비중</option>
			     <option value="2">배송중</option>
			     <option value="3">배송완료</option>
			  	</select>
    		</div>
    		</div>
    		
    		<div class="form-group">        
      		<div class="col-sm-offset-2 col-sm-10">
        	<button onclick="javascript:alert('회원정보수정')" type="submit" class="btn btn-success"><i class="icon fa fa-exchange"></i>배송현황수정</button>
      		</div>
    		</div>
  	</form>         	
                    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  </div>
  			
</body>
</html>