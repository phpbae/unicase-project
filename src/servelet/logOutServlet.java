package servelet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class logOutServlet
 */
@WebServlet("/logOutServlet")
public class logOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String site = null;
		session.invalidate();
		
//		if(session.getAttribute("dto")!=null)
//		{
			
			site = "Index.credu";
//		}
//		else
//		{
//			request.setAttribute("error_message", "로그인 먼저 하세요");
//			site= "logout.jsp";
//		}
//		RequestDispatcher rdp = request.getRequestDispatcher(site);
//		rdp.forward(request, response);
		
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
