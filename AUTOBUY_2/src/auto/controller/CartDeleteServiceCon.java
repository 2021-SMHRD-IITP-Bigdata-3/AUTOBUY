package auto.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.MemberDTO;
import auto.model.OrderDAO;
@WebServlet("/CartDeleteServiceCon")
public class CartDeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		System.out.println("삭제할 제품 고유 번호 : " + product_num);
		
		OrderDAO dao = new OrderDAO();
		int cnt = dao.deleteCart(info.getCustomer_id(), product_num);
		
		
		response.sendRedirect("Product_reg.jsp");
	}

}
