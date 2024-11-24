package net.hb.controller.course;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.BoardDAO;
import net.hb.dao.CourseDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.CourseDTO;

@WebServlet("/course/review/regist")
public class CourseReviewRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		req.setAttribute("idx", courseIdx);
		
		CourseDAO cdao = new CourseDAO();
		CourseDTO courseInfo = cdao.view(courseIdx);
		cdao.close();
		req.setAttribute("courseInfo", courseInfo);
		req.getRequestDispatcher("/course/courseReviewRegist.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// [printWriter]
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); // 응답 콘텐츠 타입을 html로 지정
		PrintWriter out = res.getWriter();
		
		if(req.getParameter("score") == null || req.getParameter("idx") == null) {
			out.append("<script>");
			out.append("alert('등록 실패');");
			out.append("history.back();");
			out.append("</script>");
		}

		HttpSession session =req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
//		req.getPart("file");
		int idx = Integer.parseInt(req.getParameter("idx"));
		int score = Integer.parseInt(req.getParameter("score"));
		
		BoardDTO dto = new BoardDTO();
		dto.setMemberId(memberId);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory("08");
		dto.setCourseIdx(idx);
		dto.setScore(score);
		
		

		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.regist(dto);
		dao.close();
		if(result > 0) {
			out.append("<script>");
			out.append("alert('등록 성공');");
			out.append("location.href='/course/review?idx="+idx+"';");
			out.append("</script>");
		} else {
			out.append("<script>");
			out.append("alert('등록 실패');");
			out.append("history.back();");
			out.append("</script>");
		}
		
		
	}

}
