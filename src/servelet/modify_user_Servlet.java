package servelet;

import DB.UserDAO;
import bean.MemberBean;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class modify_user_Servlet
 */
@WebServlet("/modify_user_Servlet")
public class modify_user_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modify_user_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 회원정보를 수정한다.
		
		ServletContext context = getServletContext();
		
	
		
		String user_pw = request.getParameter("user_pw");
		String user_addr = request.getParameter("user_addr");
		String user_phnum = request.getParameter("user_phnum");
		String user_email = request.getParameter("user_email");
		String user_id = request.getParameter("user_id");
		// 빈 객체에 데이터를 담는다.
		
		System.out.println(user_pw);
		System.out.println(user_addr);
		System.out.println(user_phnum);
		System.out.println(user_email);
		System.out.println(user_id);
		MemberBean bean = new MemberBean();
		bean.setUser_pw(user_pw);
		bean.setUser_addr(user_addr);
		bean.setUser_phnum(user_phnum);
		bean.setUser_email(user_email);
		bean.setUser_id(user_id);
		
		try {
			UserDAO.modify_user(bean);
			//사용자 정보를 추출
			MemberBean member_bean = UserDAO.get_user_info(user_id);
			// 사용자 정보를 세션에 담는다.
			HttpSession session = request.getSession();
			session.setAttribute("login", member_bean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 글 읽는 페이지로 이동한다.
		String site = "main_page.credu";
		response.sendRedirect(site);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
