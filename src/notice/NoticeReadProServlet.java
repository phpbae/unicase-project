package notice;

import DB.notice_DAO;
import bean.notice_Bean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class noticeReadProServlet
 */
@WebServlet("/NoticeReadProServlet")
public class NoticeReadProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeReadProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//  파라미터 데이터 추출
		
		System.out.println("NoticeReadProServlet 요청");
		
		try {
			
			
			int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
			
			System.out.println("공지글 번호 : " + notice_idx);
			
			notice_Bean bean = notice_DAO.get_notice_data(notice_idx);
			
			// bean 객체를 request에 담는다.
			request.setAttribute("notice_bean", bean);
			
			// 이동
			String site ="notice_board/notice_read.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);
			
		
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
