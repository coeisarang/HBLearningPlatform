package net.hb.controller.course;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.AttendDAO;
import net.hb.dao.ReportDAO;
import net.hb.dto.ReportDTO;

@WebServlet("/course/report")
public class TeacherReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 강의 아이디 받아오기 
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		AttendDAO dao = new AttendDAO();
		List<ReportDTO> list = dao.getStudentList(courseIdx);
		dao.close();
		
		req.setAttribute("courseIdx", courseIdx);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/course/report.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		if(req.getParameter("memberId") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		if(req.getParameter("score") == null || req.getParameter("score").equals("X")) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		String memberId = req.getParameter("memberId");
		String score = req.getParameter("score");
		System.out.println(score);
		ReportDAO dao = new ReportDAO();
		boolean exist = dao.exists(memberId, courseIdx);
		
		if(exist) {
			int result = dao.update(memberId, courseIdx, score);
			if(result > 0) {
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('성적 업데이트가 완료되었습니다.');history.back();</script>");
			} else {
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('성적 업데이트에 실패했습니다.');history.back();</script>");
			}
		} else {
			int result = dao.regist(memberId, courseIdx, score);
			if(result > 0) {
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('성적 입력이 완료되었습니다.');history.back();</script>");
			} else {
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('성적 입력에 실패했습니다.');history.back();</script>");
			}
			
		}
		dao.close();
	}

}
