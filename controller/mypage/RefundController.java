package net.hb.controller.mypage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.AttendDAO;
import net.hb.dao.PaymentDAO;
import net.hb.dto.PaymentDTO;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class RefundController
 */
@WebServlet("/mypage/paymentlist/refund")
public class RefundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		if(request.getParameter("idx") == null) {
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String memberId = request.getSession().getAttribute("sessionMemberId").toString();
		
		int result = -1;
		int courseIdx = 0;
		PaymentDAO dao = new PaymentDAO();
		courseIdx = dao.getCourseIdx(idx);
		if(dao.getStatus(idx).equals("po")) {
			result = dao.refund(idx);
		}
		dao.close();
		
		if(result >= 0) {
			AttendDAO attenddao = new AttendDAO();
			
			attenddao.delete(memberId, courseIdx);
			
			attenddao.close();
			
			response.sendRedirect("/mypage/paymentlist");
			return;
		}
		response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
