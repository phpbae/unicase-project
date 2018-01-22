package admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class review_delete
 */
@WebServlet("/member_delete")
public class member_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public member_delete() {
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

		System.out.println("member_delete.credu 요청");

		// 파라미터 한글처리
		request.setCharacterEncoding("utf-8");

		// 파라미터값 추출
		String user_id = request.getParameter("user_id");

		// 해당 ID값으로 회원 테이블에서 회원정보 삭제처리
		try {

			member_DAO.member_delete(user_id);

			// 어떤 형태로 데이터를 받는지 정의해줘야함.
			// response.setContentType("text/plain; charset=utf-8");

			// 응답 결과를 출력할 스트림 생성
			// PrintWriter pw = response.getWriter();
			// pw.print(bean.getReview_content());
			
			//페이지 이동
			//String site = "review.credu";
			//response.sendRedirect(site);

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
