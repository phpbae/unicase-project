package bean;

import java.util.Date;

public class ItemBean {
	String goods_num; /* 상품번호 not null */
	int goods_code; /* 상품분류코드 not null */
	String goods_name; /* 상품이름 */
	String goods_img; /* 상품이미지 */
	String goods_brand;/* 브랜드 */
	int goods_price; /* 가격 */
	String goods_info; /* 상세정보 */
	int goods_points; /* 적립금 */
	
	// 상품 생삭에 따른 수량
	int goods_color_num; /* 상품색상번호 not null */
	int godds_amount;// 수량
	Date goods_regdate; // 등록날짜

	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public int getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_img() {
		return goods_img;
	}

	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}

	public String getGoods_brand() {
		return goods_brand;
	}

	public void setGoods_brand(String goods_brand) {
		this.goods_brand = goods_brand;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_info() {
		return goods_info;
	}

	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}

	public int getGoods_points() {
		return goods_points;
	}

	public void setGoods_points(int goods_points) {
		this.goods_points = goods_points;
	}

	public int getGoods_color_num() {
		return goods_color_num;
	}

	public void setGoods_color_num(int goods_color_num) {
		this.goods_color_num = goods_color_num;
	}

	public int getGodds_amount() {
		return godds_amount;
	}

	public void setGodds_amount(int godds_amount) {
		this.godds_amount = godds_amount;
	}

	public Date getGoods_regdate() {
		return goods_regdate;
	}

	public void setGoods_regdate(Date goods_regdate) {
		this.goods_regdate = goods_regdate;
	}

}
