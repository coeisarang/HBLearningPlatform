package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.LessonDAO;

@WebServlet("/admin/lesson/delete")
public class AdminLessonDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx")); // 이건 강의 인덱스, 고유함
		int courseIdx = Integer.parseInt(req.getParameter("courseIdx"));
		LessonDAO dao = new LessonDAO();
		int result = dao.lessonDelete(idx);
		dao.close();
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의 삭제가 완료되었습니다.');location.href='/admin/course/view?idx="+courseIdx+"'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의 삭제에 실패했습니다.');history.back();</script>");
		}
	}

}
