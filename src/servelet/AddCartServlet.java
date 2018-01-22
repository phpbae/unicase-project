package servelet;

import DB.BoxDAO;
import DB.GoodsDAO;
import bean.BoxBean;
import bean.GoodsBean;
import bean.MemberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
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
			
			String goods_num = request.getParameter("goods_num");
			System.out.println("in addcartserv : "+goods_num);
			GoodsBean goods_bean = GoodsDAO.get_goods_data(goods_num);
			String user_id = ((MemberBean)session.getAttribute("login")).getUser_id();
			
			int box_goods_amount = Integer.parseInt(request.getParameter("box_goods_amount"));
			int goods_color_num_1 = Integer.parseInt(request.getParameter("goods_color_num_1"));
			int goods_color_num_2 = Integer.parseInt(request.getParameter("goods_color_num_2"));
			int goods_color_num_3 = Integer.parseInt(request.getParameter("goods_color_num_3"));
			int goods_color_num_4 = Integer.parseInt(request.getParameter("goods_color_num_4"));
			int box_goods_price = goods_bean.getGoods_price();
			
			System.out.println("in acs : "+user_id);
			
			BoxBean bean = new BoxBean();
			bean.setBox_goods_amount(box_goods_amount);
			bean.setBox_goods_price(box_goods_price);
			bean.setGoods_color_num_1(goods_color_num_1);
			bean.setGoods_color_num_2(goods_color_num_2);
			bean.setGoods_color_num_3(goods_color_num_3);
			bean.setGoods_color_num_4(goods_color_num_4);
			bean.setGoods_num(goods_num);
			bean.setUser_id(user_id);
			bean.setOrder_state(-1);

			BoxDAO.add_goods_to_cart(bean);
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
