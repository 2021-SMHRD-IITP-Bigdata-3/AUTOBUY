package auto.model;

public class OrderDetailDTO {
	
	private int order_num;
	private int product_num;	
	private String product_name;
	private int order_qntty;
	
	public OrderDetailDTO(int order_num, int product_num, String product_name, int order_qntty) {
		this.order_num = order_num;
		this.product_num = product_num;
		this.product_name = product_name;
		this.order_qntty = order_qntty;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getOrder_qntty() {
		return order_qntty;
	}

	public void setOrder_qntty(int order_qntty) {
		this.order_qntty = order_qntty;
	}
	
	
	
}
