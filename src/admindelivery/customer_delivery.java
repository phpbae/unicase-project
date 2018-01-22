package admindelivery;

import DB.DeliveryDAO;
import bean.DeliveryBean;
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
 * Servlet implementation class customer_delivery
 */
@WebServlet("/customer_delivery")
public class customer_delivery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public customer_delivery() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		MemberBean member_bean2 = (MemberBean) session.getAttribute("login");
		String user_id = member_bean2.getUser_id();
		
		// 배송정보 불러오기.
		try {
			ArrayList<DeliveryBean> delivery_list = DeliveryDAO.mydata_read(user_id);
			// request 객체에 list를 담아준다.
			request.setAttribute("list", delivery_list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// delivery.jsp로 이동
		String site = "customer/customer_delivery.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
