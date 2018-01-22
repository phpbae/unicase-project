package bean;

import java.util.Date;

public class DeliveryBean {
	private int delivery_idx;
	private String to_name;
	private String to_addr;
	private String to_phnum;
	////////
	private int order_num;
	private String user_id;
	private String order_user_name;
	private int order_goods_amount;
	private int order_pay_opt;
	private String order_invoice;
	private int order_delivery_opt;
	private int order_delivery_rs;
	private Date order_date;
	
	public int getDelivery_idx() {
		return delivery_idx;
	}
	public void setDelivery_idx(int delivery_idx) {
		this.delivery_idx = delivery_idx;
	}
	public String getTo_name() {
		return to_name;
	}
	public void setTo_name(String to_name) {
		this.to_name = to_name;
	}
	public String getTo_addr() {
		return to_addr;
	}
	public void setTo_addr(String to_addr) {
		this.to_addr = to_addr;
	}
	public String getTo_phnum() {
		return to_phnum;
	}
	public void setTo_phnum(String to_phnum) {
		this.to_phnum = to_phnum;
	}
	/////////////////////////
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
	public String getOrder_user_name() {
		return order_user_name;
	}
	public void setOrder_user_name(String order_user_name) {
		this.order_user_name = order_user_name;
	}
	public int getOrder_goods_amount() {
		return order_goods_amount;
	}
	public void setOrder_goods_amount(int order_goods_amount) {
		this.order_goods_amount = order_goods_amount;
	}
	
	public int getOrder_pay_opt() {
		return order_pay_opt;
	}
	public void setOrder_pay_opt(int order_pay_opt) {
		this.order_pay_opt = order_pay_opt;
	}
	public String getOrder_invoice() {
		return order_invoice;
	}
	public void setOrder_invoice(String order_invoice) {
		this.order_invoice = order_invoice;
	}
	public int getOrder_delivery_opt() {
		return order_delivery_opt;
	}
	public void setOrder_delivery_opt(int order_delivery_opt) {
		this.order_delivery_opt = order_delivery_opt;
	}
	public int getOrder_delivery_rs() {
		return order_delivery_rs;
	}
	public void setOrder_delivery_rs(int order_delivery_rs) {
		this.order_delivery_rs = order_delivery_rs;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
}
