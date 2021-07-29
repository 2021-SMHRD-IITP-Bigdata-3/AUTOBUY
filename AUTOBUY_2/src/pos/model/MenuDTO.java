package pos.model;

public class MenuDTO {
	private int menu_num;
	private String menu_name;
	private int price;
	public MenuDTO(int menu_num, String menu_name, int price) {
		
		this.menu_num = menu_num;
		this.menu_name = menu_name;
		this.price = price;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
