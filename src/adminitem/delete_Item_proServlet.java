package adminitem;

import DB.ItemDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class delete_content
 */
@WebServlet("/delete_Item_proServlet")
public class delete_Item_proServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_Item_proServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 파라미터 데이터 추출
	try{	
		String goods_num = request.getParameter("goods_num");
		String page_num_str = request.getParameter("page_num");
		
		int page_num = Integer.parseInt(page_num_str);
		
		// 해당 상품정보를 삭제한다.
		ItemDAO.delete_item(goods_num);
		ItemDAO.delete_item_detail(goods_num);
		
		// main.jsp로 이동한다.
		String path = request.getContextPath(); 
		String site ="ItemMainBoard.credu?page_num="
				    + page_num;
		response.sendRedirect(site);
		
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
