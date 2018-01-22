package servelet;

import DB.UserDAO;
import bean.MemberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			
			// 빈객체에 담는다.
			MemberBean bean = new MemberBean();
			bean.setUser_id(user_id);
			bean.setUser_pw(user_pw);
			
			// 로그인 처리
			int result = UserDAO.check_login(bean);
			// 응답 결과 출력
			if(result == 1){	// 로그인 성공
				
				//사용자 정보를 추출
				MemberBean member_bean = UserDAO.get_user_info(user_id);
				
				// 사용자 정보를 세션에 담는다.
				HttpSession session = request.getSession();
				session.setAttribute("login", member_bean);
				
				// 이동한다.
				System.out.println(member_bean.getUser_grade());
				if(member_bean.getUser_grade()==3)
				{
					response.sendRedirect("administrator.credu");
				}else if(member_bean.getUser_grade()==4){
					response.sendRedirect("memberleave.credu");
				}
				else{
				response.sendRedirect("Index.credu");
				}
			} else if(result == 2){		// 없는 아이디
				String site = "login/index.jsp?result=2";
				response.sendRedirect(site);
			} else if(result == 3){		// 비밀번호가 틀린 경우
				String site = "login/index.jsp?result=3";
				response.sendRedirect(site);
			}
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





