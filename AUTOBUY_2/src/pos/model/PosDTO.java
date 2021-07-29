package pos.model;

public class PosDTO {

	private int menu_num;
	private String menu_name;
	private int menu_price;
	private int sold_qntty;
	private String sold_date;
	
	public PosDTO(int menu_num, String menu_name, int menu_price) {
		super();
		this.menu_num = menu_num;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
	}
	

	public PosDTO(int menu_num, String menu_name, int sold_qntty, String sold_date) {
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

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	
	
	
	
}
