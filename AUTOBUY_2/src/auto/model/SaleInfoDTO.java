package auto.model;

public class SaleInfoDTO {
	private int menu_num;
	private String menu_name;
	private int sold_qntty;
	private String sold_date;
	
	public SaleInfoDTO(int menu_num, String menu_name, int sold_qntty, String sold_date) {
		super();
		this.menu_num = menu_num;
		this.menu_name = menu_name;
		this.sold_qntty = sold_qntty;
		this.sold_date = sold_date;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getSold_qntty() {
		return sold_qntty;
	}

	public void setSold_qntty(int sold_qntty) {
		this.sold_qntty = sold_qntty;
	}

	public String getSold_date() {
		return sold_date;
	}

	public void setSold_date(String sold_date) {
		this.sold_date = sold_date;
	}
	
	
}
