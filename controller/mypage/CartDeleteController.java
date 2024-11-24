package net.hb.controller.mypage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CartDAO;

import java.io.IOException;

/**
 * Servlet implementation class CartDeleteController
 */
@WebServlet("/mypage/cart/delete")
public class CartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getParameter("idx") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('삭제할 강의를 선택해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		CartDAO dao = new CartDAO();
		int result = dao.delete(request.getSession().getAttribute("sessionMemberId").toString(), idx);
		dao.close();
		
		if(result >= 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('삭제 성공');location.href='/mypage/cart';</script>");
		}
		else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('삭제 실패');history.back();</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
