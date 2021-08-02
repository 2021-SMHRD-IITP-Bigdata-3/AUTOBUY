package auto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.MemberDTO;
@WebServlet("/RegistOrderQnttyServiceCon")
public class RegistOrderQnttyServiceCon extends HttpServlet {
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			HttpSession session = request.getSession();
			MemberDTO info = (MemberDTO)session.getAttribute("info");
			System.out.println("id : " +info.getCustomer_id());
		
	}

}
