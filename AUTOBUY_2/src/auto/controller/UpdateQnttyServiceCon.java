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
import auto.model.OrderDTO;
import auto.model.ProductDAO;
import auto.model.ProductDTO;
import auto.model.StockDAO;
import auto.model.StockDTO;

@WebServlet("/UpdateQnttyServiceCon")
public class UpdateQnttyServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		StockDAO dao = new StockDAO();
		ArrayList<StockDTO> dto = dao.showStock(info.getCustomer_id());
		
		ProductDAO product_dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		String[] qntty_list = request.getParameterValues("order_qntty");
		String[] num_list = request.getParameterValues("product_num");
		String[] redate_list = request.getParameterValues("receipt_date");
		

	
		for(int i=0; i<qntty_list.length; i++) {
			System.out.println(qntty_list[i]);
			System.out.println(num_list[i]);
		}
		
		int cnt = 0;
		int product_num = 0;
		String customer_id = info.getCustomer_id();
		
		
		for(int i=0; i<qntty_list.length; i++) {
			if(redate_list[i]!= null) {						
				if(dto.size()==0 || Integer.parseInt(num_list[i])!=dto.get(i).getProduct_num()) {
					int order_qntty = Integer.parseInt(qntty_list[i]);
					product_num = Integer.parseInt(num_list[i]);
					int num = product_num - 101;
					String product_name = product_list.get(num).getProduct_name();
					String supplier_name = product_list.get(num).getSupplier_name();
					int product_price = product_list.get(num).getProduct_price();
					String product_pic = product_list.get(num).getProduct_pic();
					
					cnt = dao.AddProduct(customer_id, product_num, product_name, supplier_name, product_price, order_qntty, product_pic);
					
					System.out.printf("%d번 제품이 새롭게 %d개 입고되었습니다.", product_num, order_qntty);
					
					
					
				}else if(Integer.parseInt(num_list[i])==dto.get(i).getProduct_num()){
					
					int order_qntty = Integer.parseInt(qntty_list[i]);
					product_num = Integer.parseInt(num_list[i]);
					cnt = dao.AddQntty(customer_id, product_num, order_qntty);
					
					System.out.printf("%d번 제품이 기존 %d개에서 %d개 추가 입고되어 재고수량 총 %d개 되었습니다.", product_num, dto.get(i).getStock_qntty(), order_qntty, Integer.parseInt(qntty_list[i])+dto.get(i).getStock_qntty());
										
				}
				
				if(cnt>0) {
					System.out.println(product_num + "번 제품 입고 성공");
				}else {
					System.out.println("개별 제품 입고 실패");
				}
				
			}							
		}
				

		
			response.sendRedirect("Incoming.jsp");
		
				
	}

}
