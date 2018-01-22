package servelet;

import DB.BoardDAO;
import bean.BoardBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class modify_content_proServlet
 */
@WebServlet("/modify_content_proServlet")
public class modify_content_proServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modify_content_proServlet() {
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
			String qa_num_str = request.getParameter("qa_num");
			int qa_num = Integer.parseInt(qa_num_str);
			//조회수를 증가시킨다.

			BoardBean bean = BoardDAO.get_board_data(qa_num);
			
			
			
			//bean 객체를 request에 담는다.
			request.setAttribute("board_bean", bean);
			// 이동
			String site = "board/board_modify_content.jsp";
			RequestDispatcher dis 
				= request.getRequestDispatcher(site);
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
