package servelet;

import DB.GoodsDAO;
import bean.GoodsBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class BuyGoodsServlet
 */
@WebServlet("/BuyGoodsServlet")
public class BuyGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			GoodsBean bean = GoodsDAO.get_goods_data("1");	//String goods_num이 인자로 들어가야함
			HttpSession session = request.getSession();
			session.setAttribute("goods", bean);
			
//			String[] box_num = request.getParameterValues("box_num");
//			String[] color_1 = request.getParameterValues("color_1");
//			String[] color_2 = request.getParameterValues("color_2");
//			String[] color_3 = request.getParameterValues("color_3");
//			String[] color_4 = request.getParameterValues("color_4");
			
			
			
//			while(params.hasMoreElements()){
//			System.out.println("in bgserv param");
//			  String names = (String)params.nextElement();
//			  System.out.println(names + " : " + request.getParameter(names) + "<br>");
//			 }
			
			
			RequestDispatcher dis = request.getRequestDispatcher("goods/buy_goods_form.jsp");
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
