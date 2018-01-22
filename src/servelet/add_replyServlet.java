package servelet;

import DB.BoardDAO;
import bean.MemberBean;
import bean.RqaBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class add_replyServlet
 */
@WebServlet("/add_replyServlet")
public class add_replyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_replyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String page_num_str = request.getParameter("page_num");
		int page_num = Integer.parseInt(page_num_str);*/
		
		request.setCharacterEncoding("utf-8");
		
		try {
			// 페이지 번호 추출
			String page_num = request.getParameter("page_num");
			if(page_num == null){
				page_num = "1";	
			}
			
			String rqa_content = request.getParameter("rqa_content");
			String qa_num = request.getParameter("qa_num");
			
			RqaBean bean = new RqaBean();
			bean.setRqa_content(rqa_content);
			bean.setQa_num(Integer.parseInt(qa_num));
			HttpSession session = request.getSession();
			MemberBean member_bean
				= (MemberBean)session.getAttribute("login");
			
			bean.setUser_id(member_bean.getUser_id());
			
			BoardDAO.add_reply(bean);
			
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
