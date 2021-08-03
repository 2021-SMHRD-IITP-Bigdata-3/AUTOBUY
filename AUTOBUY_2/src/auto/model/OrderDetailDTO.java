package auto.model;

public class OrderDetailDTO {
	
	private String order_num;
	private int product_num;	
	private String product_name;
	private int order_qntty;
	private String supplier_name;
	private String receipt_date;
	private String forwarding_date;
	private String product_pic;
	
	public OrderDetailDTO(String order_num, int product_num, String product_name, int order_qntty, String supplier_name,
			String receipt_date, String forwarding_date, String product_pic) {
		super();
		this.order_num = order_num;
		this.product_num = product_num;
		this.product_name = product_name;
		this.order_qntty = order_qntty;
		this.supplier_name = supplier_name;
		this.receipt_date = receipt_date;
		this.forwarding_date = forwarding_date;
		this.product_pic = product_pic;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
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

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public String getReceipt_date() {
		return receipt_date;
	}

	public void setReceipt_date(String receipt_date) {
		this.receipt_date = receipt_date;
	}

	public String getForwarding_date() {
		return forwarding_date;
	}

	public void setForwarding_date(String forwarding_date) {
		this.forwarding_date = forwarding_date;
	}

	public String getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}
	
	

	
	
}
