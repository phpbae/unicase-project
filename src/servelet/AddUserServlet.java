package servelet;

import DB.UserDAO;
import bean.MemberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			// 파라미터 데이터 추출
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_name = request.getParameter("user_name");
			String user_addr = request.getParameter("user_addr"); // 회원 주소
			String user_phnum = request.getParameter("user_phnum"); // 회원 전화번호
			String user_email = request.getParameter("user_email"); // 회원 email
		
			// 빈 객체에 데이터를 담는다.
			MemberBean bean = new MemberBean();
			bean.setUser_id(user_id);
			bean.setUser_pw(user_pw);
			bean.setUser_name(user_name);
			bean.setUser_addr(user_addr);
			bean.setUser_phnum(user_phnum);
			bean.setUser_email(user_email);
			// 데이터 베이스에 저장한다.
			UserDAO.add_user(bean);
			// 완료페이지로 이동
			String site = "login/user/add_user_result.jsp";
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







