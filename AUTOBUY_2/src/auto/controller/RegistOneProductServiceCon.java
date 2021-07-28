package auto.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auto.model.ProductDAO;
import auto.model.ProductDTO;

@WebServlet("/RegistOneProductServiceCon")
public class RegistOneProductServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		ProductDAO product_dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		int num = product_num - 101;
		
		String product_name = product_list.get(num).getProduct_name();
		String supplier_name = product_list.get(num).getSupplier_name();

		
		System.out.println("등록할 제품 고유 번호 : " + product_num);
		
		int cnt = product_dao.registOneProduct(product_num, product_name, supplier_name);
		
		
		if(cnt>0) {
			System.out.println(product_num + "번 제품 등록 성공");
		}else {
			System.out.println("개별 제품 등록 실패");
		}
		response.sendRedirect("StockAdd.jsp");
		
		
		
	}

}
