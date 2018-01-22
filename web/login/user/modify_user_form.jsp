<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bean.*" %>    
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
		
		return true;
	}
</script>
</head>
<body>
	
	<div class="container">
		<div class="row login-box">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
						<img src="../image/computer.jpg" width="304" 
		     height="230" alt="컴퓨터이미지"
		     class="img-responsive"/>
				<h1><span class='text-success'>Modify_member</span></h1>
				
				<div class="panel panel-success">
					<div class="panel-heading">
						<span class="label label-success">회원정보수정</span>
					</div>
					<div class="panel-body">
						<%--
							form 태그에서 onsubmit 사건에서 return false를 반환
							하면 action이 반응하지 않는다.
							보통 "return 함수()"로 작성하며 함수는 true나
							false를 반환하도록 만들어 준다.
						 --%>
							<%
								MemberBean member_bean = (MemberBean)session.getAttribute("login");
								
							%>						 
						<form class="form-horizontal" role="form"
						      method="post" action="../../modify_user.credu"
						      onsubmit="return check_form();">
						      <div class="form-group">
						      	<label class="control-label col-sm-3" for="user_id">
						      		<span class="text-success">아이디 :</span> 
						      	</label>
						      	<div class="col-sm-6">
						      		<input type="text" class="form-control"
						      		       id="user_id" name="user_id"
						      		        value="<%=member_bean.getUser_id()%>"
						      		        readonly/>
						      	</div>
						      	<div class="col-sm-3">
		
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
						      		       value="<%=member_bean.getUser_pw()%>"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3" for="user_pw2">
						      		<span class="text-success">비밀번호 확인 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="password" class="form-control"
						      		       id="user_pw2" name="user_pw2" 
						      		       value="<%=member_bean.getUser_pw()%>"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		<span class="text-success">이름 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_name" name="user_name"
						      		       value="<%=member_bean.getUser_name()%>" readonly/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		<span class="text-success">주소 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_addr" name="user_addr"
						      		       value="<%=member_bean.getUser_addr()%>"/>
						      	</div>
						      </div>
						      
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		 <span class="text-success">전화번호 :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_phnum" name="user_phnum"
						      		       value="<%=member_bean.getUser_phnum()%>"/>
						      	</div>
						      	
						      </div>
						      <div class="form-group">
						      	<label class="control-label col-sm-3">
						      		 <span class="text-success">e-mail :</span> 
						      	</label>
						      	<div class="col-sm-9">
						      		<input type="text" class="form-control"
						      		       id="user_email" name="user_email"
						      		       value="<%=member_bean.getUser_email()%>"/>
						      	</div>
						      </div>
						      
						      <div style="text-align:right">
						      	<button type="submit" class="btn btn-success">
						      		수정
						      	</button>
						      	<button type="reset" class="btn btn-success">
						      		초기화
						      	</button>
						      	<a href="../../index.jsp" class="btn btn-success">
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










