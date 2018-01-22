package servelet;

import DB.BoardDAO;
import bean.BoardBean;
import bean.MemberBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class qamodifycontentServlet
 */
@WebServlet("/qamodifycontentServlet")
public class qamodifycontentServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qamodifycontentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
      // 데이터를 수정한다.
      
      ServletContext context = getServletContext();
      String path = context.getRealPath("/upload");
      // 파일 용량
      int max = 1024 * 1024 * 100;      // 100MB
      // 인코딩 타입
      String enc = "utf-8";
      // 파일 업로드 처리
      DefaultFileRenamePolicy dfr
         = new DefaultFileRenamePolicy();
      MultipartRequest mr
         = new MultipartRequest(request, path, max, enc, dfr);
      // 파라미터 데이터 추출
      String qa_num_str = mr.getParameter("qa_num"); //QA_NUM
      int qa_num = Integer.parseInt(qa_num_str);
      String qa_title = mr.getParameter("qa_title");  //QA_TITLE 
      String qa_content = mr.getParameter("qa_content");  //QA_CONTENT
      // 서버에서의 파일 이름을 추출
      String qa_ref_file = mr.getFilesystemName("qa_ref_file"); //QA_REF_FILE
      
      // 빈 객체에 데이터를 담는다.
      BoardBean Board_beans = new BoardBean();
      Board_beans.setQa_title(qa_title);
      Board_beans.setQa_content(qa_content);
      Board_beans.setQa_num(qa_num);
      Board_beans.setQa_ref_file(qa_ref_file);
      
      HttpSession session = request.getSession();
      MemberBean member_bean
         = (MemberBean)session.getAttribute("login");
      
      Board_beans.setUser_id(member_bean.getUser_id());
      
    
      
      
      
      int max_idx = 0;
      BoardBean board_beans = new BoardBean();
      try {
         
         if(qa_ref_file!=null)
         {
            BoardDAO.modify_content(Board_beans);
            
         }
         else
         {
            BoardDAO.modify_content2(Board_beans);
         }
         
           
         
         
         max_idx = BoardDAO.get_max_idx();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      // 글 읽는 페이지로 이동한다.
      String site = "board_main.credu?qa_num=" + max_idx;
      response.sendRedirect(site);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}