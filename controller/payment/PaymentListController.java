package net.hb.controller.payment;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.PaymentDAO;
import net.hb.dto.PaymentDTO;

@WebServlet("/mypage/paymentlist")
public class PaymentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		//[페이징] 쿼리스트링으로 받아오기
		int pageNo = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : 1;
		
		PaymentDAO dao = new PaymentDAO();
		List<PaymentDTO> pList = dao.list(memberId, 10, pageNo);
		dao.close();
		
		//dto에서 받아온 정보 : courseName, teacherName, grade, subject, price, amount, payDate, refundDate, status
		req.setAttribute("pList", pList);
		req.getRequestDispatcher("/mypage/paymentList.jsp").forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
		
	}

}
