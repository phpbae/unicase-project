<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bean.*" %>

<%-- <% session.setAttribute("login", user_bean) %> --%>
	<% MemberBean bean = (MemberBean)session.getAttribute("login"); %>
	
	<%--((MemberBean)session.getAttribute("login")).getUser_id()  --%>
	 
	
	<%
		String[] box_num = request.getParameterValues("box_num");
		String[] goods_num = request.getParameterValues("goods_num");
		String[] goods_image = request.getParameterValues("goods_image");
		String[] box_goods_price = request.getParameterValues("box_goods_price");
		
		int[] goods_cnt = new int[box_num.length];
		String[] color_1 = request.getParameterValues("color_1");
		String[] color_2 = request.getParameterValues("color_2");
		String[] color_3 = request.getParameterValues("color_3");
		String[] color_4 = request.getParameterValues("color_4");
		for(int i = 0; i < box_num.length ; i++){
			goods_cnt[i] = Integer.parseInt(color_1[i]) + Integer.parseInt(color_2[i]) + Integer.parseInt(color_3[i]) + Integer.parseInt(color_4[i]);
			box_goods_price[i] = String.valueOf( goods_cnt[i] + Integer.parseInt(box_goods_price[i]) ) ;
		}
	%>

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

	    <title>결제Page</title>

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

<script>


	var open_popup = null;
	var num;
	var user_name = "<%=((MemberBean)session.getAttribute("login")).getUser_name()%>";
	var user_addr = "<%=((MemberBean)session.getAttribute("login")).getUser_addr()%>";
	var user_phnum = "<%=((MemberBean)session.getAttribute("login")).getUser_phnum()%>";

	<%-- 새창으로 결제를 진행하기 위한 함수 --%>
	function pop_up()
	{
		<%-- 배송방법을 선택하지 않았을때를 체크하는 함수 --%>
		if($(order_delivery_opt).val() == ""){
			alert("배송방법을 선택해주세요");			
			$(order_delivery_opt).focus();
			return false;
		}
		
		if( !open_popup || open_popup.closed ){
		    var popwidth   = "400";
		    var popheight  = "700"; 
		    var leftPos    = (screen.width)  ? (screen.width-popwidth)/2   : 0;
		    var topPos     = (screen.height) ? (screen.height-popheight)/2 : 0;   
		    var winName    = "payment_browser";
		    var features   = 'resizable=no, left='+ leftPos+', top='+ topPos;
		          features  += ',location=no,directories=no,menubar=no,scrollbars=auto';
		          features  += ',width='+ popwidth+ ',height='+ popheight;
		    
		    window.open('', winName, features);
		    document.popupFrm.target = winName;
		    document.popupFrm.submit();
		} else {
			alert("이미 결제창이 활성화되어 있습니다.");
		}
		
		return false;
	}
	
	function return_value_from_popup(order_result)
	{
		switch(order_result){
		case "1":
			location.href="pay_result_form.jsp";
			break;
		}
	}
	
	
	function radio_click(value){
		switch(value){
		case "1":
			document.getElementById("user_name").style.display = "";
			document.getElementById("user_addr").style.display = "";
			document.getElementById("user_phnum").style.display = "";
			document.getElementById("user_name2").style.display = "none";
			document.getElementById("user_addr2").style.display = "none";
			document.getElementById("user_phnum2").style.display = "none";	
			break;
		case "2":
			document.getElementById("user_name").style.display = "none";
			document.getElementById("user_addr").style.display = "none";
			document.getElementById("user_phnum").style.display = "none";
			document.getElementById("user_name2").style.display = "";
			document.getElementById("user_addr2").style.display = "";
			document.getElementById("user_phnum2").style.display = "";
			break;
		}
	}
</script>
</head>
<body class="cnt-home">
	
	<jsp:include page="../TOP.jsp"/>
	
	
	<div class="breadcrumb">
   <div class="container">
      <div class="breadcrumb-inner">
         <ul class="list-inline list-unstyled">
            <li><a href="Index.credu">Home</a></li>
            <li><a href="javascript:history.back()">Back</a></li>
            <li class='active'>Pay</li>
         </ul>
      </div><!-- /.breadcrumb-inner -->
   </div><!-- /.container -->
</div><!-- /.breadcrumb -->
	
	
	
	<div class="container">
		<div class="row">
			장바구니 > 결제 > 완료
			<form class="form-horizontal" role="form" action="PayGoodsProServlet" method="post" 
				  name="popupFrm" onsubmit="return pop_up();" >
				<table class="table table-bordered">
					<thead>
						<tr>
							<th width="40%" style="text-align: center;">상품명</th>
							<th width="20%" style="text-align: center;">UNICASE 보유 수량</th>
							<th width="20%" style="text-align: center;">가격</th>
							<th width="20%" style="text-align: center;">주문수량 및 색상</th>
						</tr>
					</thead>
					<tbody>
