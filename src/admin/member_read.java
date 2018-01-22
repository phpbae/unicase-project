package admin;

import bean.*;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class review_read
 */
@WebServlet("/member_read")
public class member_read extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member_read() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		System.out.println("member_read.credu 요청");
	
		
		//파라미터 한글처리
		request.setCharacterEncoding("utf-8");
		
		
		//파라미터값 추출
		String id = request.getParameter("user_id");
		System.out.println(id);
		
		
		// 해당 리뷰글 정보 불러오기.
		try {
			
			MemberBean2 bean = member_DAO.member_read(id);
		
			// System.out.println(bean.getReview_num());
			
			// 어떤 형태로 데이터를 받는지 정의해줘야함.
			// json 받아라
			response.setContentType("text/json; charset=utf-8");
			
			// 응답 결과를 출력할 스트림 생성
			PrintWriter pw = response.getWriter();
			//pw.print(bean.getReview_content());
			
			/*
			 * 
			 {
      		"user_id" : <%= rs.getInt("board_idx") %>,
      		"user_pw" : "<%= rs.getString("board_subject")%>",
      		"user_name" : "<%= rs.getString("board_content")%>",
      		"user_addr" : <%= rs.getInt("board_show") %>,
      		"user_phnum" : "<%= rs.getString("user_id")%>"
      		"user_email" : 
      		"user_grade" : 
      		"user_points" : 
      		"user_regdate" :
      		}
			 */
			System.out.println(bean.getUser_id());
			
			//JSON 객체 생성
			JSONObject obj = new JSONObject();
			
			//객체에 데이터를 넣어준다.
			
			obj.put("user_id", bean.getUser_id());
			obj.put("user_pw", bean.getUser_pw());
			obj.put("user_name", bean.getUser_name());
			obj.put("user_addr", bean.getUser_addr());
			obj.put("user_phnum", bean.getUser_phnum());
			obj.put("user_email", bean.getUser_email());
			obj.put("user_grade", bean.getUser_grade());
			obj.put("user_points", bean.getUser_points());
			obj.put("user_regdate", bean.getUser_regdate().toString());
			
			
			System.out.println(obj.toJSONString());
			pw.print(obj.toJSONString());
			
		
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
