package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.webkit.ContextMenu.ShowContext;

import auto.model.MemberDTO;
import auto.model.OrderDAO;
import auto.model.OrderDTO;
import auto.model.OrderDetailDAO;
import auto.model.OrderDetailDTO;

@WebServlet("/ForwardServiceCon")
public class ForwardServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		
		HttpSession session = request.getSession();  
		ArrayList<OrderDetailDTO> dto = (ArrayList<OrderDetailDTO>)session.getAttribute("dto");
		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
				
		
		String order_num = ""; 
		for(int i=0; i<dto.size();i++){ 									
				order_num = dto.get(i).getOrder_num(); 
			}
		
		System.out.println("order_num : " + order_num);
		System.out.println("product_num : " + product_num);
		
		
		OrderDetailDAO dao = new OrderDetailDAO();
		
		int cnt = dao.updateOneForward(order_num, product_num);
		
		String supplier_name = info.getStore_name();
				
		ArrayList<OrderDetailDTO> arr = dao.showOrderDetail_s(order_num, supplier_name);
		
		
		if(cnt>0) {
			
			session.setAttribute("dto", arr);
			
			
			System.out.println("개별 출고 성공");
			
		}else {
			System.out.println("개별 출고 실패");
		}
		response.sendRedirect("Order_details.jsp");
		
		
		
		
		
	}

}
