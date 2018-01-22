package admindelivery;

import DB.DeliveryDAO;
import bean.DeliveryBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class delivery_change
 */
@WebServlet("/delivery_change")
public class delivery_change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delivery_change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("delivery_change.credu 요청");
		System.out.println("넘어오나요??");
		
				//파라미터 한글처리
				request.setCharacterEncoding("utf-8");
				
				//파라미터값 추출
				//int delivery_idx = Integer.parseInt(request.getParameter("delivery_idx"));
				String to_name = request.getParameter("to_name");
				String to_addr = request.getParameter("to_addr");
				String to_phnum = request.getParameter("to_phnum");
				
				int order_num = Integer.parseInt(request.getParameter("order_num"));
				String user_id = request.getParameter("user_id");
				String order_user_name = request.getParameter("order_user_name");
				int order_goods_amount = Integer.parseInt(request.getParameter("order_goods_amount"));
				int order_pay_opt = Integer.parseInt(request.getParameter("order_pay_opt"));
				String order_invoice = request.getParameter("order_invoice");
				int order_delivery_opt = Integer.parseInt(request.getParameter("order_delivery_opt"));
				int order_delivery_rs = Integer.parseInt(request.getParameter("order_delivery_rs"));
				
				//빈 객체 생성 및 빈에 data 셋팅
				DeliveryBean bean = new DeliveryBean();
				
				bean.setTo_addr(to_addr);
				bean.setTo_phnum(to_phnum);
				bean.setTo_phnum(to_phnum);
				//bean.setDelivery_idx(delivery_idx);
				bean.setOrder_num(order_num);
				bean.setUser_id(user_id);
				bean.setOrder_user_name(order_user_name);
				bean.setOrder_goods_amount(order_goods_amount);
				bean.setOrder_pay_opt(order_pay_opt);
				bean.setOrder_invoice(order_invoice);
				bean.setOrder_delivery_opt(order_delivery_opt);
				bean.setOrder_delivery_rs(order_delivery_rs);
				
				
				//DAO 호출
				try {
					DeliveryDAO.delivery_change(bean);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				// 이동
				String site = "admin_delivery.credu";
				RequestDispatcher dis 
					= request.getRequestDispatcher(site);
				dis.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
