package adminitem;

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
 * Servlet implementation class BoardReadProServlet
 */
@WebServlet("/ItemBoardReadProServlet")
public class ItemBoardReadProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardReadProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			// 파라미터 데이터 추출
			String goods_num = request.getParameter("goods_num");
			//조회수를 증가시킨다.
			System.out.println("상품정보");		
			System.out.println("goods_num");
			
			ItemBean goodsbean = ItemDAO.get_itemboard_data(goods_num);
			
			ArrayList<ItemBean> list  = ItemDAO.get_itemboard2_data(goods_num);
			//bean 객체를 request에 담는다.
			request.setAttribute("item_bean", goodsbean);
			request.setAttribute("list", list);
			// 이동
			String site = "admin/item/item_read_form.jsp";
			RequestDispatcher dis 
				= request.getRequestDispatcher(site);
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
