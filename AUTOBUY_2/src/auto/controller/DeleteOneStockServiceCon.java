package auto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auto.model.StockDAO;

@WebServlet("/DeleteOneStockServiceCon")
public class DeleteOneStockServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stock_num = Integer.parseInt(request.getParameter("stock_num"));
		
		System.out.println("삭제할 제품 고유 번호 : " + stock_num);
		
		StockDAO stock_dao = new StockDAO();
		int cnt = stock_dao.deleteOneStock(stock_num);
		
		if(cnt>0) {
			System.out.println(stock_num + "번 제품 개별 삭제 성공");
		}else {
			System.out.println("개별 제품 삭제 실패");
		}
		response.sendRedirect("StockAdd.jsp");
		
		
		
		
		
	}

}
