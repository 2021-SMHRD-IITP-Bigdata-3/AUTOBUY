package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.MemberDTO;
import auto.model.OrderDAO;
import auto.model.ProductDAO;
import auto.model.ProductDTO;
@WebServlet("/CartServiceCon")
public class CartServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println("장바구니에 담을 품목 : " + product_num);
		
		ProductDAO product_dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = product_dao.showProduct();
		
		int num = product_num - 101;
		String customer_id = info.getCustomer_id();
		String product_name = product_list.get(num).getProduct_name();
		String supplier_name = product_list.get(num).getSupplier_name();
		int price = product_list.get(num).getProduct_price();
		
		OrderDAO dao = new OrderDAO();
		
		int cnt = dao.insertCart(customer_id, product_num, product_name, supplier_name, price);
		
		if(cnt>0) {
			System.out.println("장바구니 담기 성공");
		}
		
		response.sendRedirect("Product_reg.jsp");
		
	}

}
