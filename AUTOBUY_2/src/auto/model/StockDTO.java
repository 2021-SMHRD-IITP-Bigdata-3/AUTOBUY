package auto.model;

public class StockDTO {
	
	private String customer_id;
	private int product_num;
	private String product_name;
	private String supplier_name;
	private int stock_qntty;
	private int minimum_qntty;
	private int standard_qntty;
	
	
	public StockDTO(String customer_id, int product_num, String product_name, String supplier_name, int stock_qntty, int minimum_qntty,
					int standard_qntty) {
		
		this.customer_id = customer_id;
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.stock_qntty = stock_qntty;
		this.minimum_qntty = minimum_qntty;
		this.standard_qntty = standard_qntty;
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


	public int getStock_qntty() {
		return stock_qntty;
	}


	public void setStock_qntty(int stock_qntty) {
		this.stock_qntty = stock_qntty;
	}


	public int getMinimum_qntty() {
		return minimum_qntty;
	}


	public void setMinimum_qntty(int minimum_qntty) {
		this.minimum_qntty = minimum_qntty;
	}


	public int getStandard_qntty() {
		return standard_qntty;
	}


	public void setStandard_qntty(int standard_qntty) {
		this.standard_qntty = standard_qntty;
	}
	
	
	
	

}
