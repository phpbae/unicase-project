package adminitem;

import DB.ItemDAO;
import bean.ItemBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ItemRegisterServlet
 */
@WebServlet("/ItemRegisterServlet")
public class ItemRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemRegisterServlet() {
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
		ServletContext application = request.getServletContext();
		String path = context.getRealPath("/admin/upload");
				// application.getRealPath("/upload");
				// context.getRealPath("/admin/upload");
		
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
		
		//상품정보
		
		
		String goods_num = mr.getParameter("goods_num");/* 상품번호 */
		String goods_code_str = mr.getParameter("goods_code");/* 상품분류코드 */
		int goods_code = Integer.parseInt(goods_code_str);
		String goods_name = mr.getParameter("goods_name");/* 상품이름 */
		String goods_img = mr.getFilesystemName("goods_img");/* 상품이미지 */
		String goods_brand = mr.getParameter("goods_brand");/* 브랜드 */
		String goods_price_str = mr.getParameter("goods_price");/* 가격 */
		int goods_price = Integer.parseInt(goods_price_str);
		String goods_info = mr.getParameter("goods_info");/* 상세정보 */
		String goods_points_str = mr.getParameter("goods_points");/* 적립금 */
		int goods_points = Integer.parseInt(goods_points_str);
		
	
		
		//상품수량및 색상
		
//		goods_color_num NUMBER NOT NULL, /* 색상번호 */
//		goods_num VARCHAR2(30) NOT NULL, /* 상품번호 */
//		goods_color VARCHAR2(5), /* 색상 */
//		goods_amount NUMBER /* 상품수량 */
		

		String goods_amount_red_str = mr.getParameter("goods_amount_red");/*상품수량*/
		String goods_amount_black_str = mr.getParameter("goods_amount_black");/*상품수량*/
		String goods_amount_yellow_str = mr.getParameter("goods_amount_yellow");/*상품수량*/
		String goods_amount_blue_str = mr.getParameter("goods_amount_blue");/*상품수량*/
		int goods_amount_red = Integer.parseInt(goods_amount_red_str);
		int goods_amount_black = Integer.parseInt(goods_amount_black_str);
		int goods_amount_yellow = Integer.parseInt(goods_amount_yellow_str);
		int goods_amount_blue = Integer.parseInt(goods_amount_blue_str);
		int godds_amount[] = {Integer.parseInt(goods_amount_red_str),Integer.parseInt(goods_amount_black_str),Integer.parseInt(goods_amount_yellow_str),Integer.parseInt(goods_amount_blue_str)};
		int cnt = godds_amount.length;
		
		System.out.println(cnt);
		int[] goods_color_num = new int [cnt]; // 색상코드
		for(int i=0; i < cnt; i++){
			goods_color_num[i] = i;
			
		}
		
		
		System.out.println(goods_color_num);
	
		
		
		
		
		// 빈 객체에 데이터를 담는다.
		ItemBean  goodsbean = new ItemBean();
		 goodsbean.setGoods_num(goods_num);
		 goodsbean.setGoods_code(goods_code);
		 goodsbean.setGoods_name(goods_name);
		 goodsbean.setGoods_img(goods_img);
		 goodsbean.setGoods_brand(goods_brand);
		 goodsbean.setGoods_price(goods_price);
		 goodsbean.setGoods_info(goods_info);
		 goodsbean.setGoods_points(goods_points);
		 
		
		 

		 System.out.println("itemregister");

		try{
			ItemDAO.add_item_register(goodsbean);
			
			for(int i=0; i<cnt; i++)
			{
				goodsbean.setGoods_color_num(goods_color_num[i]);
				goodsbean.setGodds_amount(godds_amount[i]);
				ItemDAO.add_item_register2(goodsbean);
				System.out.println("in :"+i);
			}
			// 디비에 저장한다.
		}catch(Exception e){
			e.printStackTrace();
		}
		// 글 읽는 페이지로 이동한다.
		String site = "item_register.credu";
		System.out.println(site);
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
