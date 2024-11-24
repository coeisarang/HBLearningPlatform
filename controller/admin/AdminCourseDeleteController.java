package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CourseDAO;

@WebServlet("/admin/course/delete")
public class AdminCourseDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		
		CourseDAO dao = new CourseDAO();
		int result = dao.deleteCourse(courseIdx);
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강좌 삭제가 완료되었습니다.');location.href='/admin/course'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강좌 삭제에 실패했습니다');history.back();</script>");
		}
		
	}

}
