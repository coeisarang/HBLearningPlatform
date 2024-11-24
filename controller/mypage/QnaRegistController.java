package net.hb.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.BoardDAO;

@WebServlet("/mypage/qna/regist")
public class QnaRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("mainQnaRegist.jsp").forward(req,res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		System.out.println(memberId);
		if (title == null || content == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('제목과 내용을 입력해주세요.');history.back();</script>");
			return;
		}
		
		// [printWriter]
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); //응답 콘텐츠 타입을 html로 지정
        PrintWriter out = res.getWriter();
		
		BoardDAO dao = new BoardDAO();
		int result = dao.qnaRegist(memberId, title, content);
		dao.close();
		if(result > 0) { //게시물 등록 완료
			res.sendRedirect("/mypage/qna");
		} else {
			out.append("<script>");
			out.append("alert('실패했어요.');");
			out.append("history.back();");
			out.append("</script>");
		}
	}
}
