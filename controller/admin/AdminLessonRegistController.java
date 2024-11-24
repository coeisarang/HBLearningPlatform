package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.LessonDAO;

@WebServlet("/admin/lesson/regist")
public class AdminLessonRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.getRequestDispatcher("/admin/lessonregist.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int courseIdx = Integer.parseInt(req.getParameter("courseIdx"));
		int lessonOrder = Integer.parseInt(req.getParameter("lessonOrder"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String videoPath = req.getParameter("videoPath");
		
		LessonDAO dao = new LessonDAO();
		int result = dao.lessonRegist(courseIdx, lessonOrder, title, content, videoPath);
		dao.close();
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의 등록이 완료되었습니다.');location.href='/admin/course/view?idx="+courseIdx+"'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의 등록을 실패했습니다.');history.back();</script>");
		}
		
	}

}
