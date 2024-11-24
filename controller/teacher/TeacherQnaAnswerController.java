package net.hb.controller.teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dto.BoardDTO;

import java.io.IOException;

/**
 * Servlet implementation class TeacherQnaAnswerController
 */
@WebServlet("/teacher/qna/answer")
public class TeacherQnaAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeacherQnaAnswerController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getParameter("idx") == null || request.getParameter("courseIdx") == null || request.getParameter("content") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
		}
		
		BoardDTO dto = new BoardDTO();
		dto.setMemberId(request.getSession().getAttribute("sessionMemberId").toString());
		dto.setCategory("07");
		dto.setContent(request.getParameter("content"));
		dto.setRefIdx(Integer.parseInt(request.getParameter("idx")));
		dto.setCourseIdx(Integer.parseInt(request.getParameter("courseIdx")));

		
		BoardDAO dao = new BoardDAO();
		int result = dao.regist(dto);
		if(result > 0) {
			dao.updateStatus(Integer.parseInt(request.getParameter("idx")), "Y");
		}
		dao.close();
		
		if(result > 0) {
			response.sendRedirect("/course/qna/view?idx="+request.getParameter("idx"));
		} else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
		}

	}

}
