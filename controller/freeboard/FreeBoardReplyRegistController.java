package net.hb.controller.freeboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.ReplyDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.ReplyDTO;

@WebServlet("/freeboard/reply/regist")
public class FreeBoardReplyRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=utf-8");
		res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memberId = (String) req.getSession().getAttribute("sessionMemberId");
		String content = req.getParameter("content");
		
		////10270018 미경 수정
		if(memberId == null || content==null || req.getParameter("idx")==null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		////////////////////
		
		
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		ReplyDTO dto = new ReplyDTO();
		dto.setMemberId(memberId);
		dto.setContent(content);
		dto.setBoardIdx(idx);
		ReplyDAO dao = new ReplyDAO();
		int result = dao.regist(dto);
		dao.close();
		if(result > 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>location.href='/freeboard/view?idx="+idx+"'</script>");
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('댓글 등록에 실패했습니다');history.back();</script>");
		}
		
		
	}

}
