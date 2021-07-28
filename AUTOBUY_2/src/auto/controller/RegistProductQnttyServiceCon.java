package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auto.model.ProductDAO;
import auto.model.ProductDTO;
import auto.model.StockDAO;
import auto.model.StockDTO;
@WebServlet("/RegistProductQnttyServiceCon")
public class RegistProductQnttyServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] list = request.getParameterValues("stock_qntty");
		
		for(int i=0; i<list.length; i++) {
			System.out.println(list[i]);
		}
		
		StockDAO dao = new StockDAO();
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = dao.showStock();
		
		System.out.println(stock_list.get(0).getProduct_num());
		
		int cnt = 0;
		
		for(int i=0; i<stock_list.size(); i++) {
			int stock_qntty = Integer.parseInt(list[i]);
			int product_num = stock_list.get(i).getProduct_num();
			cnt = dao.registQntty(product_num, stock_qntty);
			
		}
		
		String moveURL = "";
		if(cnt>0) {
			moveURL = "Main.jsp";
		}else {
			moveURL = "StockAdd.jsp";
		}
		response.sendRedirect(moveURL);
	}

}
