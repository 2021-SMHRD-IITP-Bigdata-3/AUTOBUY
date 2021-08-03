package auto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auto.model.OrderDetailDAO;

@WebServlet("/ReceiptServiceCon")
public class ReceiptServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String order_num = request.getParameter("order_num");
		
		
		System.out.println("order_num : " + order_num);
		System.out.println("product_num : " + product_num);
		
		
		OrderDetailDAO dao = new OrderDetailDAO();
		
		int cnt = dao.updateOneRecepit(order_num, product_num);
		
		if(cnt>0) {
			System.out.println("개별 수령확인 완료 성공");
		}else {
			System.out.println("개별 수령확인 실패");
		}
		
		
		
		
		
	}

}
