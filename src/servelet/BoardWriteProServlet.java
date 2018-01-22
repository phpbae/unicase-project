package servelet;

import DB.BoardDAO;
import bean.BoardBean;
import bean.MemberBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class BoardWriteProServlet
 */
@WebServlet("/BoardWriteProServlet")
public class BoardWriteProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 파일이 업로드될 물리적인 경로를 파악한다.
		ServletContext context = getServletContext();
		String path = context.getRealPath("/upload");
		
		System.out.println("----업로드 경로----");
		System.out.println(path);
		
		// 파일 용량
		int max = 1024 * 1024 * 100;		// 100MB
		// 인코딩 타입
		String enc = "utf-8";
		// 파일 업로드 처리
		DefaultFileRenamePolicy dfr
			= new DefaultFileRenamePolicy();
		MultipartRequest mr
			= new MultipartRequest(request, path, max, enc, dfr);
		// 파라미터 데이터 추출
		String qa_title = mr.getParameter("qa_title");  //QA_TITLE 
		String qa_content = mr.getParameter("qa_content");  //QA_CONTENT
		// 서버에서의 파일 이름을 추출
		String qa_ref_file = mr.getFilesystemName("qa_ref_file"); //QA_REF_FILE
		
		// 빈 객체에 데이터를 담는다.
		BoardBean bean = new BoardBean();
		bean.setQa_title(qa_title);
		bean.setQa_content(qa_content);
		bean.setQa_ref_file(qa_ref_file);
		
		HttpSession session = request.getSession();
		MemberBean member_bean
			= (MemberBean)session.getAttribute("login");
		
		bean.setUser_id(member_bean.getUser_id());
		
		int max_idx = 0;
		try{
			// 디비에 저장한다.
			BoardDAO.add_board_content(bean);
			max_idx = BoardDAO.get_max_idx();
		}catch(Exception e){
			e.printStackTrace();
		}
		// 글 읽는 페이지로 이동한다.
		String site = "board_read.credu?qa_num=" + max_idx;
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
