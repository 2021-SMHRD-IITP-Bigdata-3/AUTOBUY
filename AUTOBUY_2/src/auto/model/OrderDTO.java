package auto.model;

public class OrderDTO {
	
	private String order_num_s;
	private int order_num;
	private String customer_id;
	private String customer_store_name;	
	private String customer_tel;
	private String customer_add;
	private int order_amount;
	private String order_date;
	
	
	
	
	
	public OrderDTO(String order_num_s, int order_amount) {
	
		this.order_num_s = order_num_s;
		this.order_amount = order_amount;
	}


	public OrderDTO(int order_num, String customer_id, String customer_store_name, String customer_tel,
			String customer_add, int order_amount, String order_date) {
		this.order_num = order_num;
		this.customer_id = customer_id;
		this.customer_store_name = customer_store_name;
		this.customer_tel = customer_tel;
		this.customer_add = customer_add;
		this.order_amount = order_amount;
		this.order_date = order_date;
	}

	
	public OrderDTO(String order_num_s, String customer_id, String customer_store_name, String customer_tel,
			String customer_add, int order_amount, String order_date) {
		super();
		this.order_num_s = order_num_s;
		this.customer_id = customer_id;
		this.customer_store_name = customer_store_name;
		this.customer_tel = customer_tel;
		this.customer_add = customer_add;
		this.order_amount = order_amount;
		this.order_date = order_date;
	}

	
	

	public String getOrder_num_s() {
		return order_num_s;
	}


	public void setOrder_num_s(String order_num_s) {
		this.order_num_s = order_num_s;
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
	
	

	

	
	

	
	
	
	
	
}
