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
		
		System.out.println("������ ��ǰ ���� ��ȣ : " + stock_num);
		
		StockDAO stock_dao = new StockDAO();
		int cnt = stock_dao.deleteOneStock(stock_num);
		
		if(cnt>0) {
			System.out.println(stock_num + "�� ��ǰ ���� ���� ����");
		}else {
			System.out.println("���� ��ǰ ���� ����");
		}
		response.sendRedirect("StockAdd.jsp");
		
		
		
		
		
	}

}
