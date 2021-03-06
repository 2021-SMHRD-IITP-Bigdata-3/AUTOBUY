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
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		System.out.println("id : " +info.getCustomer_id());
		
		StockDAO dao = new StockDAO();
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = dao.showStock(info.getCustomer_id());
		
		
		int cnt = 0;
		
		for(int i=0; i<stock_list.size(); i++) {
			if(stock_list.get(i).getCustomer_id().equals(info.getCustomer_id())) {
				int stock_qntty = Integer.parseInt(list[i]);
				int product_num = stock_list.get(i).getProduct_num();
				cnt = dao.registQntty(info.getCustomer_id(), product_num, stock_qntty);
				System.out.printf("%d번 제품이 %d개 등록 되었습니다\n",product_num,stock_qntty);
			}
			
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
