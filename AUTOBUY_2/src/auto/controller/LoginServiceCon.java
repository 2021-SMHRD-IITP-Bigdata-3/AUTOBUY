package auto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auto.model.MemberDAO;
import auto.model.MemberDTO;

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(id, pw);
				
		
		String moveURL = "";
		
		if(info != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();  
			session.setAttribute("info", info);  
			
			if(info.getCustomer_type().equals("거래처")){
				moveURL = "Main.jsp";	
			}else if(info.getCustomer_type().equals("점포점주")){
				moveURL = "Main_Sup.jsp";	
			}
					
		}else {
			System.out.println("로그인 실패");
			moveURL = "Login.jsp";
		}
		response.sendRedirect(moveURL);
		

		
	}

}
