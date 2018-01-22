package notice;

import DB.notice_DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class qamodifycontentServlet
 */
@WebServlet("/ModifyProServlet")
public class ModifyProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("ModifyProServlet 호출");
		
		// 데이터를 수정한다.

		// 파라미터 데이터 추출
		int notice_num =Integer.parseInt(request.getParameter("notice_num")); //notice_num
		String notice_title = request.getParameter("notice_title");  //notice_title 
		String notice_content = request.getParameter("notice_content");  //notice_content
		
		System.out.println(notice_title);
		
		
		
		try {
			notice_DAO.modify_content2(notice_num, notice_title, notice_content);
			
			/*
			// 글 읽는 페이지로 이동한다.
			String site = "notice_main.credu"; 
			response.sendRedirect(site);
			*/
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
