package net.hb.controller.course;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.AttendDAO;
import net.hb.dao.LessonDAO;
import net.hb.dao.PaymentDAO;
import net.hb.dto.LessonDTO;

@WebServlet("/course/lesson/view")
public class LessonViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		LessonDAO dao = new LessonDAO();
		LessonDTO dto = dao.lessonView(idx);
		dao.close();
		
		
		int result1 = -1;
		int result2 = -1;
		
		if(req.getSession().getAttribute("sessionType").equals("p")) {
			AttendDAO atDAO = new AttendDAO();
			result1 = atDAO.updateStatus(req.getSession().getAttribute("sessionMemberId").toString(), dto.getCourseIdx());
			atDAO.close();
		} else result2 = 1;

		if(result1 >= 0) {
			PaymentDAO pDAO = new PaymentDAO();
			result2 = pDAO.updateStatusRx(req.getSession().getAttribute("sessionMemberId").toString(), dto.getCourseIdx());
			pDAO.close();
		}
		
		if(result2 >= 0) {
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/course/lessonView.jsp").forward(req, res);
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
		}
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
