package net.hb.controller.freeboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.ReplyDAO;

@WebServlet("/freeboard/reply/modify")
public class FreeBoardReplyModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if(req.getParameter("idx")==null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		
		
		String content = req.getParameter("content");
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		ReplyDAO dao = new ReplyDAO();
		int result = dao.update(idx, content);
		dao.close();
		
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('수정이 완료되었습니다.');window.close();</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('수정에 실패했습니다.');history.back();</script>");
		}
	}

}
