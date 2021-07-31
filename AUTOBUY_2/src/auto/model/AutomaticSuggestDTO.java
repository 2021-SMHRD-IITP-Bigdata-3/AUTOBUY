package auto.model;

public class AutomaticSuggestDTO {
	private int product_num;
	private String product_name;
	private int stock_qntty;
	private int minimum_qntty;
	private int standard_qntty;
	private int suggest_qntty;
	
	
	public AutomaticSuggestDTO(int product_num, String product_name, int stock_qntty, int minimum_qntty, int standard_qntty) {
		this.product_num = product_num;
		this.stock_qntty = stock_qntty;
		this.minimum_qntty = minimum_qntty;
		this.standard_qntty = standard_qntty;
		this.product_name = product_name;
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
	
	
}
