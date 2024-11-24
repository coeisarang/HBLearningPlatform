package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.TeacherDAO;

@WebServlet("/admin/teacher/modify")
public class AdminTeacherModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=utf-8");
		res.getWriter().append("<script>alert('허용되지 않은 접근입니다.');history.back();</script>");
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
				
		String teacherId = req.getParameter("teacherId");
		String name = req.getParameter("name");
		String subject = req.getParameter("subject");
		String description = req.getParameter("description");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		TeacherDAO dao = new TeacherDAO();
		int result =dao.teacherModify(teacherId, name, subject, description, email, phone);
		dao.close();
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('선생님 정보 수정이 완료되었습니다.');location.href='/admin/teacher'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('선생님 정보 수정에 실패했습니다');history.back();</script>");
		}
	}

}
