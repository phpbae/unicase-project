package notice;

import DB.notice_DAO;
import bean.MemberBean;
import bean.notice_Bean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class noticeWriteProServlet
 */
@WebServlet("/NoticeWriteProServlet")
public class NoticeWriteProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 파라미터 데이터 추출
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		// 빈 객체에 데이터를 담는다.
		notice_Bean bean = new notice_Bean();
		
		bean.setNotice_title(notice_title);
		bean.setNotice_content(notice_content);
		
		HttpSession session =  request.getSession();
		MemberBean member_bean = (MemberBean)session.getAttribute("login");
		
		bean.setUser_id(member_bean.getUser_id());
		
		int idx_num=0; 
		try{
			
			// DB에 저장한다.
			notice_DAO.add_notice_content(bean);
			
			idx_num = notice_DAO.get_notice_final();
			System.out.println(idx_num);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		// 글 읽는 페이지로 이동한다.
		String site = "notice_read.credu?notice_idx=" + idx_num;
		response.sendRedirect(site);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
