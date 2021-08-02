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
	
		
		
		OrderDAO dao = new OrderDAO();
		AutomaticSuggestDAO suggest_dao = new AutomaticSuggestDAO();
		ArrayList<AutomaticSuggestDTO> order_list = suggest_dao.showSuggest(customer_id);
		ArrayList<Integer> list = dao.makeOrderNum();
		
		
		
		if(list.size()==0) {
			order_num = 10001;
			dao.addOrderNum(order_num);
		}else {
			order_num = list.get(list.size()-1)+1;
			dao.addOrderNum(order_num);
		}
		
		dao.insertSuggestOrder(order_num, customer_id, store_name , tel, address);
		dao.insertSuggestDetailOrder(order_num, order_list, qntty);
		
		suggest_dao.deleteSuggestTable(customer_id);
		
		
		response.sendRedirect("Closing_end.jsp");
	}
	
		

}
