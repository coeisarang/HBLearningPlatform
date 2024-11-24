package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.LessonDAO;
import net.hb.dto.LessonDTO;

@WebServlet("/admin/lesson/modify")
public class AdminLessonModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int courseIdx = Integer.parseInt(req.getParameter("courseIdx"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		LessonDAO dao = new LessonDAO();
		LessonDTO dto = dao.lessonView(idx);
		dao.close();
		
		
		req.setAttribute("courseIdx",courseIdx);
		req.setAttribute("idx",idx);
		req.setAttribute("item", dto);
		req.getRequestDispatcher("/admin/lessonmodify.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int idx = Integer.parseInt(req.getParameter("idx")); // 이건 강의 인덱스, 고유함
		int courseIdx = Integer.parseInt(req.getParameter("courseIdx")); //강좌 인덱스. 어거지로 받음
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String videoPath = req.getParameter("videoPath");
		
		LessonDAO dao = new LessonDAO();
		int result = dao.lessonModify(title, content, videoPath, idx);
		dao.close();
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의 수정이 완료되었습니다.');location.href='/admin/course/view?idx="+courseIdx+"'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의 수정에 실패했습니다.');history.back();</script>");
		}
	}

}
