package admin;

import bean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class member_update
 */
@WebServlet("/member_update")
public class member_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member_update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	
		System.out.println("member_update.credu 요청");
	
		
		//파라미터 한글처리
		request.setCharacterEncoding("utf-8");
		
		
		//파라미터값 추출
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_addr = request.getParameter("user_addr");
		String user_phnum = request.getParameter("user_phnum");
		String user_email = request.getParameter("user_email");
		int user_grade = Integer.parseInt(request.getParameter("user_grade"));
		int user_points = Integer.parseInt(request.getParameter("user_points"));
	
		
		// 빈객체 생성 및 빈에다 DATA 셋팅
		MemberBean2 bean = new MemberBean2();
		
		
		bean.setUser_id(user_id);
		bean.setUser_name(user_name);
		bean.setUser_addr(user_addr);
		bean.setUser_phnum(user_phnum);
		bean.setUser_grade(user_grade);
		bean.setUser_points(user_points);
		bean.setUser_email(user_email);
		
		
		// DAO 호출
		member_DAO.member_update(bean);
		
		
		// 업데이트 후 페이지 이동.
		String site = "member.credu";
		
		response.sendRedirect(site);
		/*
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
