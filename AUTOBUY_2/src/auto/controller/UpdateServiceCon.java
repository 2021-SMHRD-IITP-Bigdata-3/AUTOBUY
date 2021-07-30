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

@WebServlet("/UpdateServiceCon")
public class UpdateServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		// 수정하고 싶은 값 받아오기
		String pw  = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String store_name = request.getParameter("store_name");
		String sup_num = request.getParameter("sup_num");
		String address = request.getParameter("address");
		String ceo = request.getParameter("ceo");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String payment = request.getParameter("payment");
		
		// 현재 내가 로그인한 이메일 가지고 오기
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getCustomer_id();	
		String customer_type = info.getCustomer_type();
		
		// 로그인정보가 담겨있는 info변수에 수정 할 pw, tel,addr로 덮어씌우기
		info = new MemberDTO(id, pw, nickname, customer_type, store_name, sup_num, address, ceo, tel, email, payment);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(info);
		
		String moveURL="";
		if(cnt>0) {
			System.out.println("회원 정보 수정");
			session.setAttribute("info", info);
			moveURL="Update.jsp";
		}else {
			System.out.println("회원 정보 수정 실패");
			moveURL="Update_change.jsp";
		}
		response.sendRedirect(moveURL);
		
	}

}
