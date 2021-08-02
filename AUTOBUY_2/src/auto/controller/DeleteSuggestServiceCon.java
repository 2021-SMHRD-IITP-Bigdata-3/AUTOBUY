package auto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.AutomaticSuggestDAO;
import auto.model.MemberDTO;
import auto.model.StockDAO;
@WebServlet("/DeleteSuggestServiceCon")
public class DeleteSuggestServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		System.out.println("id : " +info.getCustomer_id());
		
		int stock_num = Integer.parseInt(request.getParameter("stock_num"));
		
		System.out.println("������ ��ǰ ���� ��ȣ : " + stock_num);
		
		AutomaticSuggestDAO dao = new AutomaticSuggestDAO();
		int cnt = dao.deleteSuggest(info.getCustomer_id(), stock_num);
		
		if(cnt>0) {
			System.out.println(stock_num + "�� ��ǰ ���� ���� ����");
		}else {
			System.out.println("���� ��ǰ ���� ����");
		}
		response.sendRedirect("Closing.jsp");
	}

}
