package net.hb.controller.course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.AttendDAO;
import net.hb.dao.CourseDAO;
import net.hb.dto.AttendDTO;
import net.hb.dto.CourseDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class MyCourseListController
 */
@WebServlet("/mycourse")
public class MyCourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCourseListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String memberId = request.getSession().getAttribute("sessionMemberId").toString();
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		
		if(request.getSession().getAttribute("sessionType").equals("p")) {
			AttendDAO dao = new AttendDAO();
			List<AttendDTO> list = dao.list(memberId, null, 10, pageNo);
			int count = dao.count(memberId, null);
			dao.close();
			
			
			request.setAttribute("count", count);
			request.setAttribute("uri", "/mycourse?");
			request.setAttribute("list", list);
		}
		else  {
			CourseDAO dao = new CourseDAO();
			List<CourseDTO> tlist = dao.list(null, 0, null, null, 10, pageNo, memberId, null);
			int count = dao.count(null, 0, null, null, memberId);
			dao.close();
			
			List<AttendDTO> list = new ArrayList<AttendDTO>();
			AttendDTO at;
			for(CourseDTO d : tlist) {
				at = new AttendDTO();
				at.setCourseInfo(d);
				list.add(at);
			}
			
			
			request.setAttribute("count", count);
			request.setAttribute("url", "/mycourse?");
			request.setAttribute("list", list);
		}

		request.getRequestDispatcher("/course/myCourseList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
