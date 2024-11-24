package net.hb.controller.mypage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.hb.dao.BoardDAO;
import net.hb.dao.ReplyDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.ReplyDTO;

import java.io.IOException;
import java.util.List;


@WebServlet("/mypage/myreply")
public class MyReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("sessionMemberId");
		
		//[페이징] 쿼리스트링으로 받아오기
		int pageNo = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : 1;
		
		ReplyDAO dao = new ReplyDAO();
		List<ReplyDTO> pList = dao.listByMemberId(memberId, 10, pageNo);
		dao.close();
		
		req.setAttribute("pList", pList);
		req.getRequestDispatcher("myReply.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
