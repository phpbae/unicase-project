package servelet;

import DB.DeliveryDAO;
import DB.OrderDAO;
import bean.DeliveryBean;
import bean.GoodsBean;
import bean.MemberBean;
import bean.OrderBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class PayGoodsResultServlet
 */
@WebServlet("/PayGoodsProServlet")
public class PayGoodsProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayGoodsProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//물품 구매를 누르고 결제하기전 DB에 값을 저장해두기 위한 서블릿
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		//어플리케이션 영역을 사용하기위한 변수
		ServletConfig config = getServletConfig();
		ServletContext sc = config.getServletContext();
		
		//세션영역에 자신의 주문번호를 저장
		String order_num = (String)sc.getAttribute("order_num_sub");
		session.setAttribute("order_num_sub", order_num );
		System.out.println("in pgrs : " + order_num);
		int seq = 0;
		
		String user_id = ((MemberBean)session.getAttribute("login")).getUser_id();
		String order_goods_amount = request.getParameter("order_goods_amount");
		//카트에 있는 정보를 최신화 하기위한 카트 변수
		String[] box_goods_price = request.getParameterValues("box_goods_price");
		String[] goods_cnt = request.getParameterValues("goods_cnt");
		String[] goods_num = request.getParameterValues("goods_num");
		
		String to_name = request.getParameter("to_name");
		String to_addr = request.getParameter("to_addr");
		String to_phnum = request.getParameter("to_phnum");
		
		OrderBean bean = new OrderBean();
		bean.setOrder_user_name( ( (MemberBean)session.getAttribute("login") ).getUser_id());
		bean.setOrder_goods_amount( Integer.parseInt(order_goods_amount) );
		bean.setOrder_require( request.getParameter("order_require") );
		bean.setOrder_points(10);		//사용적립금 임의의 값
		bean.setOrder_give_points(20);	//지급적립금 임의의 값
		bean.setOrder_sum( ( (GoodsBean)session.getAttribute("goods") ).getGoods_price() );
		bean.setOrder_num(Integer.parseInt(order_num));
		bean.setUser_id(user_id);
		
		DeliveryBean delivery_bean = new DeliveryBean();
		delivery_bean.setTo_addr(to_addr);
		delivery_bean.setTo_name(to_name);
		delivery_bean.setTo_phnum(to_phnum);
		
		try {
			DeliveryDAO.add_delivery_info(delivery_bean);
			seq = DeliveryDAO.get_delivery_seq();
			bean.setDelivery_idx(seq);
			OrderDAO.add_pre_order(bean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String site = "payment/pay_goods_form.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(site);
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
