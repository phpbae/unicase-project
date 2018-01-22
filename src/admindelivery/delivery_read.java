package admindelivery;

import DB.DeliveryDAO;
import bean.DeliveryBean;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class order_read
 */
@WebServlet("/delivery_read")
public class delivery_read extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public delivery_read() {
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

		request.setCharacterEncoding("utf-8");

		// 파라미터 추출
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		
		System.out.println("오더넘");
		System.out.println(order_num);

		// 해당 배송정보 불러오기
		try {

			DeliveryBean bean = DeliveryDAO.data_read_all(order_num);

			// ArrayList<DeliveryBean> list =
			// DeliveryDAO.data_read_all2(delivery_idx);

			// 어떤 형태로 데이터를 받는지 정의해줘야함.
			// json 받아라
			response.setContentType("text/json; charset=utf-8");

			// 응답 결과를 출력할 스트림 생성
			PrintWriter pw = response.getWriter();

			JSONObject obj = new JSONObject();

			// 예시
			// obj.put("user_regdate", bean.getUser_regdate().toString());

			obj.put("delivery_idx", bean.getDelivery_idx());
			obj.put("user_id", bean.getUser_id());
			obj.put("order_user_name", bean.getOrder_user_name());
			obj.put("order_pay_opt", bean.getOrder_pay_opt());
			obj.put("order_delivery_opt", bean.getOrder_delivery_opt());
			obj.put("order_date", bean.getOrder_date().toString());
			obj.put("order_delivery_rs", bean.getOrder_delivery_rs());
			obj.put("order_num", bean.getOrder_num());
			obj.put("to_name", bean.getTo_name());
			obj.put("to_addr", bean.getTo_addr());
			obj.put("to_phnum", bean.getTo_phnum());
			obj.put("order_invoice", bean.getOrder_invoice());
			obj.put("order_goods_amount", bean.getOrder_goods_amount());
			

			// JSON 문자열 전송
			pw.print(obj.toJSONString());

			/*
			 * 
			 * d delivery_bean.setDelivery_idx(rs.getInt("DELIVERY_IDX")); //
			 * 배송인덱스 delivery_bean.setUser_id(rs.getString("USER_ID")); // 아이디
			 * delivery_bean.setOrder_user_name(rs.getString("ORDER_USER_NAME")); // 주문자
			 * delivery_bean.setOrder_pay_opt(rs.getInt("ORDER_PAY_OPT")); //
			 * 결제방법 delivery_bean.setOrder_delivery_opt(rs.getInt(
			 * "ORDER_DELIVERY_OPT")); //배송방법
			 * delivery_bean.setOrder_num(rs.getInt("ORDER_NUM")); // 주문번호
			 * delivery_bean.setTo_name(rs.getString("TO_NAME")); // 받는사람
			 * delivery_bean.setTo_addr(rs.getString("TO_ADDR")); // 받는사람 주소
			 * delivery_bean.setTo_phnum(rs.getString("TO_PHNUM")); // 받는사람 연락처
			 * delivery_bean.setOrder_delivery_rs(rs.getInt("ORDER_DELIVERY_RS")
			 * ); //배송결과 delivery_bean.setOrder_date(rs.getDate("ORDER_DATE"));
			 * //주문날짜
			 * 
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
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
