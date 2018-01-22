<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/board.css"/>
<script>
	function check_user_id_exist(){
		// 파라미터
		var param = {
			user_id : $("#user_id").val()
		}
		// 요청한다.
		$.ajax({
			url : "../../check_exsit_id.credu",
			dataType : "text",
			data : param,
			type : "post",
			success : function(data){
				if(data == '1'){
					$("#id_check_result").text("존재하는 아이디 입니다");
				} else {
					$("#id_check_result").text("사용 가능한 아이디 입니다");
					// 중복 확인 여부 검사를 위한 input에 값을 셋팅
					$("#check_id_flag").val("1");
				}
			}
			
		});
	}
	<%-- form 유효성 검사 --%>
	function check_form(){
		
		// 아이디가 비어있는지..
		if($("#user_id").val() == ""){
			alert("아이디를 입력해주세요");
			$("#user_id").focus();
			return false;
		}
		// 비밀번호가 비어있는지..
		if($("#user_pw").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("#user_pw").focus();
			return false;
		}
		// 비밀번호 확인이 비어 있는지..
		if($("#user_pw2").val() == ""){
			alert("비밀번호 확인을 입력해주세요");
			$("#user_pw2").focus();
			return false;
		}
		// 이름이 비어 있는지..
		if($("#user_name").val() == ""){
			alert("이름을 입력해주세요");
			$("#user_name").focus();
			return false;
		}
		// 주소가 비어 있는지..
		if($("#user_addr").val() == ""){
			alert("주소를 입력해주세요");
			$("#user_addr").focus();
			return false;
		}
		
		// 전화번호가 비어 있는지..
		if($("#user_phnum").val() == ""){
			alert("전화번호를 입력해주세요");
			$("#user_phnum").focus();
			return false;
		}
		
		// email이 비버 있는지..
		if($("#user_email").val() == ""){
			alert("email을 입력해주세요");
			$("#user_email").focus();
			return false;
		}
		
		
		// 비밀번호와 비밀번호 확인이 같은지..
		if($("#user_pw").val() != $("#user_pw2").val()){
			alert("비밀번호가 다릅니다");
			$("#user_pw").focus();
			return false;
		}
		// 아이디 중복 검사를 했는지..
		if($("#check_id_flag").val() != "1"){
			alert("아이디 중복 확인을 해주세요");
			$("#user_id").focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	
	<div class="container">
		<div class="row login-box">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<img src="../image/computer.jpg" width="304" height="230" alt="컴퓨터이미지"
		     		class="img-responsive"/>
				<h1><span class='text-success'>member-join</span></h1>
				
				<div class="panel panel-success">
					<div class="panel-heading">
						<span class="label label-success">회원가입</span>
					</div>
					<div class="panel-body">
						<%--
							form 태그에서 onsubmit 사건에서 return false를 반환
							하면 action이 반응하지 않는다.
							보통 "return 함수()"로 작성하며 함수는 true나
							false를 반환하도록 만들어 준다.
						 --%>
						<form class="form-horizontal" role="form"
						      method="post" action="../../add_user_pro.credu"
						      onsubmit="return check_form();">
						      <div class="form-group">
						      	<label class="control-label col-sm-3" for="user_id">
						      		<span class="text-success">아이디 :</span> 
						      	</label>
						      	<div class="col-sm-6">
						      		<input type="text" class="form-control"
						      		       id="user_id" name="user_id"
						      		       placeholder="아이디"
						      		       autocomplete="off"/>
						      	</div>
						      	<div class="col-sm-3">
						      		<button type="button"
						      				onclick="check_user_id_exist()" 
						      		        class="btn btn-success btn-block">
						      			중복확인
						      		</button>
						      	</div>
						      </div>
						      <div class="col-sm-3"></div>
						      <div class="col-sm-9" id="id_check_result"></div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3" for="user_pw">
						      		<span class="text-success">비밀번호 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="password" class="form-control"
						      		       id="user_pw" name="user_pw"
						      		       placeholder="비밀번호"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3" for="user_pw2">
						      		<span class="text-success">비밀번호 확인 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="password" class="form-control"
						      		       id="user_pw2" name="user_pw2" 
						      		       placeholder="비밀번호 확인"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		<span class="text-success">이름 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_name" name="user_name"
						      		       placeholder="이름"
						      		       autocomplete="off"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		<span class="text-success">주소 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_addr" name="user_addr"
						      		       placeholder="주소"
						      		       autocomplete="off"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		 <span class="text-success">전화번호 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_phnum" name="user_phnum"
						      		       placeholder="전화번호"
						      		       autocomplete="off"/>
						      	</div>
						      	
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		 <span class="text-success">e-mail :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_email" name="user_email"
						      		       placeholder="e-mail"
						      		       autocomplete="off"/>
						      	</div>
						      </div>
						      
						      <div style="text-align:right">
						      	<button type="submit" class="btn btn-success">
						      		가입
						      	</button>
						      	<button type="reset" class="btn btn-success">
						      		초기화
						      	</button>
						      	<a href="../index.jsp" class="btn btn-success">
						      		취소
						      	</a>
						      </div>
						      <%-- 아이디 중복 확인 여부를 위한 input --%>
						      <input type="hidden" id="check_id_flag" value=""/>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>










