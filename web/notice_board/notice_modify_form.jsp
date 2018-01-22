<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>
<%@ page import="java.util.*" %>

<% 

//파라미터 한글처리
request.setCharacterEncoding("utf-8");


//파라미터 처리.

String user_id = request.getParameter("user_id");
int notice_num = Integer.parseInt(request.getParameter("notice_idx"));


// 빈 객체 가져오기
notice_Bean bean = (notice_Bean)request.getAttribute("modify");





%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지글쓰기</title>
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
<script type="text/javascript">


function update() {
	
	var title = $("#title").val();
	var content = $("#content").val();
	
	//파라미터
	var param = {
			
			notice_num : <%=notice_num%>,
			notice_title : title,
			notice_content : content,
	}
	
	
	//요청
	$.ajax({
		
		url : "modify_pro.credu",
		dataType : "text",
		data : param,
		type : "post",
		success : function(data) {
													
				alert("공지수정완료");
				location.href = "notice.credu";
								
		}
				
	});
	
	
	
	
}


</script>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1>NOTICE MODIFY</h1>
				<div class="panel panel-success">
					<div class="panel-heading">공지글 수정하기</div>
					<div class="panel-body">
						
							<div class="form-group">
								<label class="control-label col-sm-3"
								       for="board_writer">
								       작성자
								</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="user_id" value="<%= user_id %>" autocomplete="off" readonly/>
								</div>
							</div>      
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_title">
									공지제목 </label>
								<div class="col-sm-9">
									<input type="text" class="from-control" id="title"
										name="title" value="<%=bean.getNotice_title()%>"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="notice_content">
									공지내용 </label>
								<div class="col-sm-9">
								
									<textarea name="content" id="content"
										class="form-control" placeholder="공지내용" rows="5"><%=bean.getNotice_content()%></textarea>
								</div>
							</div>
							
							<div style="text-align: right">
								<button type="button" onclick="update()" class="btn btn-primary">수정하기</button>
								<a href="notice.credu" class="btn btn-info"> 메인 페이지 </a>
							</div>
						
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>


