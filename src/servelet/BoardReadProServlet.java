package servelet;

import DB.BoardDAO;
import bean.BoardBean;
import bean.RqaBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BoardReadProServlet
 */
@WebServlet("/BoardReadProServlet")
public class BoardReadProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReadProServlet() {
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
			System.out.println(qa_num);
			
			BoardDAO.update_qa_cnt(qa_num);

			BoardBean bean = BoardDAO.get_board_data(qa_num);
			
			ArrayList<RqaBean> rqaBean = BoardDAO.getReplyList(qa_num);
			
			
			
			
			
			//bean 객체를 request에 담는다.
			request.setAttribute("board_bean", bean);
			request.setAttribute("rqa_bean", rqaBean);
			// 이동
			String site = "board/board_read.jsp";
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
