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
		// title, writer. content�� ���� ���ڵ� ���
		request.setCharacterEncoding("euc-kr");
		
		
		// 1. �̹��� ���
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);

		// 2. �̹��� ũ��
		// �̹��� ũ�⸦ ���� : �̹��� ȭ���� ���Ƽ� �뷮�� ũ�ϱ� ������ ������ �ʹ� ���� �����ؼ� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// 3. �̹����� ���ڵ� ���
		String encoding = "euc-kr";

		// MultipartRequest : cos.jar ���� �ȿ� �ִ� Ŭ����
		// request ��ü, �̹��� ���� ���, ������ �̹��� ũ��, ���ڵ� ���, �ߺ� ����
		 
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
			System.out.println("�̹��� ���ε� ����");
		} else {
			System.out.println("�̹��� ���ε� ����");
		}
		response.sendRedirect("Main_Sup.jsp");
	}

}