package net.hb.controller.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.CourseDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.CourseDTO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class CourseNoticeListController
 */
@WebServlet("/course/review")
public class CourseReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseReviewListController() {
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
		int pageNo = 1;
		if(request.getParameter("pageNo") != null) pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.courseBoardList(courseIdx, "08", 10, pageNo);
		int count = dao.count(null, "08", null, courseIdx);
		dao.close();
		
		CourseDAO cDao = new CourseDAO();
		CourseDTO courseInfo = cDao.view(courseIdx);
		cDao.close();
		
		request.setAttribute("count", count);
		request.setAttribute("url", request.getRequestURI()+"?idx="+courseIdx+"&");
		
		request.setAttribute("courseInfo", courseInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/course/courseReviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
