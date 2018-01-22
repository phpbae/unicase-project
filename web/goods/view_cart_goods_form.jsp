<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
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

	    <title>MyCart</title>

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

		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>		

		
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



<% 


ArrayList<BoxBean> bean = ((ArrayList<BoxBean>)request.getAttribute("bean"));  


%>


<script>
	
	<%-- data-set을 이용해 해당상품의 상품번호를 가져오고 삭제버튼클릭시 이벤트 처리--%>
	
	$(function(){
		$("#goods_list tbody tr #order button").click(function(){
			var box_num = $(this).data("box_num");
			location.href = "delete_goods_from_cart.do?box_num="+box_num;
		});
//		switch(bean.get(i).getGoods_color_num())
		var select = document.getElementById("select_color");
//		
<%-- <%		for(int i=0; i<bean.size() ; i++){ %>
			$("#select_color<%=i%> option").eq(<%=bean.get(i).getGoods_color_num()%>-1).attr("selected", "selected");
<%		}%> --%>

		//var res_sum = document.getElementById("res_sum");
	
	});
	
	//체크 박스 전체 체크/해제
	function toggle_all_check_box(chk_obj){
	    var chkYN = chk_obj.checked;
	    var obj = document.getElementsByName("check_list");
	    
	    
	    if(chkYN == true){
	    	for(var i = 0 ; i < obj.length ; i++){
	    		obj[i].checked = true;
	    	}
	    } else {
	    	for(var i = 0 ; i < obj.length ; i++){
	    		obj[i].checked = false;
	    	}
	    }
	    check_sum();
				
		/*		
	    for (i = 0; i < chk.length; i++){
	    	var a = $("#check_list" + i).data("goods_price");
	    	alert(a);
	    }
		*/
	    //res_sum.innerHTML = sum;
	}
	
	function order_all()
	{
		var arr_goods = document.getElementsByName("check_list");
		var arr_goods_num;
		var idx = 0;
		var _idx = 0;
		var checked_item_cnt = 0;
		
		$('#goods_list > tbody input[type=checkbox]:checked').each(function(){
			checked_item_cnt++;
    	});
		
		var arr_box = new Array(checked_item_cnt);
		for(var i = 0; i < checked_item_cnt; i++){
			arr_box[i] = new Array(5);
		}
		
		alert("ot");
		$('#goods_list > tbody input[type=checkbox]:checked').each(function(){
			var index = $(this).data("c_index");
			arr_box[idx][_idx++] = $('#order'+index+' button').data('box_num');
			arr_box[idx][_idx++] = $('#color'+index+'_1').val();
			arr_box[idx][_idx++] = $('#color'+index+'_2').val();
			arr_box[idx][_idx++] = $('#color'+index+'_3').val();
			arr_box[idx][_idx++] = $('#color'+index+'_4').val();
			
			_idx = 0;
    	});
	}
	//체크버튼이 클릭 될때마다 실행되는 함수
	//체크된 항목마다 값을 더하여 res_sum에 더하여 준다.
	function check_sum()
	{
		var sum = 0;
		
		$('#goods_list > tbody input[type=checkbox]:checked').each(function(){
			for(i=1; i<5 ; i++){
				$("#goods_list tbody tr #order button")
	    		sum += $("#goods_list tbody tr #color_"+i).val() * $(this).data("goods_price");
			}
	    });
		
				/*
		var obj = document.getElementsByName("check_list");
	   	var sum = 0;
	   	
	   	alert(chk.checked);
		
		for(var i=0; i<obj.length; i++){
			if( obj[i].checked == true ){
				sum += Number( $(chk).data("goods_price") );
			}
		}
		*/
		$("#res_sum").html(sum);
	}
	
	function check_sum_sub()
	{
		var sum = 0;
		var index;
		$("#goods_list tbody tr input[type=number]").each(function(){
			index = $("#color_1").data("l_index");
			sum += $(this).val() * $( "#check_list"+index ).data("goods_price");

			alert( sum);
		});
		
		$("#goods_sum"+index).html(sum)
	}
	
	function change_goods_count(inpt)
	{
		var index = $(inpt).data(l_index);
		var param = {
			goods_cnt1 : $(inpt).val(),
			goods_cnt2 : $("#color"+index+"_2").val(),
			goods_cnt3 : $("#color"+index+"_3").val(),
			goods_cnt4 : $("#color"+index+"_4").val(),
			box_num : $("#order"+$(inpt).data("l_index")+" button").data("box_num")
		}
		 $.ajax({
			url : "BuyGoodsProServlet",
			type : "post",
			data : param,
			success : function(data){
			}
		});	 
	}
	
	<%-- function send_post()
	{
		var param = {
			for(var i=0; i < <%=bean.size()%> ; i++){
				box_num : "<%=bean.size()%>"
			}
			goods_cnt : $(inpt).val(),
			box_num : $("#order"+$(inpt).data("l_index")+" button").data("box_num")
		}
		 $.ajax({
			url : "BuyGoodsProServlet",
			type : "post",
			data : param,
			success : function(data){
			}
		});	  --%>
		

		
		function ajaxExample(){
		    // 사용자 ID를 갖고 온다.
		    var arr = new Array();
		    arr[0] = new Array();
		    arr[1] = new Array();
		    arr[0][0] = "aa";
		    arr[0][1] = "bb";
		    arr[1][0] = "cc";
		    arr[1][1] = "dd";
		    var box_num = new Array(<%=bean.size()%>);
		    for(var i=0 ; i< <%=bean.size()%> ; i++){
		    	box_num[i] = $("#box_num"+i).val();
		    }
		    var goods_amount = new Array(<%=bean.size()%>);
		    for(var i=0 ; i < <%=bean.size()%> ; i++){
		    	var cnt = new Array(4);
		    	cnt[0] = $("#color"+i+"_1").val();
		    	cnt[1] = $("#color"+i+"_2").val();
		    	cnt[2] = $("#color"+i+"_3").val();
		    	cnt[3] = $("#color"+i+"_4").val();
		    	goods_amount[i]=cnt;
		    }
		     var testval = new Array(3);
		    /*for(var i=0 ; i<3 ; i++){
		    	testval[i] = new Array(3); 
		    } */
		    
		     for(var i=0 ; i<3 ; i++){
		    	var val = new Array(3);
		    	for(var j=0 ; j<3 ; j++){
		    		val[i]=j;
		    	}
		    	testval[i]=val;
		    } 
		    alert(box_num[0]);
		 /* 
		     // name이 같은 체크박스의 값들을 배열에 담는다.
		    var checkboxValues = [];
		    $("input[name='hobby']:checked").each(function(i) {
		        checkboxValues.push($(this).val());
		    });
		      */
		    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
		    var allData = { "box_num": box_num, "goods_amount": goods_amount, "arr": arr};
		     
		    $.ajax({
		        url:"BuyGoodsProServlet.credu",
		        type:'get',
		        data: allData,
		        success:function(data){
		            alert("완료!");
		            window.opener.location.reload();
		            self.close();
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            self.close();
		        }
		    }); 
	}
</script>
</head>

<body class="cnt-home">
			
	<%-- 리퀘스트의 상품번호&저장된 상품번호 갯수를 이용해서 상품리스트를
		출력한다.--%>
	
	<jsp:include page="../TOP.jsp"/>
	
	
<div class="breadcrumb">
   <div class="container">
      <div class="breadcrumb-inner">
         <ul class="list-inline list-unstyled">
            <li><a href="Index.credu">Home</a></li>
            <li><a href="javascript:history.back()">Back</a></li>
            <li class='active'>My Cart</li>
         </ul>
      </div><!-- /.breadcrumb-inner -->
   </div><!-- /.container -->
</div><!-- /.breadcrumb -->
	
	<div class="container">
	
	<form method="post" action="buy_goods_form.credu">
		
		<div class="row table-responsive">
			<table id="goods_list" class="table table-bordered">
				<thead>
					<tr>
						<th style="text-align: center;"><input type="checkbox" name="check_list_all" onchange="toggle_all_check_box(this);" ></th>
						<th style="text-align: center;" width="50%">상품명</th>
						<th style="text-align: center;" width="20%">수량</th>
						<th style="text-align: center;" width="20%">가격</th>
						<th style="text-align: center;" width="10%">주문</th>
					</tr>
				</thead>
				
				<tbody>
								
					<%String[] image = new String[bean.size()]; 
					 for(int i=0 ; i < bean.size() ; i++){
						 image[i] = "admin/upload/"+bean.get(i).getGoods_image();
					 }
					 %>
					 
					<%	for(int i = 0; i < bean.size() ; i++){ %>
						<tr data-index="<%=i%>">
							<input id="box_num<%=i %>" type="hidden" name="box_num" value="<%=bean.get(i).getBox_num()%>"/>
							<input type="hidden" name="goods_num" value="<%=bean.get(i).getGoods_num()%>"/>
							<input type="hidden" name="goods_image" value="<%=image[i] %>"/>
							<input type="hidden" name="box_goods_price" value="<%=bean.get(i).getBox_goods_price() %>"/>
							<td><input type="checkbox" id="check_list<%=i%>" name="check_list" onchange="check_sum()" data-goods_price="<%=bean.get(i).getBox_goods_price() %>" data-c_index="<%=i%>"></td>
							<td><img src="<%=image[i] %>" width="150px" height="100px"/>상품Title Text</td>
							<td>
								<label for="color_1">빨강 :</label> <input id="color<%=i %>_1" name="color_1" type="number" min="0" value="<%=bean.get(i).getGoods_color_num_1() %>" onchange="check_sum_sub()" style="width:40px" data-l_index="<%=i%>" onclick="change_goods_count(this);"/><br/>
								<label for="color_2">검정 :</label> <input id="color<%=i %>_2" name="color_2" type="number" min="0" value="<%=bean.get(i).getGoods_color_num_2() %>" onchange="check_sum_sub()" style="width:40px" data-l_index="<%=i%>" onclick="change_goods_count(this);"/><br/>
								<label for="color_3">노랑 :</label> <input id="color<%=i %>_3" name="color_3" type="number" min="0" value="<%=bean.get(i).getGoods_color_num_3() %>" onchange="check_sum_sub()" style="width:40px" data-l_index="<%=i%>" onclick="change_goods_count(this);"/><br/>
								<label for="color_4">파랑 :</label> <input id="color<%=i %>_4" name="color_4" type="number" min="0" value="<%=bean.get(i).getGoods_color_num_4() %>" onchange="check_sum_sub()" style="width:40px" data-l_index="<%=i%>" onclick="change_goods_count(this);"/><br/>							
							</td>
							<td>
								<div id="goods_sum<%=i%>"><%=bean.get(i).getBox_goods_price() %> 원</div>
							</td>
							<td id="order<%=i%>"> <button class="btn btn-default" type="submit">주문하기</button><br/>
								<div style="height:5px"></div>
								<button type="button" class="btn btn-warning" data-box_num=<%=bean.get(i).getBox_num() %>>삭제하기</button>
							</td>
						</tr>
					<%	} %>
					
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<!-- <table class="table">
				<tbody>
					<tr>
						<td>총결제 금액: <div id="res_sum"></div></td>
						<td>적립 포인트: 212121</td>
					</tr>
					<tr>
						<td>
							<form id="order_frm" method="post" action="BuyGoodsProServlet.do">
								<button class="btn btn-warning" onclick="post_to_url('BuyGoodsProServlet.do')">상품주문</button>
								<input type="hidden" name="bean" value=bean/>
								<button type="submit">상품주문</button>
							</form>
								<button onclick="ajaxExample()">테스트</button>
							<button class="btn btn-warning" onclick="order_all();">상품주문</button>
						</td>
					</tr>
				</tbody>
			</table> -->
		</div>
		<input type="hidden" name="bean_size" value="<%=bean.size()%>"/>
		
		</form>
	</div>
</body>
</html>