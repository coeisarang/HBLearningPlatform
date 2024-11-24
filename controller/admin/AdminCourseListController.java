package net.hb.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CourseDAO;
import net.hb.dto.CourseDTO;

@WebServlet("/admin/course")
public class AdminCourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int pageNo = req.getParameter("pageNo") != null ? Integer.parseInt(req.getParameter("pageNo")) : 1;
		String school = req.getParameter("school");
		Integer grade = req.getParameter("grade") != null ? Integer.parseInt(req.getParameter("grade")) : 0;
		String subject = req.getParameter("subject");
		String keyword = req.getParameter("keyword");
		String sort = req.getParameter("sort");
		CourseDAO dao = new CourseDAO();
		List<CourseDTO> list = dao.list(school, 0, subject, keyword, 10, pageNo, null, sort);
		int count = dao.count(school, grade, subject, keyword, null);
		dao.close();
		
		String query = "";
		if(req.getQueryString() != null) {
			query = req.getQueryString().replace("pageNo="+pageNo, "").replace("?&", "?");
		}
		
		if(query.endsWith("&&")) query.replace("&&", "&");
		if(query.length() > 0 && !query.endsWith("&")) query += "&";
		
		req.setAttribute("count", count);
		req.setAttribute("url", req.getRequestURI()+"?"+query);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/admin/courselist.jsp").forward(req, res);
	}

}
