package net.hb.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.TeacherDAO;
import net.hb.dto.TeacherDTO;

@WebServlet("/admin/teacher/view")
public class AdminTeacherViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String teacherId = req.getParameter("id");
		TeacherDAO dao = new TeacherDAO();
		TeacherDTO dto = dao.view(teacherId);
		
		req.setAttribute("item", dto);
		req.getRequestDispatcher("/admin/teacherview.jsp").forward(req, res);
	}

}
