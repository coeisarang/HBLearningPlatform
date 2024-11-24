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

@WebServlet("/course/qna/regist")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 15     // 15MB
	)
public class CourseQnaRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		////////////////////////
		//미경 수정
		if(req.getParameter("idx")==null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('강의실을 선택해주세요.');history.back()</script>");
		}
		///////////////////////
		
		int courseIdx = Integer.parseInt(req.getParameter("idx"));
		
		
		CourseDAO cdao = new CourseDAO();
		CourseDTO courseInfo = cdao.view(courseIdx);
		cdao.close();
		req.setAttribute("courseInfo", courseInfo);
		req.setAttribute("idx", courseIdx);
		req.getRequestDispatcher("/course/courseQnaRegist.jsp").forward(req, res);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// [printWriter]
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); // 응답 콘텐츠 타입을 html로 지정
		PrintWriter out = res.getWriter();
		HttpSession session =req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
//		req.getPart("file");
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		BoardDTO dto = new BoardDTO();
		dto.setMemberId(memberId);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory("07");
		dto.setCourseIdx(idx);
//		dto.setFileStatus(content);
		
		BoardDAO dao = new BoardDAO();
		int result = dao.regist(dto);
		dao.close();
		if(result > 0) {
			out.append("<script>");
			out.append("alert('등록 성공');");
			out.append("location.href='/course/qna?idx="+idx+"';");
			out.append("</script>");
		} else {
			out.append("<script>");
			out.append("alert('등록 실패');");
			out.append("history.back();");
			out.append("</script>");
		}
		
	}

}
