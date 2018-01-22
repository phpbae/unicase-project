package servelet;

import DB.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class removeReplyServlet
 */
@WebServlet("/removeReplyServlet")
public class removeReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			String qa_num_str = request.getParameter("qa_num");
			String page_num_str = request.getParameter("page_num");
			String rqa_num_str = request.getParameter("rqa_num");
			int qa_num = Integer.parseInt(qa_num_str);
			int rqa_num = Integer.parseInt(rqa_num_str);
			int page_num = Integer.parseInt(page_num_str);
			// 삭제한다.		
			BoardDAO.remove_reply(rqa_num);
			// 페이지 이동
			String site = "board_read.credu?qa_num=" + qa_num + "&page_num="+page_num;
			response.sendRedirect(site);
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
