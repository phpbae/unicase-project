<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 읽기</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1>Notice Read</h1>
				<div class="panel panel-success">
					<div class="panel-heading">
						글 읽기
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_writer">
									작성자 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="notice_writer"
										value="${requestScope.notice_bean.user_id}" readonly />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_title">
									제목 </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="notice_title"
										value="${requestScope.notice_bean.notice_title}" readonly />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_content">
									내용 </label>
								<div class="col-sm-9">
								<%
										notice_Bean bean = (notice_Bean)request.getAttribute("notice_bean");
								%>
									<textarea id="notice_content" class="form-control" rows="5"
										readonly>${requestScope.notice_bean.notice_content}
									</textarea>
								</div>
							</div>
							<div style="text-align:right">
							<% 
									MemberBean member_bean = (MemberBean)session.getAttribute("login");
									int user_grade = member_bean.getUser_grade();
									
									if(user_grade == 3){ 
							%>
							<a class="btn btn-success" href="notice_modify.credu?user_id=${requestScope.notice_bean.user_id}&notice_idx=${requestScope.notice_bean.notice_num}">수정하기</a>			
										<a class="btn btn-success" href="notice_delete.credu?notice_idx=${requestScope.notice_bean.notice_num}">삭제하기</a>	
							<% } %>
								<a href="notice.credu" class="btn btn-info"> 
								메인페이지 
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

















