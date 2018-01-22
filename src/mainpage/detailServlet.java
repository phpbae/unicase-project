package mainpage;

import DB.ItemDAO;
import bean.ItemBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class detailServlet
 */
@WebServlet("/detailServlet")
public class detailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      // 페이지 이동
      // 상품목록 정보를 불러오기.

      try {
         String goods_num = request.getParameter("goods_num");
         ItemBean listitem = ItemDAO.get_itemboard_data(goods_num);
         //상품정보를 가져온다. 
         ArrayList<ItemBean> listitem2 = ItemDAO.get_itemboard2_data(goods_num);
         //상품의 세부정보를 가져온다. (색상 수량)

         // request에 담는다.
         request.setAttribute("listitem", listitem);
         request.setAttribute("listitem2", listitem2);

         //페이지 이동
         String site = "detail.jsp";
         RequestDispatcher dis = request.getRequestDispatcher(site);
         dis.forward(request, response);

      } catch (Exception e) {
         // TODO Auto-generated catch block
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