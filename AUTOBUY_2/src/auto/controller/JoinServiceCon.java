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

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		System.out.println("nickname : " + nickname);
		
		MemberDTO dto = new MemberDTO(id, pw, nickname);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);
		
		String moveURL = "";
		
		if(cnt>0) {
			System.out.println("회원가입 성공");
			moveURL = "Login.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}else {
			System.out.println("회원가입 실패");
			moveURL = "Join.jsp";
		}
		response.sendRedirect(moveURL);
		
		
	}

}
