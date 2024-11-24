package net.hb.controller.mypage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.BoardDAO;
import net.hb.dto.BoardDTO;

@WebServlet("/mypage/mypost")
public class MyPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		//[페이징] 쿼리스트링으로 받아오기
		int pageNo = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : 1;
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> pList = dao.list(memberId, "04", 10, pageNo);
		int count = dao.count(memberId, "04", null, 0);
		dao.close();
		
		req.setAttribute("count", count);
		req.setAttribute("url", req.getRequestURI()+"?");
		
		req.setAttribute("pList", pList);
		req.getRequestDispatcher("myPost.jsp").forward(req, res);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
