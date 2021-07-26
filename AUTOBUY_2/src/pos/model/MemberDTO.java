package pos.model;

public class MemberDTO {
	private String customer_id;
	private String customer_pw;
	private String nickName;
	private String store_name;
	private String customer_regist_number;
	private String address;
	private String ceo;
	private String tel;
	private String email;
	private String payment;
	
	public MemberDTO(String customer_id, String customer_pw, String nickName, String store_name,
			String customer_regist_number, String address, String ceo, String tel, String email, String payment) {
		super();
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.nickName = nickName;
		this.store_name = store_name;
		this.customer_regist_number = customer_regist_number;
		this.address = address;
		this.ceo = ceo;
		this.tel = tel;
		this.email = email;
		this.payment = payment;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_pw() {
		return customer_pw;
	}

	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getCustomer_regist_number() {
		return customer_regist_number;
	}

	public void setCustomer_regist_number(String customer_regist_number) {
		this.customer_regist_number = customer_regist_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
}
