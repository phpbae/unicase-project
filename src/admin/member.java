package admin;

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
 * Servlet implementation class review
 */
@WebServlet("/member")
public class member extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public member() {
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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		System.out.println("member.credu");
		
		
		//정렬
		int align = 0;

		if (request.getParameter("align") != null) {
			align = Integer.parseInt(request.getParameter("align"));
		}
		
		
		int pagenum = 1; // 페이지 번호
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}
		
		//검색(검색 문자열을 가지고온다.)
		String search_val = null;
		if (request.getParameter("search") != null) {
			
			if(request.getParameter("search") == ""){
				search_val = null;
			} else{
				search_val = request.getParameter("search");
			}
			
			
		}
		

		// size 보여줄 페이지당 게시글 개수. 15개당 1page
		int size = 15;

		int tot = 0;
		int cnt = 0;

		try {

			// 총 게시글 개수.
			cnt = member_DAO.member_Count();
			//페이지 번호
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 1page 1 ~ 15 15개
		// 2page 16 ~ 30 15개
		// 3page 31 ~ 45 15개
		
		int end = pagenum * size;
		int start = end - size + 1;
		
		System.out.println(start);
		System.out.println(end);

		// 리뷰게시판 불러오기.
		ArrayList<MemberBean2> list = member_DAO.member_get(start, end, align, search_val);

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
		
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
				

		// member.jsp로 이동
		String site = "/admin/member.jsp";

		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);

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
