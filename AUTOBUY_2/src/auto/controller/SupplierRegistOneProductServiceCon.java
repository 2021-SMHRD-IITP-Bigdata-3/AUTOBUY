package auto.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import auto.model.ProductDAO;
import auto.model.ProductDTO;

@WebServlet("/SupplierRegistOneProductServiceCon")
public class SupplierRegistOneProductServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// title, writer. content에 대한 인코딩 방식
		request.setCharacterEncoding("euc-kr");
		
		
		// 1. 이미지 경로
		// getServletContext : 서블릿의 정보
		// getRealPath : 실제 경로
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);

		// 2. 이미지 크기
		// 이미지 크기를 제한 : 이미지 화질이 좋아서 용량이 크니까 서버에 공간을 너무 많이 차지해서 크기 제한
		int maxSize = 5 * 1024 * 1024;

		// 3. 이미지명 인코딩 방식
		String encoding = "euc-kr";

		// MultipartRequest : cos.jar 파일 안에 있는 클래스
		// request 객체, 이미지 저장 경로, 제한할 이미지 크기, 인코딩 방식, 중복 제거
		 
		MultipartRequest multi = null;
		String product_pic;
		int cnt=0;
				
		try {
		
		
		multi = new MultipartRequest(request, savePath, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		String product_name = multi.getParameter("product_name");
		String supplier_name = multi.getParameter("supplier_name");
		int product_price = Integer.parseInt(multi.getParameter("product_price"));
		int product_qntty = Integer.parseInt(multi.getParameter("product_qntty"));
		product_pic = URLEncoder.encode(multi.getFilesystemName("product_pic"), "euc-kr");
		

		System.out.println(product_name);
		System.out.println(supplier_name);
		System.out.println(product_price);
		System.out.println(product_qntty);
		System.out.println(product_pic);
		
		
		
		ProductDTO dto = new ProductDTO(product_name, supplier_name, product_price, product_qntty, product_pic);
		ProductDAO dao = new ProductDAO();
		cnt = dao.upload(dto);
		
		
		} catch (Exception e) {

			e.printStackTrace();
		}

		if (cnt > 0) {
			System.out.println("이미지 업로드 성공");
		} else {
			System.out.println("이미지 업로드 실패");
		}
		response.sendRedirect("Main_Sup.jsp");
	}

}