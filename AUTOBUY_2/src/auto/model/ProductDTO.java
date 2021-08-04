package auto.model;


public class ProductDTO {
	
	private int product_num;
	private String product_name;
	private String supplier_name;
	private int product_price;
	private int product_qntty;
	private String product_pic;
	
	
	public ProductDTO(int product_num, String product_name, String supplier_name, int product_price, int product_qntty,
			String product_pic) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.supplier_name = supplier_name;
		this.product_price = product_price;
		this.product_qntty = product_qntty;
		this.product_pic = product_pic;
	}



	public ProductDTO(String product_name, String supplier_name) {
		super();
		this.product_name = product_name;
		this.supplier_name = supplier_name;
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


	public double getProduct_qntty() {
		return product_qntty;
	}


	public void setProduct_qntty(int product_qntty) {
		this.product_qntty = product_qntty;
	}



	public String getProduct_pic() {
		return product_pic;
	}



	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}
	
	

	
	
	
	

	
	

}
