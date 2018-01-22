package servelet;

import DB.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class CheckExistIdServlet
 */
@WebServlet("/CheckExistIdServlet")
public class CheckExistIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckExistIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			System.out.println("ID 중복체크 서블릿 요청");
			// 파라미터 데이터 추출
			String user_id = request.getParameter("user_id");
			
			// 어떤 형태로 데이터를 받는지 정의해줘야함.
			response.setContentType("text/plain; charset=utf-8");
			
			// 아이디 존재 여부 확인
			boolean check = UserDAO.is_exist_user_id(user_id);
			System.out.println(check);
			
			// 응답 결과를 출력할 스트림 생성
			PrintWriter pw = response.getWriter();
			if(check == true){		// 존재하는 아이디
				pw.print("1");
			} else {				// 존재하지 않는 아이디
				pw.print("2");
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







