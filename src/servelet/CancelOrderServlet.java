package servelet;

import DB.BoxDAO;
import DB.DeliveryDAO;
import DB.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CancelOrderServlet
 */
@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String[] check_box = request.getParameterValues("check_list");
	    String[] box_num = request.getParameterValues("box_num");
	    String[] order_num = request.getParameterValues("order_num");
	    String[] delivery_idx = request.getParameterValues("delivery_idx");
	    
	    System.out.println("aoeuaoeuoeueuue");
	    
		try {
			if(check_box != null){
		    	for(int i=0 ; i < check_box.length ; i++){
		    		BoxDAO.set_order_state(Integer.parseInt(box_num[i]));
					if(OrderDAO.get_order_cnt( Integer.parseInt(delivery_idx[i]) )  == 1 ){
						System.out.println("in coServ ");
						DeliveryDAO.delete_delivery_info( Integer.parseInt(delivery_idx[i]) );
					}
					OrderDAO.delete_order(Integer.parseInt(order_num[i]));
					System.out.println("in coServ1111111 ");
					System.out.println(box_num[i]);
					System.out.println(delivery_idx[i]);
					System.out.println(order_num[i]);
		    	 }
			}else{
	 	    	System.out.println("null입니다.");
	 	    }

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
