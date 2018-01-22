package servelet;

import DB.BoxDAO;
import DB.GoodsDAO;
import DB.OrderDAO;
import bean.BoxBean;
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
 * Servlet implementation class ViewCartGoodsProServlet
 */
@WebServlet("/ViewOrderInfoProServlet")
public class ViewOrderInfoProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrderInfoProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			String user_id = ((MemberBean)session.getAttribute("login")).getUser_id();
			ArrayList<BoxBean> box_bean_list = OrderDAO.get_orderbean_info(user_id);
			//각그룹의 첫번재 빈에 이미지를 불러온다.
			box_bean_list = BoxDAO.get_goods_data(user_id);
			box_bean_list = GoodsDAO.get_goods_images(box_bean_list);
			
			request.setAttribute("bean", box_bean_list);
			
			String site = "goods/view_order_info.jsp";
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
