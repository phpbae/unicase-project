package bean;

public class odermangebean {
	private int order_idx; //주문인덱스
	private int order_real_pricae; //상품실제가격
	private String goods_num; //상품번호 
	private int order_num;//주문번호
	private String user_id; //주문자 아이디
	
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getOrder_real_pricae() {
		return order_real_pricae;
	}
	public void setOrder_real_pricae(int order_real_pricae) {
		this.order_real_pricae = order_real_pricae;
	}
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	

}
