package auto.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auto.model.StockManageDAO;
import auto.model.MaterialInfoDTO;
@WebServlet("/StockManageServiceCon")
public class StockManageServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StockManageDAO dao = new StockManageDAO();
		
		System.out.println(dao.showSoldQntty());
		
		System.out.println(dao.showMaterialInfoList().size());
		
		ArrayList<MaterialInfoDTO> list = dao.showMaterialInfoList();
		System.out.println(list.get(4).getNecessary_qntty());
		
		int cnt = dao.updateStock();
		
		if(cnt>0) {
			System.out.println("¼º°ø");
		}
		
		
	}

}
