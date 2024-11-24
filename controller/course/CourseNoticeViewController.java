package net.hb.controller.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.CourseDAO;
import net.hb.dao.FileDAO;
import net.hb.dao.TeacherDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.CourseDTO;

import java.io.IOException;

/**
 * Servlet implementation class CourseNoticeViewController
 */
@WebServlet("/course/notice/view")
public class CourseNoticeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseNoticeViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getParameter("idx") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int courseIdx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		dao.addReadCnt(courseIdx);
		BoardDTO dto = dao.view(courseIdx);
		dao.close();
		
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('삭제된 글입니다.');history.back();</script>");
			return;
		}
		
		if(dto.getFileStatus() != null && dto.getFileStatus().equals("Y")) {
			FileDAO fdao = new FileDAO();
			request.setAttribute("filelist", fdao.listByRefIdx(courseIdx));
			fdao.close();
		}
		
		CourseDAO cdao = new CourseDAO();
		CourseDTO courseInfo = cdao.view(dto.getCourseIdx());
		cdao.close();
		request.setAttribute("courseInfo", courseInfo);
		
		TeacherDAO tdao = new TeacherDAO();
		String name = tdao.name(dto.getMemberId());
		tdao.close();
		
		request.setAttribute("teacherName", name);
		request.setAttribute("item", dto);
		request.getRequestDispatcher("/course/courseNoticeView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
