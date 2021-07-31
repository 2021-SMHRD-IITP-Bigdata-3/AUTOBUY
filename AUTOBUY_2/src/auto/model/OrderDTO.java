package auto.model;

public class OrderDTO {
	
	private int order_num;
	private String customer_id;
	private String supplier_id;
	private String customer_store_name;	
	private String customer_tel;
	private String customer_add;
	private int order_amount;
	private String order_date;
	private String receipt_date;
	private String forwarding_date;
	
	
	public OrderDTO(int order_num, String customer_id, String supplier_id, String customer_store_name,
			String customer_tel, String customer_add, int order_amount, String order_date, String receipt_date,
			String forwarding_date) {
		this.order_num = order_num;
		this.customer_id = customer_id;
		this.supplier_id = supplier_id;
		this.customer_store_name = customer_store_name;
		this.customer_tel = customer_tel;
		this.customer_add = customer_add;
		this.order_amount = order_amount;
		this.order_date = order_date;
		this.receipt_date = receipt_date;
		this.forwarding_date = forwarding_date;
	}


	public int getOrder_num() {
		return order_num;
	}


	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}


	public String getCustomer_id() {
		return customer_id;
	}


	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}


	public String getSupplier_id() {
		return supplier_id;
	}


	public void setSupplier_id(String supplier_id) {
		this.supplier_id = supplier_id;
	}


	public String getCustomer_store_name() {
		return customer_store_name;
	}


	public void setCustomer_store_name(String customer_store_name) {
		this.customer_store_name = customer_store_name;
	}


	public String getCustomer_tel() {
		return customer_tel;
	}


	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}


	public String getCustomer_add() {
		return customer_add;
	}


	public void setCustomer_add(String customer_add) {
		this.customer_add = customer_add;
	}


	public int getOrder_amount() {
		return order_amount;
	}


	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}


	public String getOrder_date() {
		return order_date;
	}


	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
	
	

	
	
	
	
	
}
