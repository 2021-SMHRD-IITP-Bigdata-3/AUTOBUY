package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.AutomaticSuggestDAO;
import auto.model.AutomaticSuggestDTO;
import auto.model.MemberDTO;
import auto.model.OrderDAO;
import auto.model.OrderDTO;
@WebServlet("/SuggestOrderServiceCon")
public class SuggestOrderServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String[] qntty =   request.getParameterValues("stock_qntty");
	
		
		
		int order_num = 0;
		String customer_id = info.getCustomer_id();
		String tel = info.getTel();
		String address = info.getAddress();
		String store_name = info.getStore_name();
		int cnt = 0;
		int cnt1 = 0;
		int amount = 0;
		
		
		OrderDAO dao = new OrderDAO();
		AutomaticSuggestDAO suggest_dao = new AutomaticSuggestDAO();
		ArrayList<AutomaticSuggestDTO> order_list = suggest_dao.showSuggest(customer_id);
		ArrayList<Integer> list = dao.makeOrderNum();
		
		for(int i=1; i<order_list.size(); i++) {
			amount +=order_list.get(i).getProduct_price()*Integer.parseInt(qntty[i]);
		}
		
		
		System.out.println("총액 : " + amount);
		
		
		if(list.size()==0) {
			order_num = 10001;
			dao.addOrderNum(order_num);
		}else {
			order_num = list.get(list.size()-1)+1;
			dao.addOrderNum(order_num);
		}
		
		cnt = dao.insertSuggestOrder(order_num, customer_id, store_name , tel, address, amount);
		cnt1 = dao.insertSuggestDetailOrder(order_num, order_list, qntty);
		
		if(cnt>0 && cnt1>0) {
			System.out.println("발주성공");
		}else {
			System.out.println("발주실패");
		}
		
		suggest_dao.deleteSuggestTable(customer_id);
		
		
		response.sendRedirect("Closing_end.jsp");
	}
	
		

}
