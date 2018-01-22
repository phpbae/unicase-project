<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%-- <% pageContext.setAttribute("absolute_path", ${pageContext.request.contextPath} ); --%>
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

<title>IndexPage</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- Customizable CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/green.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.transitions.css">
<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
<link href="${pageContext.request.contextPath}/assets/css/lightbox.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/rateit.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-select.min.css">


<!-- Icons/Glyphs -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">

<!-- Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">

<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>


<body class="cnt-home">
${pageScope.path }
	<!-- ============================================== HEADER ============================================== -->
	<header class="header-style-1">

		<!-- ============================================== TOP MENU ============================================== -->
		<div class="top-bar animate-dropdown">
			<div class="container">
				<div class="header-top-inner">
					<div class="cnt-account">
						<ul class="list-unstyled">
							<li><a href="#"><i class="icon fa fa-user"></i>My
									Account</a></li>
							<li><a href="#"><i class="icon fa fa-shopping-cart"></i>My
									Cart</a></li>
							<li><a href="#"><i class="icon fa fa-sign-in"></i>Login</a></li>
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
							<a href="${pageContext.request.contextPath}/index.jsp"> <img src="${pageContext.request.contextPath}/assets/images/logo.png"
                                                                                         alt="">

							</a>
						</div>
						<!-- /.logo -->
						<!-- ============================================================= LOGO : END ============================================================= -->
					</div>
					<!-- /.logo-holder -->

					<div class="col-xs-12 col-sm-12 col-md-6 top-search-holder">
						<div class="contact-row">
							<div class="phone inline">
								<i class="icon fa fa-phone"></i> (400) 888 888 868
							</div>
							<div class="contact inline">
								<i class="icon fa fa-envelope"></i> saler@unicase.com
							</div>
						</div>
						<!-- /.contact-row -->
						<!-- ============================================================= SEARCH AREA ============================================================= -->
						<div class="search-area">
							<form>
								<div class="control-group">

									<ul class="categories-filter animate-dropdown">
										<li class="dropdown"><a class="dropdown-toggle"
											data-toggle="dropdown" href="${pageContext.request.contextPath}/category.jsp">Categories
												<b class="caret"></b>
										</a>

											<ul class="dropdown-menu" role="menu">
												<li class="menu-header">Computer</li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="${pageContext.request.contextPath}/category.jsp">- Laptops</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="${pageContext.request.contextPath}/category.jsp">- Tv & audio</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="${pageContext.request.contextPath}/category.jsp">- Gadgets</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="${pageContext.request.contextPath}/category.jsp">- Cameras</a></li>

											</ul></li>
									</ul>

									<input class="search-field" placeholder="Search here..." /> <a
										class="search-button" href="#"></a>

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
									<li class="active dropdown yamm-fw"><a href="${pageContext.request.contextPath}/index.jsp">홈_HOME</a>

									</li>
									<li class="dropdown yamm">
									<a href="${pageContext.request.contextPath}/index.jsp" data-hover="dropdown" class="dropdown-toggle" data-toggle="dropdown">Desktop</a>
										<ul class="dropdown-menu">
											<li>
												<div class="yamm-content">
													<div class="row">
														<div class='col-sm-12'>
															<div class="col-xs-12 col-sm-12 col-md-4">
																<h2 class="title">Laptops &amp; Notebooks</h2>
																<ul class="links">
																	<li><a href="#">Power Supplies Power</a></li>
																	<li><a href="#">Power Supply Testers Sound </a></li>
																	<li><a href="#">Sound Cards (Internal)</a></li>
																	<li><a href="#">Video Capture &amp; TV Tuner
																			Cards</a></li>
																	<li><a href="#">Other</a></li>
																</ul>
															</div>
															<!-- /.col -->

															<div class="col-xs-12 col-sm-12 col-md-4">
																<h2 class="title">Computers &amp; Laptops</h2>
																<ul class="links">
																	<li><a href="#">Computer Cases &amp;
																			Accessories</a></li>
																	<li><a href="#">CPUs, Processors</a></li>
																	<li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
																	<li><a href="#">Graphics, Video Cards</a></li>
																	<li><a href="#">Interface, Add-On Cards</a></li>
																	<li><a href="#">Laptop Replacement Parts</a></li>
																	<li><a href="#">Memory (RAM)</a></li>
																	<li><a href="#">Motherboards</a></li>
																	<li><a href="#">Motherboard &amp; CPU Combos</a></li>
																	<li><a href="#">Motherboard Components &amp;
																			Accs</a></li>
																</ul>
															</div>
															<!-- /.col -->

															<div class="col-xs-12 col-sm-12 col-md-4">
																<h2 class="title">Dekstop Parts</h2>
																<ul class="links">
																	<li><a href="#">Power Supplies Power</a></li>
																	<li><a href="#">Power Supply Testers Sound</a></li>
																	<li><a href="#">Sound Cards (Internal)</a></li>
																	<li><a href="#">Video Capture &amp; TV Tuner
																			Cards</a></li>
																	<li><a href="#">Other</a></li>
																</ul>
															</div>
															<!-- /.col -->
														</div>
													</div>
													<!-- /.row -->
												</div>
												<!-- /.yamm-content -->
											</li>
										</ul></li>

									<li class="dropdown"><a href="category.jsp">Electronics
											<span class="menu-label hot-menu hidden-xs">hot</span>
									</a></li>
									<li class="dropdown hidden-sm"><a href="category.jsp">Television
											<span class="menu-label new-menu hidden-xs">new</span>
									</a></li>

									<li class="dropdown hidden-sm"><a href="faq.jsp">FAQ</a></li>

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
	
					
					



	<!-- JavaScripts placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-hover-dropdown.min.js"></script>





</body>
</html>