package net.hb.controller.mypage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dto.BoardDTO;

@WebServlet("/mypage/qna/view")
public class QnaViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 목록에서 넘어올 때 idx 쿼리스트링으로 받기. 안받으면 못들어옴
		if(req.getParameter("idx") == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.view(idx);
		req.setAttribute("dto", dto);
		
		List<BoardDTO> rList = dao.getAnswer(idx);
		req.setAttribute("rList", rList);
		dao.close();
		
		if(dto == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('존재하지 않는 게시글입니다.');history.back();</script>");
			return;
		}
		
//		System.out.println("[viewController. 지금 qna목록에서 제목 눌러서 들어오셨습니다~]");
		req.getRequestDispatcher("/mypage/qna/mainQnaView.jsp").forward(req, res);
		
		
		
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
