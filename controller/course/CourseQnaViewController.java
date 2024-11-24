package net.hb.controller.course;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.CourseDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.CourseDTO;

@WebServlet("/course/qna/view")
public class CourseQnaViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
		}
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		dao.addReadCnt(idx);
		BoardDTO dto = dao.view(idx);
		if(dto.getStatus() != null && dto.getStatus().equals("Y")) {
			req.setAttribute("answer", dao.getAnswer(idx));
		}
		dao.close();
		
		CourseDAO cdao = new CourseDAO();
		CourseDTO courseInfo = cdao.view(dto.getCourseIdx());
		cdao.close();
		req.setAttribute("courseInfo", courseInfo);
		
		req.setAttribute("item", dto);
		req.getRequestDispatcher("/course/courseQnaView.jsp").forward(req, res);
	}

}
