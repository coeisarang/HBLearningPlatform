package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.MemberDAO;

@WebServlet("/admin/member/delete")
public class AdminMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memberId = req.getParameter("id");
		MemberDAO dao = new MemberDAO();
		int result = dao.delete(memberId);
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('삭제 성공');location.href='/admin/member';</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('삭제 실패, 다시 시도해주세요');history.back();</script>");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
