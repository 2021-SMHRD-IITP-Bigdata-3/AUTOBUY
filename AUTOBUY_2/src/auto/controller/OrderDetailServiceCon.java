package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.MemberDAO;
import auto.model.MemberDTO;
import auto.model.OrderDAO;
import auto.model.OrderDTO;
import auto.model.OrderDetailDAO;
import auto.model.OrderDetailDTO;

@WebServlet("/OrderDetailServiceCon")
public class OrderDetailServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int order_num = Integer.parseInt(request.getParameter("order_num"));
				
		System.out.println("order_num : " + order_num);
		
		OrderDetailDAO dao = new OrderDetailDAO();
		ArrayList<OrderDetailDTO> dto = dao.showOrderDetail(order_num);
		
		OrderDAO order_dao = new OrderDAO();
		ArrayList<OrderDTO> order_dto = order_dao.showOrder();
		
				
		String moveURL = "";
		
		if(dto != null) {
			System.out.println("주문상세 페이지 가져오기 성공");
			HttpSession session = request.getSession();  
			session.setAttribute("dto", dto);
			session.setAttribute("order_dto", order_dto);
			

				moveURL = "Order_details.jsp";	
					
		}else {
			System.out.println("주문상세 페이지 가져오기 실패");
			moveURL = "Main_Sup.jsp";
		}
		response.sendRedirect(moveURL);
		
		
		
		
	}

}
