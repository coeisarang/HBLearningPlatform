package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CourseDAO;
import net.hb.dto.CourseDTO;

@WebServlet("/admin/course/modify")
public class AdminCourseModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		CourseDAO dao = new CourseDAO();
		CourseDTO dto = dao.view(courseIdx);
		
		req.setAttribute("item", dto);
		req.getRequestDispatcher("/admin/coursemodify.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		String title = req.getParameter("title");
		String teacherId = req.getParameter("teacherId");
		int price = Integer.parseInt(req.getParameter("price"));
		String detail = req.getParameter("detail");
		String school = req.getParameter("school");
		String grade = req.getParameter("grade");
		String subject = req.getParameter("subject");
		
		CourseDAO dao = new CourseDAO();
		int result = dao.courseModify(courseIdx, title, teacherId, price, detail, school, grade, subject);
		dao.close();
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강좌 수정이 완료되었습니다.');location.href='/admin/course'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강좌 수정에 실패했습니다');history.back();</script>");
		}
	}

}
