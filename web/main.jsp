<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>


<% 

request.setCharacterEncoding("utf-8");

ArrayList<ItemBean> listitem = (ArrayList<ItemBean>)request.getAttribute("listitem");

//색상수량정보
ArrayList<ItemBean> listitem2 = (ArrayList<ItemBean>)request.getAttribute("listitem2");

/*
// size 보여줄 페이지당 게시글 개수. 15개당 1page
int size = 15;

int tot = 0;
int cnt = 0;

try {

	// 총 게시글 개수.
	cnt = review_DAO.review_getPageCount();
	//페이지 번호
	tot = cnt / size;
	if (cnt % size != 0) {
		tot++;
	}

*/

	int size = 4;
	int col = 0; // 총 열
	int cnt = 0; // 총 상품수
	
	int cnt2 = 0;
	
	cnt = listitem.size();
		
	col = cnt / size;
	if(cnt % size != 0){
		
		col++;
		
	}
	

	//파라미터 처리.
	int goods = 0;
	if(request.getParameter("goods") != null){
	
	goods = Integer.parseInt(request.getParameter("goods"));
	
	} else{
		
		goods = 0;	
		
	}
	
	
	//파라미터 처리
	String search = null;
	if(request.getParameter("search") != null){
		
		search = request.getParameter("search");
		
	}


%>



<!DOCTYPE html>

<html>
<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>IndexPage</title>

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

		<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>		

		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">

		<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

	</head>
 

<body class="cnt-home">

<%-- 상단메뉴 --%>	
<jsp:include page="TOP.jsp"/>
		
	

<div class="body-content outer-top-xs" id="top-banner-and-menu">
	<div class="container">
	<div class="row">
	<!-- ============================================== SIDEBAR ============================================== -->	
		<div class="col-xs-12 col-sm-12 col-md-3 sidebar">
			
<!-- ================================== TOP NAVIGATION ================================== -->
<div class="side-menu animate-dropdown outer-bottom-xs">
    <div class="head"><i class="icon fa fa-align-justify fa-fw"></i> Categories</div>        
    <nav class="yamm megamenu-horizontal" role="navigation">
        <ul class="nav">
            <li class="dropdown menu-item">
                <a href="Index.credu?goods=1"><i class="icon fa fa-desktop fa-fw"></i>Desktop</a>
            </li><!-- /.menu-item -->

            
            <li class="dropdown menu-item">
                 <a href="Index.credu?goods=2"><i class="icon fa fa-laptop fa-fw"></i>Laptop</a>
            </li><!-- /.menu-item -->

            <li class="dropdown menu-item">
                <a href="Index.credu?goods=4"><i class="icon fa fa-mouse-pointer fa-fw"></i>Mouse</a>
            </li><!-- /.menu-item -->

            <li class="dropdown menu-item">
                <a href="Index.credu?goods=5"><i class="icon fa fa-keyboard-o fa-fw"></i>Keyboard</a>
    		</li><!-- /.menu-item -->

            <li class="dropdown menu-item">
                <a href="Index.credu?goods=3"><i class="icon fa fa-headphones fa-fw"></i>Audio</a>
            </li><!-- /.menu-item -->

         
                   
          
        </ul><!-- /.nav -->
    </nav><!-- /.megamenu-horizontal -->
</div><!-- /.side-menu -->
<!-- ================================== TOP NAVIGATION : END ================================== -->



<div class="sidebar-widget outer-bottom-small wow fadeInUp">
	<h3 class="section-title">Notice</h3>
	<iframe src="Notice_mini.credu" width="260"></iframe>
	
	
</div>




		</div><!-- /.sidemenu-holder -->
		<!-- ============================================== SIDEBAR : END ============================================== -->

		<!-- ============================================== CONTENT ============================================== -->
		<div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder">
	
	<% if(goods == 0 && search == null){ %>
	
	<!-- ========================================== SECTION – HERO ========================================= -->
	<div id="hero">
	<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
		
		<%-- style="background-image: url(assets/images/sliders/01.jpg); --%>
		<div class="item" style="background-image: url(UNICASE_BANNER.jpg);">
			<div class="container-fluid">
				<div class="caption bg-color vertical-center text-left">
					<div class="big-text fadeInDown-1">
						The new <span class="highlight">iAudio</span> for you
					</div>

					<div class="excerpt fadeInDown-2 hidden-xs">
					
					<span>Text1 </span>
					<span>Text2 </span>
					</div>
					<div class="button-holder fadeInDown-3">
						<a href="#" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a>
					</div>
				</div><!-- /.caption -->
			</div><!-- /.container-fluid -->
		</div><!-- /.item -->

		<div class="item" style="background-image: url(assets/images/sliders/01.jpg);">
			<div class="container-fluid">
				<div class="caption bg-color vertical-center text-left">
					<div class="big-text fadeInDown-1">
						The new <span class="highlight">imac</span> for you
					</div>

					<div class="excerpt fadeInDown-2 hidden-xs">
						 
					<span>21.5-Inch Now Starting At $1099 </span>
					<span>27-Inch Starting At $1799</span>
					</div>
					<div class="button-holder fadeInDown-3">
						<a href="index.php?page=single-product" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a>
					</div>
				</div><!-- /.caption -->
			</div><!-- /.container-fluid -->
		</div><!-- /.item -->
		
		

	</div><!-- /.owl-carousel -->
</div>
<!-- ========================================= SECTION – HERO : END ========================================= -->	
	<% } //if(%>


