package account;

import bean.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class myaccount
 */
@WebServlet("/myaccount")
public class myaccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myaccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("myaccount.credu 호출");
		
		
		//파라미터 한글처리
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		//세션에 있는 회원정보를 가지고온다.
		MemberBean bean =  (MemberBean) session.getAttribute("login");
		
		
		// 포인트와 등급정보를 가지고 온다.
		int user_points = bean.getUser_points();
		int user_grade = bean.getUser_grade();
		
		
		// 가지고온 정보를 set 해준다.
		request.setAttribute("user_points", user_points);
		request.setAttribute("user_grade", user_grade);
		
		
		
		
		//Page 이동
		String site = "myaccount.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
		//포워딩
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
