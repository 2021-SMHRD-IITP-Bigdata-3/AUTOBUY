package auto.model;

public class MaterialInfoDTO {
	private int menu_num;
	private int product_num;
	private double necessary_qntty;
	
	public MaterialInfoDTO(int menu_num, int product_num, double necessary_qntty) {
		
		this.menu_num = menu_num;
		this.product_num = product_num;
		this.necessary_qntty = necessary_qntty;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public double getNecessary_qntty() {
		return necessary_qntty;
	}

	public void setNecessary_qntty(double necessary_qntty) {
		this.necessary_qntty = necessary_qntty;
	}
	
	
	
}
