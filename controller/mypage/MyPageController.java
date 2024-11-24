package net.hb.controller.mypage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.AttendDAO;
import net.hb.dao.BoardDAO;
import net.hb.dao.CartDAO;
import net.hb.dao.CourseDAO;
import net.hb.dao.PaymentDAO;
import net.hb.dto.AttendDTO;
import net.hb.dto.BoardDTO;
import net.hb.dto.CourseDTO;
import net.hb.dto.PaymentDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/mypage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String memberId = request.getSession().getAttribute("sessionMemberId").toString();
		
		
		Map<String, Integer> countmap = new HashMap<>();
		
		//나의 주문정보
		PaymentDAO pdao = new PaymentDAO();
		countmap.put("pay", pdao.count(memberId, "po") + pdao.count(memberId, "rx"));
		countmap.put("refund", pdao.count(memberId, "rr") + pdao.count(memberId, "ro"));
		pdao.close();
		
		//나의 문의현황
		BoardDAO qdao = new BoardDAO();
		countmap.put("q", qdao.count(memberId, "03", "N", 0));
		countmap.put("a", qdao.count(memberId, "03", "Y", 0));
		qdao.close();
		
		//나의 강의실
		AttendDAO adao = new AttendDAO();
		countmap.put("c1", adao.count(memberId, "b"));
		countmap.put("c2", adao.count(memberId, "c"));
		adao.close();
		
		CartDAO cdao = new CartDAO();
		countmap.put("cart", cdao.count(memberId));
		cdao.close();
		
		request.setAttribute("countmap", countmap);
		
		request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
