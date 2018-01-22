package review;

import bean.review_Bean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class review
 */
@WebServlet("/review")
public class review extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public review() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int pagenum = 1;
        if (request.getParameter("Page_num") != null) {
            pagenum = Integer.parseInt(request.getParameter("Page_num"));
        }

        int goods_num = 0;
        if (request.getParameter("goods_num") != null) {
            goods_num = Integer.parseInt(request.getParameter("goods_num"));
        }


        // size 보여줄 페이지당 게시글 개수. 15개당 1page
        int size = 15;

        int tot = 0;
        int cnt = 0;

        try {

            // 총 게시글 개수.
            cnt = review_DAO.review_getPageCount();
            //페이지 번호
            tot = cnt / size;
            if (cnt % size != 0) {
                tot++;
            }


        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        int end = pagenum * size;
        int start = end - size + 1;

        System.out.println(start);
        System.out.println(end);

        // 리뷰게시판 불러오기.
        ArrayList<review_Bean> list = review_DAO.review_get(start, end, goods_num);

        // request 객체에 list를 담아준다.
        request.setAttribute("list", list);

        // request 객체에 총 페이지수를 담아준다.
        request.setAttribute("tot", tot);

        //request 객체에 해당 상품번호를 넣어준다.
        request.setAttribute("goods_num", goods_num);


        // review.jsp로 이동
        String site = "/review_board/review.jsp";

        RequestDispatcher dis = request.getRequestDispatcher(site);
        dis.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
