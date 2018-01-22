<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>

<% 

request.setCharacterEncoding("utf-8");
ItemBean listitem= (ItemBean) request.getAttribute("listitem");
ArrayList<ItemBean> listitem2 = (ArrayList<ItemBean>)request.getAttribute("listitem2");



%>
<%
   int goods_amount_save[]= new int[4];
   int cnt=0;
   for(ItemBean goodsbean : listitem2){
      goods_amount_save[cnt] = goodsbean.getGodds_amount();
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

       <title>DetailPage</title>

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

      

      
      <!-- Icons/Glyphs -->
      <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Fonts --> 
      <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      
      <!-- Favicon -->
      <link rel="shortcut icon" href="assets/images/favicon.ico">

      <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
      <!--[if lt IE 9]>
         <script src="assets/js/html5shiv.js"></script>
         <script src="assets/js/respond.min.js"></script>
      <![endif]-->

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(function(){
   
	$("#goods_code > option").eq(${requestScope.item_bean.getGoods_code() - 1}).attr("selected", "selected");
   <%for (ItemBean bean2 : listitem2) {%>
      $("#goods_amount_<%=bean2.getGoods_color_num()%>").val(<%=bean2.getGodds_amount()%>);
   <%}%>
   
   
   //review
   $("#review_window").attr("src", "review.credu?goods_num=" + <%= listitem.getGoods_num()%>); 
   
   
});


function add_cart(){
	var param = {
		goods_num : "<%=request.getParameter("goods_num")%>",
		box_goods_amount : 1,		//임의의 값 입력박스 필요
		goods_color_num_1 : $("#good_amount_0").val(),		//임의의 값 입력박스 필요
		goods_color_num_2 : $("#good_amount_1").val(),		//임의의 값 입력박스 필요
		goods_color_num_3 : $("#good_amount_2").val(),		//임의의 값 입력박스 필요
		goods_color_num_4 : $("#good_amount_3").val()		//임의의 값 입력박스 필요
	};
	
	$.ajax({
		url : "add_cart.credu",
		type : "post",
		dataType : "text",
		data : param,
		success : function(data){
			alert("상품이 추가되었습니다.");
		}
	});
}







</script>



   </head>
 

<body class="cnt-home">
   
   <%-- 상단메뉴 --%>   
   <jsp:include page="TOP.jsp"/>      
   

<div class="breadcrumb">
   <div class="container">
      <div class="breadcrumb-inner">
         <ul class="list-inline list-unstyled">
            <li><a href="Index.credu">Home</a></li>
            <li><a href="javascript:history.back()">Back</a></li>
            <li class='active'><%= listitem.getGoods_name() %></li>
         </ul>
      </div><!-- /.breadcrumb-inner -->
   </div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-xs">
   <div class='container'>
      <div class='row single-product outer-bottom-sm '>
         <div class='col-md-3 sidebar'>
            <div class="sidebar-module-container">

   
<!-- ============================================== COLOR: END ============================================== -->
            </div>
         </div><!-- /.sidebar -->
         <div class='col-sm-12'>
            <div class="row  wow fadeInUp">
                    <div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
    <div class="product-item-holder size-big single-product-gallery small-gallery">

        <div id="owl-single-product">
            <div class="single-product-gallery-item" id="slide1">
                <a data-lightbox="image-1" data-title="Gallery" href="assets/images/single-product/1.jpg">
                    <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.getGoods_img()%>" width="370" height="450"/>
                </a>
            </div><!-- /.single-product-gallery-item -->

            <div class="single-product-gallery-item" id="slide2">
                <a data-lightbox="image-1" data-title="Gallery" href="assets/images/single-product/2.jpg">
                    <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.getGoods_img()%>" width="370" height="450"/>
                </a>
            </div><!-- /.single-product-gallery-item -->          
           
            <div class="single-product-gallery-item" id="slide3">
                <a data-lightbox="image-1" data-title="Gallery" href="assets/images/single-product/2.jpg">
                    <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.getGoods_img()%>" width="370" height="450"/>
                </a>
            </div><!-- /.single-product-gallery-item -->          
        </div><!-- /.single-product-slider -->


        <div class="single-product-gallery-thumbs gallery-thumbs">

            <div id="owl-single-product-thumbnails">
                <div class="item">
                    <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="1" href="#slide1">
                        <img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.getGoods_img()%>" />
                    </a>
                </div>

                <div class="item">
                    <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide2">
                        <img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.getGoods_img()%>"/>
                    </a>
                </div>
                
                <div class="item">
                    <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="3" href="#slide1">
                        <img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/upload/<%=listitem.getGoods_img()%>"/>
                    </a>
                </div>

                
            </div><!-- /#owl-single-product-thumbnails -->

            

        </div><!-- /.gallery-thumbs -->

    </div><!-- /.single-product-gallery -->
</div><!-- /.gallery-holder -->                 
               <div class='col-sm-6 col-md-7 product-info-block'>
                  <div class="product-info">
                     <h1 class="name"><%= listitem.getGoods_name() %></h1>
                  
                     <div class="stock-container info-container m-t-10">
                        <div class="row">
                           <div class="col-sm-3">
                              <div class="stock-box">
                                 <span class="label">Availability :</span>
                              </div>   
                           </div>
                           <div class="col-sm-9">
                              <div class="stock-box">
   <% 
         for(ItemBean goodsbean : listitem2){
               if(goodsbean.getGodds_amount()!=0){
   %>                         
                                 <span class="value">In Stock</span>
   <%
            break;
               }
               else
               {
    %>
                                  <span class="value">Out of stock</span>
      <%          break;
               }
         } %>                              
                              </div>   
                           </div>
                        </div><!-- /.row -->   
                     </div><!-- /.stock-container -->

                     <div class="description-container m-t-20">
                        <p>브 랜 드 : <%=listitem.getGoods_brand() %></p>
                        <P>상품코드 : <%=listitem.getGoods_code() %><p/>
                        <P>적 립 금 : <%=listitem.getGoods_points() %> 원<p/>
                        
                        
                     </div><!-- /.description-container -->

                     <div class="price-container info-container m-t-20">
                        <div class="row">
                           

                           <div class="col-sm-6">
                              <div class="price-box">
                                 <span class="price"><%= listitem.getGoods_price() %>원</span>
                              </div>
                           </div>

                           

                        </div><!-- /.row -->
                     </div><!-- /.price-container -->

                        <div class="quantity-container info-container">
                        <div class="row">
                           
                           <div class="col-sm-2">
                              <span class="label">빨강 :</span>
                           </div>
                           
                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input  col-sm-6">
                                        <div class="arrows">
                                          <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
                                          <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
                                        </div>
                                        <input type="text" value="0" id="good_amount_0" name="good_amount_0" readonly/>
                                   </div>
                                   
                                 </div>
                           </div>
                           
                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input  col-sm-6">
                                        <div>
                                          <div><span class="ir"></span></div>
                                          <div><span class="ir"></span></div>
                                        </div>
                                        <input type="text" value="0" id="goods_amount_0" name="goods_amount_0"readonly/>
                                   </div>
                                   
                                 </div>
                           </div>
                  

   

                           
                        </div><!-- /.row -->
                        <div class="row">
                           
                           <div class="col-sm-2">
                              <span class="label">검정 :</span>
                           </div>
                           
                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input  col-sm-6">
                                        <div class="arrows">
                                          <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
                                          <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
                                        </div>
                                        <input type="text" value="0" id="good_amount_1" name="good_amount_1" readonly/>
                                   </div>
                                   
                                 </div>
                           </div>

                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input  col-sm-6">
                                        <div>
                                          <div><span class="ir"></span></div>
                                          <div><span class="ir"></span></div>
                                        </div>
                                        <input type="text" value="0" id="goods_amount_1" name="goods_amount_1"readonly/>
                                   </div>
                                   
                                 </div>
                           </div>
   

                           
                        </div><!-- /.row -->
                        <div class="row">
                           
                           <div class="col-sm-2">
                              <span class="label">노랑 :</span>
                           </div>
                           
                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input">
                                        <div class="arrows">
                                          <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
                                          <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
                                        </div>
                                        <input type="text" value="0" id="good_amount_2" name="good_amount_2" readonly/>
                                   </div>
                                 </div>
                           </div>

                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input  col-sm-6">
                                        <div>
                                          <div><span class="ir"></span></div>
                                          <div><span class="ir"></span></div>
                                        </div>
                                        <input type="text" value="0" id="goods_amount_2" name="goods_amount_2"readonly/>
                                   </div>
                                   
                                 </div>
                           </div>   

                           
                        </div><!-- /.row -->
               <div class="row">
                           
                           <div class="col-sm-2">
                              <span class="label">파랑 :</span>
                           </div>
                           
                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input">
                                        <div class="arrows">
                                          <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
                                          <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
                                        </div>
                                        <input type="text" value="0" id="good_amount_3" name="good_amount_3" readonly/>
                                   </div>
                                 </div>
                           </div>

                           <div class="col-sm-1">
                              <div class="cart-quantity">
                                 <div class="quant-input  col-sm-6">
                                        <div>
                                          <div><span class="ir"></span></div>
                                          <div><span class="ir"></span></div>
                                        </div>
                                        <input type="text" value="0" id="goods_amount_3" name="goods_amount_3" readonly/>
                                   </div>
                                   
                                 </div>
                           </div>   

                           
                        </div><!-- /.row -->
                                       
                        
                        <div class="row">
                           <div class="col-sm-4">&nbsp;</div>
                           <div class="col-sm-8">
                        
                              <a href="#" class="btn btn-primary" onclick="add_cart()"><i class="fa fa-shopping-cart inner-right-vs"></i> ADD TO CART</a>
                           </div>
                        </div>

                           
                        
                     </div><!-- /.quantity-container -->

                           
         
                     <div class="product-social-link m-t-20 text-right">
                        <span class="social-label">Share :</span>
                        <div class="social-icons">
                              <ul class="list-inline">
                                  <li><a class="fa fa-facebook" href="http://facebook.com/transvelo"></a></li>
                                  <li><a class="fa fa-twitter" href="#"></a></li>
                                  <li><a class="fa fa-linkedin" href="#"></a></li>
                                  <li><a class="fa fa-rss" href="#"></a></li>
                                  <li><a class="fa fa-pinterest" href="#"></a></li>
                              </ul><!-- /.social-icons -->
                          </div>
                     </div>

                     

                     
                  </div><!-- /.product-info -->
               </div><!-- /.col-sm-7 -->
            </div><!-- /.row -->

            
               <div class="product-tabs inner-bottom-xs  wow fadeInUp">
               <div class="row">
                  <div class="col-sm-3">
                     <ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
                        <li class="active"><a data-toggle="tab" href="#description">DESCRIPTION</a></li>
                        <li><a data-toggle="tab" href="#review">REVIEW</a></li>
                        
                     </ul><!-- /.nav-tabs #product-tabs -->
                  </div>
                  
                  <div class="col-sm-9">

                     <div class="tab-content">
                        
                        <div id="description" class="tab-pane in active">
                           <div class="product-tab">
                              <p class="text"><%= listitem.getGoods_info() %></p>
                           </div>   
                        </div><!-- /.tab-pane -->

                        <div id="review" class="tab-pane">
                           <div id="reviews" class="product-tab">
                              
                              <iframe id="review_window" src="" width="900" height="750" style="border:0px;"></iframe>
                              
                           </div>   
                           
                        </div><!-- /.tab-pane -->
                        

                     </div><!-- /.tab-content -->
                  </div><!-- /.col -->
               </div><!-- /.row -->
            </div><!-- /.product-tabs -->

         
         </div><!-- /.col -->
         
      </div><!-- /.row -->

   </div><!-- /.container -->
</div><!-- /.body-content -->

   <%-- FOOT2 --%>
   <jsp:include page="FOOT2.jsp"></jsp:include>
   

</body>

</html>