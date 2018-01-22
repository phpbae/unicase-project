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
import java.util.ArrayList;

/**
 * Servlet implementation class delivery
 */
@WebServlet("/delivery")
public class delivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delivery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("delivery.credu");
		
		//정렬
		int align = 0;
		
		if(request.getParameter("align") != null){
			align = Integer.parseInt(request.getParameter("align"));
		}
		
		int pagenum = 1;
		if(request.getParameter("Page_num") != null){
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}
		
		//검색(검색 문자열 가지고온다.)
		String search_val = null;
		if(request.getParameter("search") != null){
			if(request.getParameter("search")==""){
				search_val = null;
			} else{
				search_val = request.getParameter("search");
			}
		}
		
		// size 보여줄 페이지당 게시글의 개수
		int size = 15;
		
		int tot = 0;
		int cnt = 0;
		
		try{
			//총 주문정보리스트 개수
			cnt = DeliveryDAO.order_list_Count();
			//페이지 번호
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
				// 1page 1 ~ 15 15개
				// 2page 16 ~ 30 15개
				// 3page 31 ~ 45 15개
				
				int end = pagenum * size;
				int start = end - size + 1;
				

				
				ArrayList<DeliveryBean> list = DeliveryDAO.order_list_get(start, end, align, search_val);

				// request 객체에 list를 담아준다.
				request.setAttribute("list", list);
				
				System.out.println("리스트 싸이즈" + list.size());
				
				
				// request 객체에 총 페이지수를 담아준다.
				request.setAttribute("tot", tot);
						

				// delivery.jsp로 이동
				String site = "admin/delivery/admin_delivery.jsp";
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
