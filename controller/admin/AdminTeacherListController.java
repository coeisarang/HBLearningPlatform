package net.hb.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.TeacherDAO;
import net.hb.dto.TeacherDTO;

@WebServlet("/admin/teacher")
public class AdminTeacherListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int pageNo = req.getParameter("pageNo") != null ? Integer.parseInt(req.getParameter("pageNo")) : 1;
		
		TeacherDAO dao = new TeacherDAO();
		List<TeacherDTO> list = dao.list(null, 10, pageNo);
		int count = dao.count();
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
		req.getRequestDispatcher("/admin/teacherlist.jsp").forward(req, res);
	}



}
