package auto.model;

public class CartDTO {
	private String customer_id;
	private int product_num;
	private String product_name;
	private String supplier_name;
	private int product_price;
	
	public CartDTO(String customer_id, int product_num, String product_name, String supplier_name,
			int product_price) {
		super();
		this.customer_id = customer_id;
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.product_price = product_price;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
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

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
	
	
	

}
