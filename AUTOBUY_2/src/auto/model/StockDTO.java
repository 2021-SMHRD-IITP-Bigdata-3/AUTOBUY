package auto.model;

public class StockDTO {
	
	private String customer_id;
	private int product_num;
	private String product_name;
	private String supplier_name;
	private int product_price;
	private int stock_qntty;
	private int minimum_qntty;
	private int standard_qntty;
	private String product_pic;
	private double outgoing_qntty;
	
	
	
	public StockDTO(int product_num, String product_name, double outgoing_qntty) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.outgoing_qntty = outgoing_qntty;
	}

	public StockDTO(String customer_id, int product_num, String product_name, String supplier_name, int product_price,
			int stock_qntty, int minimum_qntty, int standard_qntty, String product_pic) {
		super();
		this.customer_id = customer_id;
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.product_price = product_price;
		this.stock_qntty = stock_qntty;
		this.minimum_qntty = minimum_qntty;
		this.standard_qntty = standard_qntty;
		this.product_pic = product_pic;
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

	public String getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}

	public double getOutgoing_qntty() {
		return outgoing_qntty;
	}

	public void setOutgoing_qntty(double outgoing_qntty) {
		this.outgoing_qntty = outgoing_qntty;
	}
	
	

	
	

}
