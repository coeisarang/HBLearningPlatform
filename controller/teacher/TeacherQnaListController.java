package net.hb.controller.teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.TeacherDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.TeacherDTO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class TeacherQnaListController
 */
@WebServlet("/teacher/qna")
public class TeacherQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String teacherId = request.getParameter("id");

		if (teacherId == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요');history.back();</script>");
			return;
		}
		
		int pageNo = 1;
		if(request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}

		TeacherDAO tDao = new TeacherDAO();
		TeacherDTO teacherInfo = tDao.view(teacherId);
		tDao.close();

		BoardDAO bDao = new BoardDAO();
		List<BoardDTO> qna = bDao.teacherBoardList(teacherId, "07", 10, pageNo, "readCnt");
		bDao.close();

		request.setAttribute("list", qna);
		request.setAttribute("teacherInfo", teacherInfo);

		request.getRequestDispatcher("/teacher/teacherQna.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
