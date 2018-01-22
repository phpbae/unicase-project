package servelet;

import bean.MemberBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("*.credu") // 서블릿 호출명
public class ControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        // 세션 저장 여부를 확인할 변수
        boolean isCheckSession = false;
        String url = request.getRequestURI();

        String serv[] = url.split("/");
        url = serv[serv.length - 1];

        String serv2[] = url.split(";");
        url = serv2[0];
        String site = null;

        if (url.equals("review_write.credu")) {
            site = "review_write";

        } else if (url.equals("review.credu")) {
            site = "review";

        } else if (url.equals("review_read.credu")) {
            site = "review_read";

        } else if (url.equals("review_delete.credu")) {
            site = "review_delete";

        } else if (url.equals("check_exsit_id.credu")) {
            site = "CheckExistIdServlet";
            isCheckSession = false;

        } else if (url.equals("login_pro.credu")) {
            site = "UserLoginServlet";

        } else if (url.equals("add_user_pro.credu")) {
            site = "AddUserServlet";
            isCheckSession = false;

        } else if (url.equals("login_pro.credu")) {
            site = "UserLoginServlet";
            isCheckSession = false;

        } else if (url.equals("board_main.credu")) {
            site = "BoardMainServlet";
            isCheckSession = true;

        } else if (url.equals("board_write_form.credu")) {
            site = "board/board_write_form.jsp";
            isCheckSession = true;

        } else if (url.equals("board_write_pro.credu")) {
            site = "BoardWriteProServlet";
            isCheckSession = true;

        } else if (url.equals("board_read.credu")) {
            site = "BoardReadProServlet";
            isCheckSession = true;

        } else if (url.equals("board_modify_content.credu")) {
            site = "modify_content_proServlet";
            isCheckSession = true;

        } else if (url.equals("qa_modify_content.credu")) {
            site = "qamodifycontentServlet";
            isCheckSession = true;

        } else if (url.equals("rqa_remove_Reply.credu")) {
            site = "removeReplyServlet";
            isCheckSession = true;

        } else if (url.equals("rqa_add_Reply.credu")) {
            site = "add_replyServlet";
            isCheckSession = true;

        } else if (url.equals("logout.credu")) {
            site = "logOutServlet";
            isCheckSession = true;

        } else if (url.equals("administrator.credu")) {
            site = "admin";
            isCheckSession = true;

        } else if (url.equals("board_IDmain.credu")) {
            site = "BoardIDMainServlet";
            isCheckSession = true;

        } else if (url.equals("memberleave.credu")) {
            site = "memberleaveServlet";
            isCheckSession = true;

        } else if (url.equals("Index.credu")) {
            site = "Index";

        } else if (url.equals("modify_user.credu")) {
            site = "modify_user_Servlet";

        } else if (url.equals("leave_user.credu")) {
            site = "leave_userServlet";
            isCheckSession = true;

        } else if (url.equals("admin_delivery.credu")) {
            site = "delivery";
            isCheckSession = true;

        } else if (url.equals("delivery_read.credu")) {
            site = "delivery_read";
            isCheckSession = true;

        } else if (url.equals("delivery_change.credu")) {
            site = "delivery_change";
            isCheckSession = true;

        } else if (url.equals("delivery_delete.credu")) {
            site = "delivery_delete";
            isCheckSession = true;

        } else if (url.equals("customer_delivery.credu")) {
            site = "customer_delivery";
            isCheckSession = true;

        } else if (url.equals("member_delete.credu")) {
            site = "member_delete";
            isCheckSession = true;

        } else if (url.equals("member.credu")) {
            site = "member";
            isCheckSession = true;

        } else if (url.equals("member_read.credu")) {
            site = "member_read";
            isCheckSession = true;

        } else if (url.equals("member_update.credu")) {
            site = "member_update";
            isCheckSession = true;

        } else if (url.equals("member_delete.credu")) {
            site = "member_delete";
            isCheckSession = true;

        } else if (url.equals("member_search.credu")) {
            site = "member_search";
            isCheckSession = true;

        } else if (url.equals("account.credu")) {
            site = "myaccount";
            isCheckSession = true;

        } else if (url.equals("notice.credu")) {
            site = "NoticeMainServlet";
            isCheckSession = true;

        } else if (url.equals("notice_write.credu")) {
            site = "notice_board/notice_write_form.jsp";
            isCheckSession = true;

        } else if (url.equals("write_pro.credu")) {
            site = "NoticeWriteProServlet";
            isCheckSession = true;

        } else if (url.equals("notice_read.credu")) {
            site = "NoticeReadProServlet";
            isCheckSession = true;

        } else if (url.equals("notice_delete.credu")) {
            site = "NoticeDeleteServlet";
            isCheckSession = true;

        } else if (url.equals("notice_modify.credu")) {
            site = "NoticeModify";
            isCheckSession = true;

        } else if (url.equals("modify_pro.credu")) {
            site = "ModifyProServlet";
            isCheckSession = true;

        } else if (url.equals("ItemRegister.credu")) {
            site = "ItemRegisterServlet";
            isCheckSession = true;

        } else if (url.equals("ItemMainBoard.credu")) {
            site = "ItemMainBoardServlet";
            isCheckSession = true;

        } else if (url.equals("item_register.credu")) {
            site = "admin/item/item_register_form.jsp";
            isCheckSession = true;

        } else if (url.equals("Itemboard_read.credu")) {
            site = "ItemBoardReadProServlet";
            isCheckSession = true;

        } else if (url.equals("modify_Item.credu")) {
            site = "modify_Item_proServlet";
            isCheckSession = true;

        } else if (url.equals("delete_Item.credu")) {
            site = "delete_Item_proServlet";
            isCheckSession = true;

        } else if (url.equals("ItemMainBoard2.credu")) {
            site = "ItemMainBoardServlet2";
            isCheckSession = true;

        } else if (url.equals("Notice_mini.credu")) {
            site = "Notice_mini";

        } else if (url.equals("detail_main_item.credu")) {
            site = "detailServlet";

        } else if (url.equals("odermange_main.credu")) {
            site = "ordermangeServlet";

        } else if (url.equals("delivery_memberupdate.credu")) {
            site = "delivery_change";

        } else if (url.equals("buy_goods_form.credu")) {
            site = "BuyGoodsServlet";
            isCheckSession = true;

        } else if (url.equals("pay_goods_form.credu")) {
            site = "PayGoodsProServlet";
            isCheckSession = true;

        } else if (url.equals("add_cart.credu")) {
            site = "AddCartServlet";
            isCheckSession = true;

        } else if (url.equals("view_cart_goods_form.credu")) {
            site = "ViewCartGoodsProServlet";
            isCheckSession = true;

        } else if (url.equals("delete_goods_from_cart.credu")) {
            site = "DeleteGoodsFromCartServlet";
            isCheckSession = true;

        } else if (url.equals("BuyGoodsProServlet.credu")) {
            site = "BuyGoodsProServlet";
            isCheckSession = true;

        } else if (url.equals("view_order_info.credu")) {
            site = "ViewOrderInfoProServlet";
            isCheckSession = true;

        } else if (url.equals("CancelOrderServlet.credu")) {
            site = "CancelOrderServlet";
            isCheckSession = true;

        } else if (url.equals("cart_chk.credu")) {
            site = "cart_chk";
            isCheckSession = true;

        } else if (url.equals("PayResult.credu")) {
            site = "PayGoodsResultServlet";
            isCheckSession = true;

        }

        // 세션에 저장되어 있는 객체를 가져온다.
        if (isCheckSession == true) {
            HttpSession session = request.getSession();
            MemberBean bean = (MemberBean) session.getAttribute("login");

            if (bean == null || bean.isLogin_check() == false) {
                site = "login/index.jsp";
                response.sendRedirect(site);
                return;
            }
        }

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
