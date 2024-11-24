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

@WebServlet("/mypage/qna/reply")
public class QnaReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//여기로 바로 들어옴
		System.out.println("[QnaReplyController. 방금 qna상세보기 페이지에서 답글 등록하심]");
		HttpSession session = req.getSession();
		
		String memberId = (String) session.getAttribute("sessionMemberId"); // 아이디 받아오기
		String index = req.getParameter("idx"); 		// 인덱스 받아오기
		int idx = Integer.parseInt(index);				// 인덱스 숫자로 만들기
		String content = req.getParameter("content");   // 내용 받아오기 
		
		// [printWriter]
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8"); //응답 콘텐츠 타입을 html로 지정
        PrintWriter out = res.getWriter();
		
		
		BoardDAO dao = new BoardDAO();
		int rslt = dao.updateStatus(idx, "Y");
		if(rslt < 0) { // 상태 업데이트 실패
			out.append("<script>");
			out.append("alert('상태 업데이트 실패. 여기 좀 안예쁜 것 같은데');");
			out.append("history.back();");
			out.append("</script>");
			return;
		}
		int result = dao.qnaReplyRegist(memberId, content, idx); // 댓글 등록 <인서트>
		if(result > 0) {
			res.sendRedirect("view?idx="+index);
			return;
		}
		if(rslt == 1) {
			dao.updateStatus(idx, "N");
			return;
		}
		dao.close();
	}

}
