package servelet;

import DB.BoxDAO;
import bean.BoxBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class BuyGoodsProServlet
 */
@WebServlet("/BuyGoodsProServlet")
public class BuyGoodsProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyGoodsProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int box_goods_amount_1 = Integer.parseInt(request.getParameter("goods_cnt1"));
		int box_goods_amount_2 = Integer.parseInt(request.getParameter("goods_cnt2"));
		int box_goods_amount_3 = Integer.parseInt(request.getParameter("goods_cnt3"));
		int box_goods_amount_4 = Integer.parseInt(request.getParameter("goods_cnt4"));
		int box_num = Integer.parseInt(request.getParameter("box_num"));
		System.out.println("serv");
		BoxBean box_bean = new BoxBean();
		box_bean.setGoods_color_num_1(box_goods_amount_1);
		box_bean.setGoods_color_num_2(box_goods_amount_2);
		box_bean.setGoods_color_num_3(box_goods_amount_3);
		box_bean.setGoods_color_num_4(box_goods_amount_4);
		box_bean.setBox_num(box_num);
		
		try {
			BoxDAO.update_cart_data(box_bean);
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