<% 						for(int i=0; i < box_num.length ; i++){%>
							<tr>
								<td><img src="<%=goods_image[i] %>" width="100px" height="150px"/>상품이름 Text</td>
								<td><%=goods_num[i] %>개</td>
								<td><%=box_goods_price[i] %></td>
								<td>
									빨강: <%=color_1[i] %><br/>
									검정: <%=color_2[i] %><br/>
									노랑: <%=color_3[i] %><br/>
									파랑: <%=color_4[i] %>
								</td>
							</tr>
<%						} %>
					</tbody>
				</table>
				<div class=form-horizontal>
					<div class="form-group">
						<label class="col-sm-3">배송방법</label>
						<select name="order_delivery_opt" id="order_delivery_opt">
							<option value="">선택하세요</option>
							<option value="1">주문시결제(선결제)</option>
							<option value="2">상품수령시지불(착불)</option>
						</select>
					</div>
					<div class="form-group">
						<label class="col-sm-3">배송지선택</label>
						<div class="col-sm-6">
							<label class="radio-inline"><input type="radio" name="opt_radio" id="opt_radio1" onclick="radio_click(this.value)" value="1" checked>주문자 정보와 동일</label>
							<label class="radio-inline"><input type="radio" name="opt_radio" id="opt_radio2" onclick="radio_click(this.value)" value="2" >새로입력</label>
						</div>
						<div class="col-sm-3"></div>
					</div>
					<div class="form-group" id="user_name">
						<label class="col-sm-3">이름</label>
						<input type="text" class="col-sm-3" name="to_name" value="${sessionScope.login.user_name }"/>
						<div class="col-sm-6"></div>
					</div>
					<div class="form-group" id="user_name2" style="display:none">
						<label class="col-sm-3">이름</label>
						<input type="text" class="col-sm-3" name="to_name_2" />
						<div class="col-sm-6"></div>
					</div>
					<div class="form-group" id="user_addr">
						<label class="col-sm-3">주소</label>
						<input type="text" class="col-sm-9" name="to_addr" value="${sessionScope.login.user_addr }"/>
					</div>
					<div class="form-group" id="user_addr2" style="display:none">
						<label class="col-sm-3">주소</label>
						<input type="text" class="col-sm-9" name="to_addr_2" />
					</div>
					<div class="form-group" id="user_phnum">
						<label class="col-sm-3">휴대전화</label>
						<input type="text" class="col-sm-6" name="to_phnum" value="${sessionScope.login.user_phnum }"/>
						<div class="col-sm-6"></div>
					</div>
					<div class="form-group" id="user_phnum2" style="display:none">
						<label class="col-sm-3">휴대전화</label>
						<input type="text" class="col-sm-6" name="to_phnum_2" />
						<div class="col-sm-6"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-3">배송시 요구사항</label>
						<div class="col-sm-9">
							<input type="text" name="order_require"/>
						</div>
					</div>
					<h4><b>결제 정보 입력</b></h4>
					<br/>
					<div class="form-group">
						<label class="col-sm-3">결제 수단 선택</label>
						<div class="col-sm-6">
							<%-- 결제 수단 값은 결제페이지에서 사용하는 값으로 설정 --%>
							<label class="radio-inline"><input type="radio" id="pay_mean" name="pay_mean" value="1" >신용카드</label>
							<select name="card_pay_method">
								<option value="">선택하세요</option>
								<option value="01">BC</option>
								<option value="02">국민</option>
								<option value="03">우리</option>
								<option value="04">광주은행</option>
								<option value="05">수협</option>
								<option value="06">전북은행</option>
								<option value="07">우체국카드</option>
								<option value="08">MG새마을금고</option>
								<option value="09">상호저축은행</option>
								<option value="10">KDB</option>
								<option value="11">제주카드</option>
								<option value="12">신협</option>
								<option value="13">현대증권</option>
								<option value="14">교보증권</option>
								<option value="15">유진투자증권</option>
								<option value="16">미래에셋증권</option>
								<option value="17">동부증권</option>
								<option value="18">유안타증권</option>
								<option value="19">신한(LG)</option>
								<option value="20">삼성</option>
								<option value="21">현대</option>
								<option value="22">롯데</option>
								<option value="23">농협</option>
								<option value="24">씨티</option>
								<option value="25">하나</option>
								<option value="26">신현(현대)</option>
								<option value="27">삼성 올앳</option>
							</select>
							<label>카드에 BC로고가 있으면 BC카드를 선택해주세요.</label>
							<label class="radio-inline"><input type="radio" id="pay_mean" name="pay_mean" value="4" checked>실시간 계좌이체</label>
							<label class="radio-inline"><input type="radio" id="pay_mean" name="pay_mean" value="801">휴대폰 소액결제</label>
						</div>
						<div class="col-sm-3">
							<%for(int i=0 ; i < box_num.length ; i++){ %>
								<input type="hidden" name="box_goods_price" value="<%=box_goods_price[i] %>"/>
								<input type="hidden" name="order_goods_amount" value="<%=goods_cnt[i] %>"/>
								<input type="hidden" name="goods_num" value="<%=goods_num[i] %>"/>
								<input type="hidden" name="box_num" value="<%=box_num[i] %>"/>
							<%} %>
							<button type="submit">결제하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>