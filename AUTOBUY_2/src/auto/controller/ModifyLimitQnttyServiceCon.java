package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auto.model.StockDAO;
import auto.model.StockDTO;

@WebServlet("/ModifyLimitQnttyServiceCon")
public class ModifyLimitQnttyServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String[] slist = request.getParameterValues("standard_qntty");
		String[] mlist = request.getParameterValues("minimum_qntty");
				
		StockDAO dao = new StockDAO();
		ArrayList<StockDTO> stand_list = new ArrayList<StockDTO>();
		ArrayList<StockDTO> min_list = new ArrayList<StockDTO>();
		stand_list = dao.showStock();
		min_list = dao.showStock();
		
		int cnt = 0;
		
		for (int i = 0; i < mlist.length; i++) {
			int product_num = stand_list.get(i).getProduct_num();
			int standard_qntty = Integer.parseInt(slist[i]);
			int minimum_qntty = Integer.parseInt(mlist[i]);
			cnt = dao.modifyQntty(product_num, standard_qntty, minimum_qntty);
			System.out.printf("%d번 제품 기준 수량 변경 후 : %d, 기초 수량 변경 후 : %d",product_num, standard_qntty,minimum_qntty);
			System.out.println();
		}

		
		String moveURL = "";
		if(cnt>0) {
			moveURL = "Limit.jsp";
			System.out.println("기존/최소 재고량 수정 성공");
		}else {
			moveURL = "LimitModify.jsp";
			System.out.println("기존/최소 재고량 수정 실패");
		}
		response.sendRedirect(moveURL);

		
	}

}
