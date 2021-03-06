package servelet;

import DB.BoardDAO;
import bean.BoardBean;
import bean.MemberBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BoardMainServlet
 */
@WebServlet("/BoardIDMainServlet")
public class BoardIDMainServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardIDMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      try{
         // 페이지 번호를 추출한다.
         HttpSession session = request.getSession();
         MemberBean member_bean
            = (MemberBean)session.getAttribute("login");
         String user_id = member_bean.getUser_id();
         String page_num_str
            = request.getParameter("page_num");
         if(page_num_str == null || page_num_str.length() == 0){
            page_num_str = "1";
         }
         int page_num = Integer.parseInt(page_num_str);
         // 글 데이터를 가져온다.
         ArrayList<BoardBean> list
            = BoardDAO.get_board_all_id(page_num,user_id);
         
         // 페이지의 개수를 가져온다.
         
         int cnt = BoardDAO.get_my_write_page_cnt(user_id);
                  // request에 담는다.
         request.setAttribute("list", list);
         request.setAttribute("cnt", cnt);
         // board_main.jsp로 이동한다.
         String site = "board/board_IDmain.jsp";
         RequestDispatcher dis = request.getRequestDispatcher(site);
         dis.forward(request, response);
      }catch(Exception e){
         e.printStackTrace();
      }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}