package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.AutomaticSuggestDAO;
import auto.model.AutomaticSuggestDTO;
import auto.model.MemberDTO;
import auto.model.StockDTO;
import auto.model.StockManageDAO;
@WebServlet("/StockManageServiceCon")
public class StockManageServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		StockManageDAO dao = new StockManageDAO();
		
		int cnt = dao.updateStock(info.getCustomer_id());
		
		AutomaticSuggestDAO suggest_dao = new AutomaticSuggestDAO();
		ArrayList<AutomaticSuggestDTO> suggest_list = suggest_dao.showAutoOrderInfo(info.getCustomer_id());
		

		int insertOutgoing = dao.insertOutgoing(info.getCustomer_id());
		
		if(insertOutgoing>0) {
			System.out.println("출고성공");
		}
		


		
		int min = 0;
		int max = 0;
		int now = 0;
		int num = 0;
		int price = 0;
		String name = "";
		String supplier = "";
		String product_pic="";
		
		int cnt1 = 0;
		

	
		for(int i=0; i<suggest_list.size();i++){
			now = suggest_list.get(i).getStock_qntty();
			min = suggest_list.get(i).getMinimum_qntty();
			max = suggest_list.get(i).getStandard_qntty();
			supplier = suggest_list.get(i).getSupplier_name();
			name = suggest_list.get(i).getProduct_name();
			num = suggest_list.get(i).getProduct_num();
			price = suggest_list.get(i).getProduct_price();
			product_pic=suggest_list.get(i).getProduct_pic();
			int necessary_qntty = max-now;
			
			
			System.out.println("재고명 : " + name);
			System.out.println("기초재고 : " + max);
			System.out.println("최소재고 : " + min);
			System.out.println("현재재고 : " + now);
			System.out.println("필요수량 : " + necessary_qntty);
			if(now<=min){
				cnt1 = suggest_dao.registOrder(info.getCustomer_id(), num, name, supplier, price, necessary_qntty,product_pic);
			}
		}
		
		if(cnt>0) {
			System.out.println("마감성공");
			
			response.sendRedirect("Closing.jsp");
		}else {
			System.out.println("실패");
			
			response.sendRedirect("Main.jsp");
		}
		
		if(cnt1>0) {
			System.out.println("발주제안성공");
		}else {
			System.out.println("발주제안실패");
		}
		
	}

}
