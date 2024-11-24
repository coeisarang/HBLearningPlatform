package net.hb.controller.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CartDAO;

import java.io.IOException;

/**
 * Servlet implementation class AddCartController
 */
@WebServlet("/course/cart")
public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String msg = "상품을 선택해주세요.";
		if(request.getParameter("idx") != null) {
			int courseIdx = Integer.parseInt(request.getParameter("idx"));
			
			String memberId = request.getSession().getAttribute("sessionMemberId").toString();
			
			CartDAO dao = new CartDAO();
			int result = dao.regist(memberId, courseIdx);
			dao.close();
			
			if(result > 0) {
				msg = "장바구니에 추가";
			}
			else msg="다시 시도해주세요";
		}

		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append("<script>alert('"+msg+"');history.back();</script>");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
