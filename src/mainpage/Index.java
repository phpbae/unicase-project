package mainpage;

import DB.ItemDAO;
import bean.ItemBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<ItemBean> listItem = null;
        String site = null;
        try {
            request.setCharacterEncoding("utf-8");

            //파라미터 처리.
            // 1 : 데스크탑
            // 2 : 노트북
            // 3 : 오디오
            // 4 : 마우스
            // 5 : 키보드

            String search = null;
            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            }
            if (search == null) {
                int goods_num = 0;
                if (request.getParameter("goods") != null) {
                    goods_num = Integer.parseInt(request.getParameter("goods"));
                }

                if (goods_num == 0) {
                    listItem = ItemDAO.get_main_item_new();
                    site = "main.jsp?goods=" + goods_num;
                } else {
                    listItem = ItemDAO.filter_get_item(goods_num);
                    site = "main.jsp?goods=" + goods_num;
                }
            } else {
                listItem = ItemDAO.search_get_item(search);
                site = "main.jsp?search=" + search;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listitem", listItem);
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
