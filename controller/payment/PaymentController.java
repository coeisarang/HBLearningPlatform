package net.hb.controller.payment;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.CartDAO;
import net.hb.dao.CourseDAO;
import net.hb.dto.CourseDTO;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if(req.getParameter("idx")==null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		CourseDAO dao = new CourseDAO();
		List<CourseDTO> cList = dao.getCourseList(idx);
		dao.close();
		req.setAttribute("cList", cList);
		req.getRequestDispatcher("/payment/payment.jsp").forward(req, res);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		String[] idx = req.getParameterValues("idx");
		
		if(idx == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		CourseDAO dao = new CourseDAO();
		List<CourseDTO> cList = dao.getCourseList(idx);
		dao.close();
		
		
		req.setAttribute("cList", cList);
		req.getRequestDispatcher("/payment/payment.jsp").forward(req, res);
	}

}
