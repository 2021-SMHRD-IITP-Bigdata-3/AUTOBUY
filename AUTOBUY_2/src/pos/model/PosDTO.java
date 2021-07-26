package pos.model;

public class PosDTO {

	private String menu_seq;
	private String menu_name;
	private String menu_price;
	
	public PosDTO(String menu_seq, String menu_name, String menu_price) {
		super();
		this.menu_seq = menu_seq;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
	}

	public String getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(String menu_seq) {
		this.menu_seq = menu_seq;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	
	
	
	
}
