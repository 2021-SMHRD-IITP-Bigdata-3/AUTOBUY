package auto.model;

public class AutomaticSuggestDTO {
	private int product_num;
	private String product_name;
	private String supplier_name;
	private int stock_qntty;
	private int minimum_qntty;
	private int standard_qntty;
	private int product_price;
	private int suggest_qntty;
	private String product_pic;
	
	

	
	
	




	public AutomaticSuggestDTO(int product_num, String product_name, String supplier_name, int stock_qntty) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.stock_qntty = stock_qntty;
	}




	public AutomaticSuggestDTO(int product_num, String product_name, String supplier_name, int stock_qntty,
			int minimum_qntty, int standard_qntty) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.stock_qntty = stock_qntty;
		this.minimum_qntty = minimum_qntty;
		this.standard_qntty = standard_qntty;
	}




	




	public AutomaticSuggestDTO(int product_num, String product_name, String supplier_name, int stock_qntty,
			int minimum_qntty, int standard_qntty, int product_price, String product_pic) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.stock_qntty = stock_qntty;
		this.minimum_qntty = minimum_qntty;
		this.standard_qntty = standard_qntty;
		this.product_price = product_price;
		this.product_pic = product_pic;
	}




	public AutomaticSuggestDTO(int product_num, String product_name, String supplier_name, int product_price,
			int suggest_qntty, String product_pic) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.product_price = product_price;
		this.suggest_qntty = suggest_qntty;
		this.product_pic = product_pic;
	}




	public int getProduct_price() {
		return product_price;
	}




	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}




	public AutomaticSuggestDTO(int product_num, String product_name, int suggest_qntty) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.suggest_qntty = suggest_qntty;
	}




	public int getSuggest_qntty() {
		return suggest_qntty;
	}




	public void setSuggest_qntty(int order_qntty) {
		this.suggest_qntty = order_qntty;
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
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}




	public String getProduct_pic() {
		return product_pic;
	}




	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}
	
	
	
}
