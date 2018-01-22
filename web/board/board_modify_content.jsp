<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>
<%
   // 페이지 번호 추출
   String page_num = request.getParameter("page_num");
   if(page_num == null){
      page_num = "1";
   }
%>
<script type="text/javascript">

function check_form(){
   
   // 제목이 비어있는지....
   if($("#qa_title").val() == ""){
      alert("제목을 입력해주세요");
      $("#qa_title").focus();
      return false;
   }
   // 내용이 비어있는지....
   if($("#qa_content").val() == ""){
      alert("내용을 입력해주세요");
      $("#qa_content").focus();
      return false;
   }
   
   return true;
}


function image_preview() {

    $("#qa_ref_file").on('change', function(){
         readURL(this);
     });
   

   
}

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}

</script>
   
   


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
      <br/>
      <div class="col-sm-9"></div><div class="col-sm-2"><a href="logout.credu" class="btn btn-success">로그아웃</a></div>
         <div class="col-sm-2"></div>
         <div class="col-sm-8">
            <h1>수정하기</h1>
            <div class="panel panel-success">
               <div class="panel-heading">
                  수정하기
               </div>
               <div class="panel-body">
                  <form class="form-horizontal" role="form"
                  method="post"
                  action="qa_modify_content.credu"
                  onsubmit="return check_form()"
                  enctype="multipart/form-data">
                     <div class="form-group">
                        <label class="control-label col-sm-3"
                               for="board_writer">
                               작성자
                        </label>
                        <div class="col-sm-9">
                           <input type="text" class="form-control"
                                  id="board_writer"
                                  value="${requestScope.board_bean.user_name}" autocomplete="off" readonly/>
                        </div>
                     </div>      
                     <div class="form-group">
                        <label class="control-label col-sm-3"
                               for="qa_title">
                               제목
                        </label>
                        <div class="col-sm-9">
                           <input type="text" class="form-control"
                                  id="qa_title" name="qa_title"
                                  value="${requestScope.board_bean.qa_title}"   
                                  autocomplete="off"/>                               
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
                           <img id="blah" src="upload/<%=bean.getQa_ref_file()%>" width="370" height="450" alt="Goods_img"/>
                           <% } %>
                        <div class="form-group">
                              <label class="control-label col-sm-3" for="qa_ref_file">
                              이미지 첨부
                              </label>
                           <div class="col-sm-9">
                              <input type="file" name="qa_ref_file"
                                     id="qa_ref_file"
                                     class="form-control"
                                     accept="image/*" onclick="image_preview()"/>
                                       
                           </div>
                           
                           <textarea id="qa_content" name= "qa_content" class="form-control"
                                     rows="5" autocomplete="off"/>${requestScope.board_bean.qa_content}</textarea>
                        </div>
                     </div>
                     <input type="hidden" id="qa_num" name="qa_num" value="${requestScope.board_bean.qa_num}"/>
                     <div style="text-align:right">
                        <button type="submit" class="btn btn-success">
                              확인
                           </button>
                           <button type="reset" class="btn-success">
                              초기화
                           </button>         
                        <a href="board_main.credu?page_num=<%=page_num%>" class="btn btn-success">취소</a>
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










