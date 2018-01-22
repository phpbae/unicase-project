<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>
<%@ page import="java.util.*" %>

<%
   // 페이지 번호 추출
   String page_num = request.getParameter("page_num");
   if(page_num == null){
      page_num = "1";   
   }
   
   ArrayList<RqaBean> rqa_list = (ArrayList<RqaBean>)request.getAttribute("rqa_bean");

%>
<%
   // 파라미터 한글 처리
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 읽기</title>
<%-- BootStrap CDN --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
   function rqa_check_form(){
      
      // 답글이 비어있는지
      if($("#rqa_content").val() == ""){
         alert("내용을 입력해주세요");
         $("#rqa_content").focus();
         return false;
      }      
      return true;
   }
</script>
</head>
<body>
   <div class="container">
      <div class="row">
            <br/>
      <div class="col-sm-9"></div><div class="col-sm-2"><a href="logout.credu" class="btn btn-success">로그아웃</a></div>
         <div class="col-sm-2"></div>
         <div class="col-sm-8">
            <h1>글 읽기</h1>
            <div class="panel panel-success">
               <div class="panel-heading">
                  글 읽기
               </div>
               <div class="panel-body">
                  <form class="form-horizontal" role="form">
                     <div class="form-group">
                        <label class="control-label col-sm-3"
                               for="board_writer">
                               작성자
                        </label>
                        <div class="col-sm-9">
                           <input type="text" class="form-control"
                                  id="board_writer"
                                  value="${requestScope.board_bean.user_name}" readonly/>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3"
                               for="qa_title">
                               제목
                        </label>
                        <div class="col-sm-9">
                           <input type="text" class="form-control"
                                  id="qa_title"
                                  value="${requestScope.board_bean.qa_title}"   
                                  readonly/>                               
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3"
                               for="qa_content">
                               내용
                        </label>
                        <div class="col-sm-9">
                           <%
                              BoardBean bean 
                                 = (BoardBean)request.getAttribute("board_bean");
   
                           %>
                           <% if(bean.getQa_ref_file() != null){ %>
                           <img src="upload/<%=bean.getQa_ref_file()%>" width="370" height="450" alt="Goods_img"/>
                           <% } %>
                           <textarea id="board_content" class="form-control"
                                     rows="5" readonly>${requestScope.board_bean.qa_content}</textarea>
                        </div>
                     </div>
                     <div style="text-align:right">
                     <% 
                     MemberBean member_bean = (MemberBean)session.getAttribute("login");
                     String id1 = bean.getUser_id();
                     String id2 = member_bean.getUser_id();
                     int grade = member_bean.getUser_grade();
                     
                     
                     if(id1.equals(id2)){ 
                        %>
                        <a href="board_modify_content.credu?qa_num=${requestScope.board_bean.qa_num}&page_num=<%=page_num%>"class="btn btn-success">수정하기</a>         
                        <a href="delete_content?qa_num=${requestScope.board_bean.qa_num}&page_num=<%=page_num%>"
                           class="btn btn-success" >삭제하기</a>   
                     <% }else if(grade==3){ %>
                        <a href="board_modify_content.credu?qa_num=${requestScope.board_bean.qa_num}&page_num=<%=page_num%>"class="btn btn-success">수정하기</a>         
                        <a href="delete_content?qa_num=${requestScope.board_bean.qa_num}&page_num=<%=page_num%>"
                           class="btn btn-success" >삭제하기</a>
                        <%} %>      
                     
                     

   
                        <a href="board_main.credu?page_num=<%=page_num%>" class="btn btn-success">
                           메인 페이지
                        </a>
                        
                        
                     </div>
                  </form>
               </div>
            </div>
         </div>
         <div class="col-sm-2"></div>
      </div>
   </div>
      

<div class="container">
      <div class="col-sm-2"></div>
         <div class="col-sm-5">
<H2>reple :</H2>
         
<form class="form-horizontal" role="form" action="rqa_add_Reply.credu" method="post" onsubmit="return rqa_check_form()">
   <textarea name="rqa_content" rows="5" cols="100" id="rqa_content"></textarea>
   <input type="hidden" name="qa_num" value="${requestScope.board_bean.qa_num}"/>
   <br/>
   <div class="col-sm-9"></div><button type="submit" name="rqa_content" class="btn btn-success" >작성완료</button>
</form>
<%-- 댓글의 개수만큼 반복한다. --%>
<% 
   
   for(RqaBean rqa_bean : rqa_list){ %>
   <span class="label label-default"><%=rqa_bean.getUser_id() %></span> 님의 댓글:    
   <textarea rows="5" cols="100" align="center" readonly/><%=rqa_bean.getRqa_content()%></textarea><br/>
   <%
      
      String login_id = member_bean.getUser_id();
      String reply_id = rqa_bean.getUser_id();
      if(login_id.equals(reply_id)){
   %>
   <div class="col-sm-9"></div>
      <a href="rqa_remove_Reply.credu?rqa_num=<%=rqa_bean.getRqa_num()%>&qa_num=${requestScope.board_bean.qa_num}&page_num=<%=page_num%>">
      삭제하기</a>
      <br/>
      <% }else if(grade==3){ %>
   <div class="col-sm-9"></div>
      <a href="rqa_remove_Reply.credu?rqa_num=<%=rqa_bean.getRqa_num()%>&qa_num=${requestScope.board_bean.qa_num}&page_num=<%=page_num%>">
      삭제하기</a>
      <br/>      
      <%}%>
<% } %>   
</div>
</div>    
</body>
</html>










