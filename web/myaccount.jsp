<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
   
   int user_points = (Integer)request.getAttribute("user_points");
   int user_grade = (Integer)request.getAttribute("user_grade");

   

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

       <title>Unicase</title>

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

      <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
      <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
      <link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
      <link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
      <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
      <!-- Demo Purpose Only. Should be removed in production : END -->

      
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
   
   
<div class="breadcrumb">
   <div class="container">
      <div class="breadcrumb-inner">
         <ul class="list-inline list-unstyled">
            <li><a href="Index.credu">Home</a></li>
            <li class='active'>My Account</li>
         </ul>
      </div><!-- /.breadcrumb-inner -->
   </div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-bd">
   <div class="container">
      <div class="sign-in-page inner-bottom-sm">
         <div class="row">
            <!-- Sign-in -->   
            <div class="col-sm-3"></div>      
<div class="col-sm-6 sign-in">
   <h4 class="">My Account</h4>
   <p class="">Hello, You can manage your account.</p>
   <div class="social-sign-in outer-top-xs">
      <a href="login/user/modify_user_form.jsp" class="facebook-sign-in"><i class="fa fa-wrench"></i>My Account Revise</a>
      <a href="login/user/leave_user_form.jsp" class="twitter-sign-in"><i class="fa fa-times"></i>Leave UNICASE</a>
   </div>
   
   <br>
<div class="table-responsive">
      <table class="table table-bordered">
         <thead>
            <tr>
               <th class="cart-sub-total item" >Your Points</th>
               <th class="cart-total last-item">Your Grade</th>
               <th class="search_delivery">Your Delivery</th>
            </tr>
         </thead><!-- /thead -->
                     
         <tbody>
                     
            <tr>
               <td id="user_points"><i class="icon fa fa-money"></i> <%=user_points%></td>
               
               <% if(user_grade==1){ %>
                  <td id="user_grade"><i class="icon fa fa-user"></i> Normal Grade</td>
               <% } else if(user_grade==2){%>
                  <td id="user_grade"><i class="icon fa fa-user"></i> VIP Grade</td>
               <% } else if(user_grade==3){%>
                  <td id="user_grade"><i class="icon fa fa-star"></i> Admin Grade</td>
               <% } %>
               
               <td id="order_delivery_rs"><a href="customer_delivery.credu" class="btn btn-danger">배송조회</a></td>
            </tr>
         </tbody><!-- /tbody -->
      </table><!-- /table -->
   </div>
   
   
   
</div>
<div class="col-sm-3"></div>


         </div><!-- /.row -->
      </div><!-- /.sigin-in-->
      <%-- 브랜드 나열 --%>
   <jsp:include page="FOOT1.jsp"></jsp:include>
   
         </div><!-- /.container -->
</div><!-- /.body-content -->

   <%-- FOOT2 --%>
   <jsp:include page="FOOT2.jsp"></jsp:include>

   

</body>
</html>