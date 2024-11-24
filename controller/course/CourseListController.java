package net.hb.controller.course;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.CourseDAO;
import net.hb.dto.CourseDTO;

@WebServlet("/course")
public class CourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//[페이징] 쿼리스트링으로 받아오기
		int pageNo = req.getParameter("pageNo") != null ? Integer.parseInt(req.getParameter("pageNo")) : 1;
		
		String school = req.getParameter("school");
		int grade = req.getParameter("grade") != null ? Integer.parseInt(req.getParameter("grade")) : 0;
		String subject = req.getParameter("subject");
		String keyword = req.getParameter("keyword");
		
		CourseDAO dao = new CourseDAO();
		List<CourseDTO> cList = dao.list(school, grade, subject, keyword, 10, pageNo, null, "regDate DESC");
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
		
		System.out.println(query);
		
		req.setAttribute("cList", cList);
		req.getRequestDispatcher("/course/courseList.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

}
