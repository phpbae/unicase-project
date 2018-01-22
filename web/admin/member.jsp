<%-- 
	회원관리page
	작성자 : 배창현
	작성일 : 2015.12.03
--%>


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
	 
	 
	 //System.out.println("정렬값 : " + align);

%>


<!DOCTYPE html>

<html>
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="MediaCenter, Template, eCommerce">
<meta name="robots" content="all">



<title>Member Manage</title>
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
	
	function list() {
		
		location.href="member.credu";		
	}
	
	
</script>



<script type="text/javascript">

	//등급을 가지고 있을 전역변수
	var G_grade;
	
	//ID값을 가지는 전역변수
	var G_user_id;

	
	function member_read(id, num) {
			
		<%-- review_read 서블릿 호출 --%>
		
			G_grade = num;
			G_user_id = id;
		
			//파라미터
			var param = {
					
					user_id : id
			}
			
			
			//요청
			// JSON은 날짜형(Date)은 없음. (이거때문에 에러가 -_-..)
			$.ajax({
				
				url : "member_read.credu",
				dataType : "json",
				data : param,
				type : "post",
				success : function(data) {
					
					// 통신이 성공적일때 실행되는 함수
					// alert("성공인가?");
					
					/*
					
					obj.put("user_id", bean.getUser_id());
					obj.put("user_pw", bean.getUser_pw());
					obj.put("user_name", bean.getUser_name());
					obj.put("user_addr", bean.getUser_addr());
					obj.put("user_phnum", bean.getUser_phnum());
					obj.put("user_email", bean.getUser_email());
					obj.put("user_grade", bean.getUser_grade());
					obj.put("user_points", bean.getUser_points());
					obj.put("user_regdate", bean.getUser_regdate().toString());
										
					*/
										
					//alert(data.user_name);
					
					$("#user_id").val(data.user_id);
					$("#user_name").val(data.user_name);
					$("#user_addr").val(data.user_addr);
					$("#user_phnum").val(data.user_phnum);
					$("#user_email").val(data.user_email);
					
					
					$("#user_grade > option").removeAttr("selected");
					$("#user_grade > option").eq(data.user_grade-1).attr("selected", "selected");
					
					/*
					if(data.user_grade == 1){
						// 1 : 일반회원
						$("#user_grade").eq(0).text(1);
						
					} else if(data.user_grade == 2){
						// 2 : 우수회원	
						$("#user_grade").eq(1).text(1);
						
					} else if(data.user_grade == 3){
						// 3 : 관리자
						$("#user_grade").eq(2).text(1);
						
					} else if(data.user_grade == 4){
						// 4 : 탈퇴 회원
						$("#user_grade").eq(-1).text(1);
					}
					*/
					
					
					
					$("#user_points").val(data.user_points);
					$("#user_regdate").val(data.user_regdate);
					
					
					
					
				} 
				
				/*
				error : function(xhr,status,error){
					
					//parsererror 면 내가 직접 해주마
					alert(status)
					alert(error)
					if(status == "parsererror"){
						
						//xhr.responseText는 원래 글자
	                    var json = eval(xhr.responseText);
	                	
	                    alert(json.user_name);
						
					}
					
				}
				*/
				
			});
			
			
	}
	
	
	function member_delete() {
		
		<%-- member_delete 서블릿 호출 --%>
			
						
		//파라미터
		var param = {
				
				user_id : G_user_id
		}
		
		
		var align = <%=align%>;
		
		if(align == 4){
			
			//요청
			$.ajax({
				
				url : "member_delete.credu",
				dataType : "text",
				data : param,
				type : "post",
				success : function(data) {
									
					alert("삭제 되었습니다.");
					G_user_id = null; //전역변수 초기화
					location.href = "member.credu?align=4";
						
				}
						
			});
			
			
			
		} else{
			
			
			//요청
			$.ajax({
				
				url : "member_delete.credu",
				dataType : "text",
				data : param,
				type : "post",
				success : function(data) {
									
					alert("삭제 되었습니다.");
					G_user_id = null; //전역변수 초기화
					location.href = "member.credu";
						
				}
						
			});
			
			
			
		}
			
									
			
			
			
			
			
			
		
									
			} //member_delete()
			
			
</script>


