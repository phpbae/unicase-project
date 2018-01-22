package mainpage;

import DB.*;
import bean.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Index() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 상품목록 정보를 불러오기.

		try {
			
			//파라미터 한글처리
			request.setCharacterEncoding("utf-8");

			//파라미터 처리.
			// 1 : 데스크탑
			// 2 : 노트북
			// 3 : 오디오
			// 4 : 마우스
			// 5 : 키보드
			
			
			String search = null;
			
			if(request.getParameter("search") != null){
				
				search = request.getParameter("search");
				
			}
			
			
			
			System.out.println("써치");
			System.out.println(search);
			
			
			if(search == null){
			// 검색 안했을시.	
				
				int goods_num = 0;
				if(request.getParameter("goods") != null){
					
				goods_num =  Integer.parseInt(request.getParameter("goods"));
				
				}
				
				if(goods_num == 0){
					
					//첫페이지 8개 나오는거
					ArrayList<ItemBean> listitem = ItemDAO.get_main_item_new();

					// request에 담는다.
					request.setAttribute("listitem", listitem);

					// 페이지 이동
					String site = "main.jsp?goods=" + goods_num;
					RequestDispatcher dis = request.getRequestDispatcher(site);
					dis.forward(request, response);
					
					
				} else {
					
					ArrayList<ItemBean> listitem = ItemDAO.filter_get_item(goods_num);

					// request에 담는다.
					request.setAttribute("listitem", listitem);

					// 페이지 이동
					String site = "main.jsp?goods=" + goods_num;
					RequestDispatcher dis = request.getRequestDispatcher(site);
					dis.forward(request, response);
					
					
				}
				
				
				
			}else{
				
				//검색값이 존재할때.
				//등록된 상품이름으로 검색.
				
				
				ArrayList<ItemBean> listitem = ItemDAO.search_get_item(search);

				// request에 담는다.
				request.setAttribute("listitem", listitem);

				
				// 페이지 이동
				String site = "main.jsp?search=" + search;
				RequestDispatcher dis = request.getRequestDispatcher(site);
				dis.forward(request, response);
				
				
				
			}
			
			
			
			
			
			
			
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
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
