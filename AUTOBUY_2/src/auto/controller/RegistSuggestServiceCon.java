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
import auto.model.MemberDTO;
import auto.model.ProductDAO;
import auto.model.ProductDTO;
import auto.model.StockDAO;
import auto.model.StockDTO;
@WebServlet("/RegistSuggestServiceCon")
public class RegistSuggestServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
	
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		System.out.println("등록할 제품 번호 :" + product_num);
		
		String customer_id = info.getCustomer_id();
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = dao.showProduct();
		AutomaticSuggestDAO suggest_dao = new AutomaticSuggestDAO();
		StockDAO stock_dao = new StockDAO();
		ArrayList<StockDTO> stock_list = stock_dao.showStock(customer_id);
		
		
		int num = product_num - 101;
		String product_name = product_list.get(num).getProduct_name();
		String supplier_name =  product_list.get(num).getSupplier_name();
		int price = product_list.get(num).getProduct_price();
		
		int cnt = suggest_dao.registSuggest(customer_id, product_num, product_name, supplier_name, price);
		
		if(cnt>0) {
			System.out.println("등록성공");
		}
		
		response.sendRedirect("Closing.jsp");
	}

}
