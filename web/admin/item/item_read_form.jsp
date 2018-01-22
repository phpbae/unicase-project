<%@page import="bean.ItemBean"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품보기</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<%
	// 페이지 번호 추출
	String page_num = request.getParameter("page_num");
	if (page_num == null) {
		page_num = "1";
	}
%>
<%
	// 파라미터 한글 처리
	request.setCharacterEncoding("utf-8");
%>

<%
	ItemBean goodsbean = (ItemBean) request.getAttribute("item_bean");

	ArrayList<ItemBean> list = (ArrayList<ItemBean>) request.getAttribute("list");
%>

<script>
	$(function(){
		$("#goods_code > option").eq(${requestScope.item_bean.getGoods_code() - 1}).attr("selected", "selected");
		<%for (ItemBean bean2 : list) {%>
			$("#goods_amount_<%=bean2.getGoods_color_num()%>").val(<%=bean2.getGodds_amount()%>);
		<%}%>
	});
	
	
	function image_preview() {

		 $("#goods_img").on('change', function(){
	         readURL(this);
	     });
		

		
	}

	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }

	      reader.readAsDataURL(input.files[0]);
	    }
	}	
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<br />
			<div class="col-sm-9"></div>
			<div class="col-sm-2">
				<a href="logout.credu" class="btn btn-success">로그아웃</a>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1>item_register</h1>
				<div class="panel panel-success">
					<div class="panel-heading">상품보기</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" method="post"
							action="modify_Item.credu" enctype="multipart/form-data">
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_code">
									상품분류코드 </label>
								<div class="col-sm-9">
									<select id="goods_code" name="goods_code">
										<option value="1">데스크탑</option>
										<option value="2">노트북</option>
										<option value="3">오디오</option>
										<option value="4">마우스</option>
										<option value="5">키보드</option>
									</select>
								</div>

							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_num">
									상품번호 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="goods_num"
										name="goods_num"
										value="${requestScope.item_bean.getGoods_num()}"
										autocomplete="off" readonly/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_name">
									상품이름 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="goods_name"
										name="goods_name"
										value="${requestScope.item_bean.getGoods_name()}"
										autocomplete="off" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_img">
									상품이미지 </label>
								<div class="col-sm-9">
									<%
										if (goodsbean.getGoods_img() != null) {
									%>
									<img id="blah" src="admin/upload/<%=goodsbean.getGoods_img()%>" alt="Goods_img" width="370" height="450" />
									<%
										}
									%>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3" for="goods_img">
										이미지 첨부 </label>
									<div class="col-sm-9">
										<input type="file" name="goods_img" id="goods_img"
											class="form-control" accept="image/*"
											onclick="image_preview()" />

									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_brand">
									상품브랜드 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="goods_brand"
										name="goods_brand"
										value="${requestScope.item_bean.getGoods_brand()}"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_price">
									상품가격 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="goods_price"
										name="goods_price"
										value="${requestScope.item_bean.getGoods_price()}"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_info">
									상세정보 </label>
								<div class="col-sm-9">
									<textarea id="goods_info" class="form-control" rows="5" name="goods_info">${requestScope.item_bean.getGoods_info()}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_points">
									적립금 </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="goods_points"
										name="goods_points"
										value="${requestScope.item_bean.getGoods_points()}"
										autocomplete="off" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_color_num">
									색상별 수량 </label>
								<div class="col-sm-9"></div>

							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_amount_0">
									빨강 </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="goods_amount_0"
										name="goods_amount_red" placeholder="수량" autocomplete="off" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_amount_1">
									검정 </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="goods_amount_1"
										name="goods_amount_black" placeholder="수량" autocomplete="off" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_amount_2">
									노랑 </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="goods_amount_2"
										name="goods_amount_yellow" placeholder="수량" autocomplete="off" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="goods_amount_3">
									파랑 </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="goods_amount_3"
										name="goods_amount_blue" placeholder="수량" autocomplete="off" />
								</div>
							</div>
							<div style="text-align: right">
								<button type="submit" class="btn btn-success">수정하기</button>
								<a href="delete_Item.credu?goods_num=${requestScope.item_bean.getGoods_num()}&page_num=<%=page_num%>" class="btn btn-success">삭제하기</a> 
								<a href="ItemMainBoard.credu" class="btn btn-success"> 상품관리자
									페이지 </a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>

	</div>
</body>
</html>










