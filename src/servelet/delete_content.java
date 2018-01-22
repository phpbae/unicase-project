package servelet;

import DB.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class delete_content
 */
@WebServlet("/delete_content")
public class delete_content extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_content() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 파라미터 데이터 추출
	try{	
		String qa_num_str = request.getParameter("qa_num");
		String page_num_str = request.getParameter("page_num");
		int qa_num = Integer.parseInt(qa_num_str);
		
		int page_num = Integer.parseInt(page_num_str);
		// 글을 삭제한다.
		BoardDAO.delete_content(qa_num);
		// main.jsp로 이동한다.
		String path = request.getContextPath(); 
		String site = path + "/BoardMainServlet?page_num="
				    + page_num;
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
