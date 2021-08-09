package auto.model;

import java.text.SimpleDateFormat;

public class OutgoingDTO {
private int product_num;
private String product_name;
private double outgoing_qntty;
private String outgoing_date;

SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

public OutgoingDTO(int product_num, String product_name, double outgoing_qntty, String outgoing_date) {
	
	this.product_num = product_num;
	this.product_name = product_name;
	this.outgoing_qntty = outgoing_qntty;
	this.outgoing_date = outgoing_date;
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
public double getOutgoing_qntty() {
	return outgoing_qntty;
}
public void setOutgoing_qntty(double outgoing_qntty) {
	this.outgoing_qntty = outgoing_qntty;
}
public String getOutgoing_date() {
	return outgoing_date;
}
public void setOutgoing_date(String outgoing_date) {
	this.outgoing_date = outgoing_date;
}


	
}
