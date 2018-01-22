<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Notice Write</title>
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
<script>
		function check_form(){
			// 제목이 비어있는지...
			if($("#notice_title").val() == ""){
				alert("제목을 입력해주세요");
				$("#notice_title").focus();
				return false;
			}
			// 내용이 비어있는지...
			if($("#notice_content").val() == ""){
				alert("내용을 입력해주세요");
				$("#notice_content").focus();
				return false;
			}
			return true;
		}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1>NOTICE WRITE</h1>
				<div class="panel panel-success">
					<div class="panel-heading">공지글 작성하기</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" method="post"	action="write_pro.credu"
							onsubmit="return check_form()">
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_title">
									공지제목 </label>
								<div class="col-sm-9">
									<input type="text" class="from-control" id="notice_title"
										name="notice_title" placeholder="공지제목" autocomplete="off"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_content">
									공지내용 </label>
								<div class="col-sm-9">
									<textarea name="notice_content" id="notice_content"
										class="form-control" placeholder="공지내용" rows="5"></textarea>
								</div>
							</div>
							<div style="text-align: right">
								<button type="submit" class="btn btn-primary">등 록</button>
								<button type="reset" class="btn btn-danger">초기화</button>
								<a href="notice.credu" class="btn btn-info"> 메인 페이지 </a>
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


