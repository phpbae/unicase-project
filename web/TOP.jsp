<%-- TOP.jsp --%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="bean.*"%>


<% 
	//파라미터 한글 처리.
	request.setCharacterEncoding("utf-8");

	MemberBean bean = (MemberBean) session.getAttribute("login");

%>


<script type="text/javascript">

function msg() {
	alert("Logoff");
}


function cart_check(id) {
	
	
	var param = {
			
			user_id : id
			
	}
	
	
	//요청
	
	//요청
	$.ajax({
		
		url : "cart_chk.credu",
		dataType : "text",
		data : param,
		type : "post",
		success : function(data) {
				
			
			if(data == 1){
				
			// $("#my_cart").prop("href", "view_cart_goods_form.credu");
				location.href = "view_cart_goods_form.credu";
			
			}else{
				
				alert("담겨있는 상품이 없습니다.");				
								
			}
			
								
		}
				
	});
	
		
}




</script>



<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">

	<!-- ============================================== TOP MENU ============================================== -->
	<div class="top-bar animate-dropdown">
		<div class="container">
			<div class="header-top-inner">
				<div class="cnt-account">
					<ul class="list-unstyled">
						
						
						<% 
							if (bean == null || bean.isLogin_check() == false){
						%>
						<li><a href="login/index.jsp"><i class="icon fa fa-sign-in"></i>Login</a></li>
						<% } else{%>
						<li><a href="account.credu" onclick="cart_check(<%=bean.getUser_id()%>)"><i class="icon fa fa-user"></i>My Account</a></li>
						<li><a href="login/user/leave_user_form.jsp"><i class="icon fa fa-user-times"></i>Leave</a></li>
						<li><a id="my_cart" onclick="cart_check('<%=bean.getUser_id()%>')" href="#"><i class="icon fa fa-shopping-cart"></i>My Cart</a></li>
						<li><a href="view_order_info.credu"><i class="icon fa fa-shopping-cart"></i>Order Search</a></li>
						
						<li><a href="logout.credu" onclick="msg()"><i class="icon fa fa-sign-in"></i>Logoff</a></li>
							<span class="label label-success">${sessionScope.login.user_name}님이 로그인하셨습니다.</span>
							<% if(bean.getUser_grade()==3){ %>
							<li><a href="administrator.credu"><i class="icon fa fa-key"></i>Admin</a></li>
							
							<% } %>
						<% } %>
										
						
						
						
					</ul>
				</div>
				<!-- /.cnt-account -->


				<div class="clearfix"></div>
			</div>
			<!-- /.header-top-inner -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.header-top -->
	<!-- ============================================== TOP MENU : END ============================================== -->
	<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
					<!-- ============================================================= LOGO ============================================================= -->
					<div class="logo">
						<a href="Index.credu"> <img src="assets/images/logo.png" alt="">

						</a>
					</div>
					<!-- /.logo -->
					<!-- ============================================================= LOGO : END ============================================================= -->
				</div>
				<!-- /.logo-holder -->

				<div class="col-xs-12 col-sm-12 col-md-6 top-search-holder">
					
					<!-- ============================================================= SEARCH AREA ============================================================= -->
					<div class="search-area">
						<form action="Index.credu" method="post">
							<div class="control-group">
					
								<input required="required" class="search-field" id="search" name="search" placeholder="Search here...(상품 이름)" value="" style="width: 400px;" /> 						
								<button type="submit" class="btn btn-primary btn-sm" style="width: 100px; margin-left: 20px;"><i class="icon fa fa-search"></i>  Search</button>
							</div>
						</form>
					</div>
					<!-- /.search-area -->
					<!-- ============================================================= SEARCH AREA : END ============================================================= -->
				</div>
				<!-- /.top-search-holder -->


			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->

	</div>
	<!-- /.main-header -->

	<!-- ============================================== NAVBAR ============================================== -->
	<div class="header-nav animate-dropdown">
		<div class="container">
			<div class="yamm navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button data-target="#mc-horizontal-menu-collapse"
						data-toggle="collapse" class="navbar-toggle collapsed"
						type="button">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="nav-bg-class">
					<div class="navbar-collapse collapse"
						id="mc-horizontal-menu-collapse">
						<div class="nav-outer">
							<ul class="nav navbar-nav">
								<li class="active dropdown yamm-fw"><a href="Index.credu">HOME</a>

								</li>
							

								<li class="dropdown hidden-sm"><a href="cscenter.jsp">CS CENTER </a></li>

								

								<li class="dropdown"><a href="contact.jsp">Contact</a></li>



							</ul>
							<!-- /.navbar-nav -->
							<div class="clearfix"></div>
						</div>
						<!-- /.nav-outer -->
					</div>
					<!-- /.navbar-collapse -->


				</div>
				<!-- /.nav-bg-class -->
			</div>
			<!-- /.navbar-default -->
		</div>
		<!-- /.container-class -->

	</div>
	<!-- /.header-nav -->
	<!-- ============================================== NAVBAR : END ============================================== -->

</header>

<!-- ============================================== HEADER : END ============================================== -->