<!-- ============================================== INFO BOXES ============================================== -->
<div class="info-boxes wow fadeInUp">
	<div class="info-boxes-inner">
		<div class="row">
			<div class="col-md-6 col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
						     <i class="icon fa fa-dollar"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading green">money back</h4>
						</div>
					</div>	
					<h6 class="text">30 Day Money Back Guarantee.</h6>
				</div>
			</div><!-- .col -->

			<div class="hidden-md col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
							<i class="icon fa fa-truck"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading orange">free shipping</h4>
						</div>
					</div>
					<h6 class="text">free ship-on oder over $600.00</h6>	
				</div>
			</div><!-- .col -->

			<div class="col-md-6 col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
							<i class="icon fa fa-gift"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading red">Special Sale</h4>
						</div>
					</div>
					<h6 class="text">All items-sale up to 20% off </h6>	
				</div>
			</div><!-- .col -->
		</div><!-- /.row -->
	</div><!-- /.info-boxes-inner -->
	
</div><!-- /.info-boxes -->
<!-- ============================================== INFO BOXES : END ============================================== -->
			
			<!-- ============================================== SCROLL TABS ============================================== -->
<div id="product-tabs-slider" class="scroll-tabs outer-top-vs wow fadeInUp">
	<div class="more-info-tab clearfix ">
	
		<% if( goods == 0 && search == null){ %>
	    <h3 class="new-product-title pull-left">New Products</h3>
		<% } else if(search != null && goods == 0){%>
		<h3 class="new-product-title pull-left">Search Result  :  <%=search%></h3>
		<br>
		<h5>Result Count :  <%=listitem.size()%></h5>
		<% } else if(search == null && goods != 0){ %>
		 <h3 class="new-product-title pull-left">Products</h3>
		<% } %>
	</div>

	<div class="tab-content outer-top-xs">
		<div class="tab-pane in active" id="all">			
			<div class="product-slider">
				<div class="owl-carousel home-owl-carousel custom-carousel owl-theme" data-item="4">
		
		
		<% if(goods == 0){ %>
				
			<% for(ItemBean listitem_new : listitem){%>	
						
			<div class="item item-carousel">
				
			<div class="products">
				
			<div class="product">		
		<div class="product-image">
		<div class="image">
			<%-- 195 X 243 --%>
			<a href="detail_main_item.credu?goods_num=<%= listitem_new.getGoods_num() %>"><img src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem_new.getGoods_img()%>" width="195" height="243"></a>
		</div><!-- /.image -->			
		
			<% if( goods ==0){%>
			<div class="tag new"><span>New</span></div>                        		   
			<% } %>
		</div><!-- /.product-image -->
			
		<div class="product-info text-left">
        	 <h3 class="name"><a href="detail_main_item.credu?goods_num=<%= listitem_new.getGoods_num() %>"><%=listitem_new.getGoods_name()%></a></h3>
        
        <div class="product-price">   
           <span class="price">
            <%=listitem_new.getGoods_price()%>원
           </span>
        </div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					
			<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
						</li>
	        		</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
			
			
				
		
						
		</div><!-- /.item -->
		
		
			<% } //for() %>	
		
		<% } else { 	
				   	
			//for(ItemBean listitem : listitem){
			for(int i=1 ; i<=col ; i++){
				// 1열에 4개씩 출력. 총 열수만큼 반복.						
			%>       	
			
							
			<div class="item item-carousel">
		
			<% for(int j = 1 ; j<=4 ; j++){ %>
					
				<% if(cnt2 < listitem.size()){ %>
										
				<br>
				<%-- 1열에 4개씩 출력. --%>
				<div class="products">
					
				<div class="product">		
				<div class="product-image">
				<div class="image">
				<%-- 195 X 243 --%>
				<a href="detail_main_item.credu?goods_num=<%= listitem.get(cnt2).getGoods_num() %>"><img src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.get(cnt2).getGoods_img()%>" width="195" height="243"></a>
				</div><!-- /.image -->			
						
				</div><!-- /.product-image -->
			
			<div class="product-info text-left">
        	 <h3 class="name"><a href="detail_main_item.credu?goods_num=<%= listitem.get(cnt2).getGoods_num() %>"><%=listitem.get(cnt2).getGoods_name()%></a></h3>
        
        	<div class="product-price">   
           	<span class="price">
            <%=listitem.get(cnt2).getGoods_price()%>원
           	</span>
        	</div><!-- /.product-price -->
			
			</div><!-- /.product-info -->
					
			<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
						</li>
	        		</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
			
			
			<% }// if(문) %>
			
			<% cnt2++;}//for() 4개씩 반복 %>
						
		
				
			
				
			
					
		</div><!-- /.item -->
		
		
		
			<% }//for() %>
			
		<% } //esle() %>
		
			
							</div><!-- /.home-owl-carousel -->
			</div><!-- /.product-slider -->
		</div><!-- /.tab-pane -->

		

	


	</div><!-- /.tab-content -->
