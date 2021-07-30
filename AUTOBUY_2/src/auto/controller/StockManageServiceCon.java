package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.StockManageDAO;
import auto.model.MaterialInfoDTO;
import auto.model.MemberDTO;
@WebServlet("/StockManageServiceCon")
public class StockManageServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		StockManageDAO dao = new StockManageDAO();
		
		int cnt = dao.updateStock(info.getCustomer_id());
		
		if(cnt>0) {
			System.out.println("마감성공");
			
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("실패");
			
			response.sendRedirect("Main.jsp");
		}
		
		
	}

}
