package net.hb.controller.teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.CourseDAO;
import net.hb.dao.TeacherDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.CourseDTO;
import net.hb.dto.TeacherDTO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class TeacherViewController
 */
@WebServlet("/teacher/view")
public class TeacherViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String teacherId = request.getParameter("id");
		
		if(teacherId == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요');history.back();</script>");
			return;
		}
		
		TeacherDAO tDao = new TeacherDAO();
		TeacherDTO teacherInfo = tDao.view(teacherId);
		tDao.close();
		
		BoardDAO bDao = new BoardDAO();
		List<BoardDTO> notice = bDao.teacherBoardList(teacherId, "05", 3, 1, "readCnt");
		List<BoardDTO> qna = bDao.teacherBoardList(teacherId, "07", 3, 1, "readCnt");
		List<BoardDTO> archive = bDao.teacherBoardList(teacherId, "06", 3, 1, "readCnt");
		List<BoardDTO> review = bDao.teacherBoardList(teacherId, "08", 4, 1, "readCnt");
		bDao.close();
		
		CourseDAO cDao = new CourseDAO();
		List<CourseDTO> course = cDao.list(null, 0, null, null, 2, 1, teacherId, "co.regDate DESC");
		cDao.close();
		
		request.setAttribute("noticeList", notice);
		request.setAttribute("qnaList", qna);
		request.setAttribute("archiveList", archive);
		request.setAttribute("reviewList", review);
		request.setAttribute("courseList", course);
		request.setAttribute("teacherInfo", teacherInfo);
		
		request.getRequestDispatcher("/teacher/teacherView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
