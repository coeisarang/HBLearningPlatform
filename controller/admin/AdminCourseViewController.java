package net.hb.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CourseDAO;
import net.hb.dao.LessonDAO;
import net.hb.dto.CourseDTO;
import net.hb.dto.LessonDTO;
@WebServlet("/admin/course/view")
public class AdminCourseViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		LessonDAO dao = new LessonDAO();
		List<LessonDTO> list = dao.getLesson(courseIdx);
		dao.close();
		
		CourseDAO dao2 = new CourseDAO();
		CourseDTO dto = dao2.view(courseIdx);
		dao2.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/admin/courseview.jsp").forward(req, res);
	} 

}
