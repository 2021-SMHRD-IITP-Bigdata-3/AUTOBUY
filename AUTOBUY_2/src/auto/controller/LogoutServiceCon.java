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

@WebServlet("/LogoutServiceCon")
public class LogoutServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		AutomaticSuggestDAO dao = new AutomaticSuggestDAO();
		//dao.deleteSuggestTable(info.getCustomer_id());
		
		session.removeAttribute("info");
		
		response.sendRedirect("Login.jsp");
		
		
		
	}

}
