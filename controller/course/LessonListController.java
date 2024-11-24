package net.hb.controller.course;

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

@WebServlet("/course/lesson")
public class LessonListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		LessonDAO dao = new LessonDAO();
		List<LessonDTO> list = dao.getLesson(courseIdx);
		dao.close();
		
		CourseDAO cDao = new CourseDAO();
		CourseDTO courseInfo = cDao.view(courseIdx);
		cDao.close();
		System.out.println(courseInfo.getTitle());
		req.setAttribute("courseInfo", courseInfo);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/course/lessonList.jsp").forward(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

}