</head>
<body>
	

	<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<li><a href="Index.credu">Home</a></li>
					<li><a href="administrator.credu">Back</a></li>
					
					    <% 
							if (bean == null || bean.isLogin_check() == false){
						%>
						
						<% } else{%>
						
						<li><a href="logout.credu" onclick="msg()">Logoff</a></li>
						<li class='active'><i class="icon fa fa-lock"></i> Admin_Member Manage</li>
							
							<% if(bean.getUser_grade()==1 || bean.getUser_grade()==2){ %>
								
								<%  response.sendRedirect("index.jsp"); %>
							
							<% } %>
						<% } %>
				</ul>
			</div>
			<!-- /.breadcrumb-inner -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.breadcrumb -->
	
	  


	<div class="container">
		
		<h4 class="info-box-heading green">Member List</h4>
		
		<form action="member.credu" method="post">	
		Search
		
		<input class="search-field" placeholder="ID or NAME" name="search" id="search">
		<button class="btn btn-primary" type="submit"><i class="icon fa fa-search"></i>검색</button> 
		<button class="btn btn-primary" type="button" onclick="list()"><i class="icon fa fa-bars"></i>처음으로</button> 
		</form>
		
				
		
		

		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>등급</th>
					<th>가입일</th>
					
				</tr>
			</thead>

			<tbody>
				
				<c:forEach var="Member_Bean" items="${requestScope.list}">
				
				<tr class="info">
				  <td><a id="ID" data-toggle="modal" data-target="#myModal2" onclick="member_read('${Member_Bean.user_id}', ${Member_Bean.user_grade})">${Member_Bean.user_id}</a></td>
					<td>${Member_Bean.user_name}</td>
					
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${Member_Bean.user_grade == 1}">
							<td>Normal</td>
						</c:when>
						<%-- } else if(a == 2){ --%>
						<c:when test="${Member_Bean.user_grade == 2}">
							<td>VIP</td>
						</c:when>
						<%-- } else if(a == 3){ --%>
						<c:when test="${Member_Bean.user_grade == 3}">
							<td>Admin</td>
						</c:when>
						<%-- } else if(a == 4){ --%>
						<c:when test="${Member_Bean.user_grade == 4}">
							<td>Leave</td>
						</c:when>
						
					</c:choose>
					
					<td>${Member_Bean.user_regdate}</td>
									
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
   						 
   						 <a href="member.credu?Page_num=<%=i%>"><%=i%></a>
  						 
  						 <% } %>
										
						</li>
					</ul>
				</div>
			
			
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-4 text-success" style="text-align: right;">
		
			<div class="dropdown">
    		<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
    			<i class="icon fa fa-align-justify">  정렬</i>
    		</button>
    		  <ul class="dropdown-menu">
     		   <li><a href="member.credu?align=1">
     		   		<% if(align !=0 && align ==1){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
     		   등급 내림차순</a>
     		   </li>
     		   <li><a href="member.credu?align=2">
     		   <% if(align !=0 && align ==2){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
     		   
     		   ID 내림차순</a></li>
    		   <li><a href="member.credu?align=3">
    		   	<% if(align !=0 && align ==3){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
    		   
    		   이름 내림차순</a></li>
    		   <li><a href="member.credu?align=4">
    		   	<% if(align !=0 && align ==4){ %>
     		   		<i class="icon fa fa-check"></i>
     		   		<% }//if문 %>
    		   
    		   Leave List</a></li>
  			  </ul>
  			</div>
			
			
			</div>
		</div>
		 
		
	      
    </div>
 
  
  
  <!-- Modal2 _ member read -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Member Detail</h4>
        </div>
        <div class="modal-body">
          	<%-- form --%>
          	<form action="member_update.credu" class="form-horizontal" role="form" method="post">
    		<%-- ID --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">ID:</label>
      		<div class="col-sm-10">
        		<input type="text" class="form-control" name="user_id" id="user_id" value="" readonly="readonly">
      		</div>
    		</div>
    		<%-- Name --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">Name:</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_name" id="user_name" value="">
      		</div>
    		</div>
    		<%-- Addr --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">Address:</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_addr" id="user_addr" value="">
      		</div>
    		</div>
    		<%-- phnum --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">연락처:</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_phnum" id="user_phnum" value="">
      		</div>
    		</div>
    		
    		<%-- phnum --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">E-mail:</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_email" id="user_email" value="">
      		</div>
    		</div>
    		
    		<%-- grade --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">Grade:</label>
      		<div class="col-sm-10">          
        	 	<select class="form-control" id="user_grade" name="user_grade" onchange="this">
			     <option value="1">Normal</option>
			     <option value="2">VIP</option>
			     <option value="3">Admin</option>
			     <option value="4">Leave</option>
			  	</select>
      		      		
    		</div>
    		</div>
    		
    		<%-- point --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">Point:</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_points" id="user_points" value="">
      		</div>
    		</div>
    		
    		<%-- regdate --%>
    		<div class="form-group">
      			<label class="control-label col-sm-2">가입일:</label>
      		<div class="col-sm-10">          
        		<input type="text" class="form-control" name="user_regdate" id="user_regdate" value="" readonly="readonly">
      		</div>
    		</div>
    
    		
    		
    		    
    		<div class="form-group">        
      		<div class="col-sm-offset-2 col-sm-10">
        	<button onclick="javascript:alert('회원정보수정')" type="submit" class="btn btn-success"><i class="icon fa fa-exchange"></i>회원정보수정</button>
      		</div>
    		</div>
  	</form>         	
          	
                    
        </div>
        <div class="modal-footer">
        	
        		
			<button type="button" class="btn btn-danger" onclick="member_delete()"><i class="icon fa fa-sign-out"></i>탈퇴처리</button>
			
										
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	
        </div>
      </div>
      
    </div>
  </div>
		
	


</body>
</html>