package servelet;

import DB.OrderDAO;
import bean.GoodsBean;
import bean.GoodsDetailsBean;
import bean.OrderBean;

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
@WebServlet("/PayGoodsResultServlet")
public class PayGoodsResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayGoodsResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/**
		 * 결제결과를 통하여 결제결과가 성공이면 나머지 정보를 DB에 저장하고
		 * 결제결과가 실패이면 저장했던 DB정보를 삭제한다.*/
		//session 영역 
						
		HttpSession session = request.getSession();
		int order_pay_opt = Integer.parseInt( request.getParameter("paymethod") );
		int order_pay_res = Integer.parseInt( request.getParameter("replycode") );
		int order_delivery_opt = Integer.parseInt( request.getParameter("order_delivery_opt") );
		String[] box_num = request.getParameterValues("box_num");
		
		//정상결제일 경우 "0000"이어야 하나 테스트값으로 9805사용
		int order_state = (order_pay_res==9805) ? 1 : 0;
		int order_num = Integer.parseInt( ( (String)session.getAttribute("order_num_sub") ) );
		
		System.out.println("주문상태 : " + order_state);
		
		
		String goods_num =((GoodsBean)session.getAttribute("goods")).getGoods_num();
		
		//주문결과 가 성공이면 
		if(order_state == 1){
			OrderBean bean = new OrderBean();
			GoodsDetailsBean goods_details_bean = new GoodsDetailsBean();
			
			bean.setOrder_state(order_state);
			bean.setOrder_pay_opt(order_pay_opt);
			bean.setOrder_delivery_opt(order_delivery_opt);
			bean.setOrder_state(order_state);
			bean.setOrder_num(order_num);
			goods_details_bean.setGoods_num(goods_num);
			
			try {
				
				OrderDAO.add_pay_order(bean);
//				BoxDAO.set_order_state(Integer.parseInt(box_num[]));
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			
			try {
				OrderDAO.delete_order(order_num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String site = "payment/pay_result_form.jsp?result=1";
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
