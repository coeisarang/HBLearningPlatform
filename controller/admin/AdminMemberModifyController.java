package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.MemberDAO;
import net.hb.dto.MemberDTO;

@WebServlet("/admin/member/modify")
public class AdminMemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memberId = req.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.view(memberId);
		dao.close();
		
		req.setAttribute("item", dto);
		req.getRequestDispatcher("/admin/memberview.jsp").forward(req, res);
	}	


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memberId = req.getParameter("memberId"); //필수
	    String pwd = req.getParameter("pwd"); //필수
	    String name = req.getParameter("name"); //필수
	    String birthday = req.getParameter("birthday");
	    String gender = req.getParameter("gender");
	    String phone = req.getParameter("phone");
	    String email = req.getParameter("email");
	    String school = req.getParameter("school");
	    int grade = Integer.parseInt(req.getParameter("grade"));
	    
	    MemberDAO dao = new MemberDAO();
	    int result = dao.modifyAdmin(memberId, pwd, name, birthday, gender, phone, email, school, grade);
	    
	    if(result > 0) {
	    	res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('수정이 완료되었습니다.');location.href='/admin/member';</script>");
	    } else {
	    	res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('회원정보 수정에 실패했습니다');history.back();</script>");
	    }
	    
	    
	    
	}

}