</div><!-- /.scroll-tabs -->
<!-- ============================================== SCROLL TABS : END ============================================== -->

			<!-- ============================================== WIDE PRODUCTS ============================================== -->

	<% if(goods == 0 & search == null){ %>

<div class="wide-banners wow fadeInUp outer-bottom-vs">
	<div class="row">

		<div class="col-md-7">
			<div class="wide-banner cnt-strip">
				<div class="image">
					<img class="img-responsive" data-echo="assets/images/banners/1.jpg" src="assets/images/blank.gif" alt="">
				</div>	
				<div class="strip">
					<div class="strip-inner">
						<h3 class="hidden-xs">samsung</h3>
						<h2>galaxy</h2>
					</div>	
				</div>
			</div><!-- /.wide-banner -->
		</div><!-- /.col -->

		<div class="col-md-5">
			<div class="wide-banner cnt-strip">
				<div class="image">
					<img class="img-responsive" data-echo="assets/images/banners/2.jpg" src="assets/images/blank.gif" alt="">
				</div>	
				<div class="strip">
					<div class="strip-inner">
						<h3 class="hidden-xs">new trend</h3>
						<h2>watch phone</h2>
					</div>	
				</div>
			</div><!-- /.wide-banner -->
		</div><!-- /.col -->

	</div><!-- /.row -->
</div><!-- /.wide-banners -->

<!-- ============================================== WIDE PRODUCTS : END ============================================== -->
			<!-- ============================================== FEATURED PRODUCTS ============================================== -->
<section class="section featured-product wow fadeInUp">
	<h3 class="section-title">Featured products</h3>
	<div class="owl-carousel home-owl-carousel custom-carousel owl-theme outer-top-xs">
	    	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.jsp"><img src="assets/images/blank.gif" data-echo="assets/images/products/1.jpg" alt=""></a>
			</div><!-- /.image -->			

			                        <div class="tag hot"><span>hot</span></div>		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.jsp">Sony Ericson Vaga</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		                
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.jsp"><img src="assets/images/blank.gif" data-echo="assets/images/products/2.jpg" alt=""></a>
			</div><!-- /.image -->			

			<div class="tag new"><span>new</span></div>                        		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.jsp">Samsung Galaxy S4</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		                
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.jsp"><img src="assets/images/blank.gif" data-echo="assets/images/products/3.jpg" alt=""></a>
			</div><!-- /.image -->			

			            <div class="tag sale"><span>sale</span></div>            		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.jsp">Apple Iphone 5s 32GB</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		               
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.jsp"><img src="assets/images/blank.gif" data-echo="assets/images/products/2.jpg" alt=""></a>
			</div><!-- /.image -->			

			                        <div class="tag hot"><span>hot</span></div>		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.jsp">Samsung Galaxy S4</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		              
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.jsp"><img src="assets/images/blank.gif" data-echo="assets/images/products/6.jpg" alt=""></a>
			</div><!-- /.image -->			

			<div class="tag new"><span>new</span></div>                        		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.jsp">Nokia Lumia 520</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		               
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.jsp"><img src="assets/images/blank.gif" data-echo="assets/images/products/4.jpg" alt=""></a>
			</div><!-- /.image -->			

			            <div class="tag sale"><span>sale</span></div>            		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.jsp">LG Smart Phone LP68</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		               
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
			</div><!-- /.home-owl-carousel -->
</section><!-- /.section -->
<!-- ============================================== FEATURED PRODUCTS : END ============================================== -->
			<!-- ============================================== WIDE PRODUCTS ============================================== -->
<div class="wide-banners wow fadeInUp outer-bottom-vs">
	<div class="row">

		<div class="col-md-12">
			<div class="wide-banner cnt-strip">
				<div class="image">
					<img class="img-responsive" data-echo="assets/images/banners/3.jpg" src="assets/images/blank.gif" alt="">
				</div>	
				<div class="strip strip-text">
					<div class="strip-inner">
						<h2 class="text-right">one stop place for<br>
						<span class="shopping-needs">all your shopping needs</span></h2>
					</div>	
				</div>
				<div class="new-label">
				    <div class="text">NEW</div>
				</div><!-- /.new-label -->
			</div><!-- /.wide-banner -->
		</div><!-- /.col -->

	</div><!-- /.row -->
</div><!-- /.wide-banners -->
<% } //if() %>
<!-- ============================================== WIDE PRODUCTS : END ============================================== -->



		</div><!-- /.homebanner-holder -->
		<!-- ============================================== CONTENT : END ============================================== -->
	</div><!-- /.row -->
	
	<%-- 브랜드 나열 --%>
	<jsp:include page="FOOT1.jsp"></jsp:include>
		
	</div><!-- /.container -->
</div><!-- /#top-banner-and-menu -->





	<%-- FOOT2 --%>
	<jsp:include page="FOOT2.jsp"></jsp:include>



	
	

</body>
</html>