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

@WebServlet("/OrderDetailServiceCon_Cus")
public class OrderDetailServiceCon_Cus extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String order_num = request.getParameter("order_num");
		
		System.out.println("order_num : " + order_num);
		
		HttpSession session = request.getSession();  
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		OrderDetailDAO dao = new OrderDetailDAO();
		ArrayList<OrderDetailDTO> dto = dao.showOrderDetail(order_num);
		
		OrderDAO order_dao = new OrderDAO();
		ArrayList<OrderDTO> order_dto = order_dao.showOrder();
		

		
		String moveURL = "";
		
		if(dto != null) {
			System.out.println("주문상세 페이지 가져오기 성공");			
			session.setAttribute("dto", dto);

			moveURL = "Incoming_details.jsp";	

												
		}else {
			System.out.println("주문상세 페이지 가져오기 실패");
			
			if(info.getCustomer_type().equals("거래처")) {
				moveURL = "Main_Sup.jsp";
			}else if(info.getCustomer_type().equals("점포점주")) {
				moveURL = "Incoming.jsp";	
			}
			
		}
		response.sendRedirect(moveURL);
		
		
		
		
	}

}
