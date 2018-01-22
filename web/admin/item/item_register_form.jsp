<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품등록하기</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
	function check_form(){
		
		// 분류코드가 비어있는지....
		if($("#goods_code").val() == ""){
			alert("분류코드를 입력해주세요");
			$("#goods_code").focus();
			return false;
		}
		// 상품번호가 비어있는지....
		if($("#goods_num").val() == ""){
			alert("상품번호를 입력해주세요");
			$("#goods_num").focus();
			return false;
		}
		// 상품이름이 비어있는지....
		if($("#goods_name").val() == ""){
			alert("상품이름을 입력해주세요");
			$("#goods_name").focus();
			return false;
		}
		// 상품이미지가 비어있는지....
		if($("#goods_img").val() == ""){
			alert("상품이미지를 입력해주세요");
			$("#goods_img").focus();
			return false;
		}
		// 상품브랜드가 비어있는지....
		if($("#goods_brand").val() == ""){
			alert("상품브랜드를 입력해주세요");
			$("#goods_brand").focus();
			return false;
		}
		// 상품가격이 비어있는지....
		if($("#goods_price").val() == ""){
			alert("상품가격을 입력해주세요");
			$("#goods_price").focus();
			return false;
		}
		// 상세정보가 비어있는지...
		if($("#goods_info").val() == ""){
			alert("상세정보를 입력해주세요");
			$("#goods_info").focus();
			return false;
		}
		// 적립금이 비어있는지...
		if($("#goods_points").val() == ""){
			alert("적립금을 입력해주세요");
			$("#goods_points").focus();
			return false;
		}
		// 수량이 비어있는지...
		if($("#goods_amount").val() == ""){
			alert("수량을 입력해주세요");
			$("#goods_amount").focus();
			return false;
		}
		
		return true;
	}
</script>

<%
	// 페이지 번호 추출
	String page_num = request.getParameter("page_num");
	if(page_num == null){
		page_num = "1";
	}
%>
</head>
<body>
	
	<div class="container">
		<div class="row">
				<br/>
		<div class="col-sm-9"></div><div class="col-sm-2"><a href="logout.credu" class="btn btn-success">로그아웃</a></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1>item_register</h1>
				<div class="panel panel-success">
					<div class="panel-heading">
						상품등록하기
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form"
						      method="post"
						      action="ItemRegister.credu"
						      onsubmit="return check_form()"
						      enctype="multipart/form-data">
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_code">
						      	      상품분류코드
						      	</label>
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
						      	<label class="control-label col-sm-3"
						      	      for="goods_num">
						      	      상품번호
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="text" class="form-control"
							      		   id="goods_num"
							      		   name="goods_num"
							      		   placeholder="상품번호"
							      		   autocomplete="off"/>
						      	</div>
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_name">
						      	      상품이름
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="text" class="form-control"
							      		   id="goods_name"
							      		   name="goods_name"
							      		   placeholder="상품이름"
							      		   autocomplete="off"/>
						      	</div>
						      </div>
	
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	       for="goods_img">
						      		상품이미지 첨부
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="file" name="goods_img"
						      		       id="goods_img"
						      		       class="form-control"
						      		       accept="image/*"/>
						      		         
						      	</div>
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_brand">
						      	      상품브랜드
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="text" class="form-control"
							      		   id="goods_brand"
							      		   name="goods_brand"
							      		   placeholder="상품브랜드"
							      		   autocomplete="off"/>
						      	</div>
						      </div>						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_price">
						      	      상품가격
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="number" class="form-control"
							      		   id="goods_price"
							      		   name="goods_price"
							      		   placeholder="상품가격"
							      		   autocomplete="off"/>
						      	</div>
						      </div>						      
					      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	       for="goods_info">
						      	       상세정보
						      	</label>
						      	<div class="col-sm-9">
						      		<textarea name="goods_info"
						      		          id="goods_info"
						      		          class="form-control"
						      		          placeholder="상세정보"
						      		          rows="5"></textarea>
						      	</div>
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_points">
						      	      적립금
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="number" class="form-control"
							      		   id="goods_points"
							      		   name="goods_points"
							      		   placeholder="적립금"
							      		   autocomplete="off"/>
						      	</div>
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_color_num">
						      	      색상별 수량
						      	</label>
						      	<div class="col-sm-9">
								</div>						      
						      
						      </div>						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_amount">
						      	      빨강
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="number" class="form-control"
							      		   id="goods_amount"
							      		   name="goods_amount_red"
							      		   placeholder="수량"
							      		   autocomplete="off"/>
						      	</div>
						      </div>						      						      						      						      						      						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_amount">
						      	      검정
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="number" class="form-control"
							      		   id="goods_amount"
							      		   name="goods_amount_black"
							      		   placeholder="수량"
							      		   autocomplete="off"/>
						      	</div>
						      </div>						      						      						      						      						      						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_amount">
						      	      노랑
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="number" class="form-control"
							      		   id="goods_amount"
							      		   name="goods_amount_yellow"
							      		   placeholder="수량"
							      		   autocomplete="off"/>
						      	</div>
						      </div>						      						      						      						      						      						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3"
						      	      for="goods_amount">
						      	      파랑
						      	</label>
						      	<div class="col-sm-9">
							      	<input type="number" class="form-control"
							      		   id="goods_amount"
							      		   name="goods_amount_blue"
							      		   placeholder="수량"
							      		   autocomplete="off"/>
						      	</div>
						      </div>						      						      						      						      						      						      
						      <div style="text-align:right">
						      	<button type="submit" class="btn btn-success">
						      		작성하기
						      	</button>
						      	<button type="reset" class="btn btn-success">
						      		초기화
						      	</button>
						      	<a href="ItemMainBoard.credu" class="btn btn-success">
								상품관리자 페이지
								</a>
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










