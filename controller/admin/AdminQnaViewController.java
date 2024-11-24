package net.hb.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dto.BoardDTO;
import net.hb.utils.CommonDateUtil;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class AdminQnaViewController
 */
@WebServlet("/admin/qna/view")
public class AdminQnaViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("idx") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.view(idx);
		request.setAttribute("dto", dto);
		
		List<BoardDTO> rList = dao.getAnswer(idx);
		request.setAttribute("rList", rList);
		dao.close();
		
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('존재하지 않는 게시글입니다.');history.back();</script>");
			return;
		}
		
//		System.out.println("[viewController. 지금 qna목록에서 제목 눌러서 들어오셨습니다~]");
		request.getRequestDispatcher("/admin/sideout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("content") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('답변 내용을 입력하세요.');history.back();</script>");
			return;
		}
		
		if(request.getParameter("idx") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('잘못된 접근입니다.');history.back();</script>");
			return;
		}
		
		BoardDTO dto = new BoardDTO();
		dto.setMemberId("admin");
		dto.setContent(request.getParameter("content"));
		dto.setCategory("03");
		dto.setRefIdx(Integer.parseInt(request.getParameter("idx")));
		
		BoardDAO dao = new BoardDAO();
		int result = dao.regist(dto);
		if(result > 0) {
			dao.updateStatus(dto.getRefIdx(), "Y");
		}
		dao.close();
		
		if(result < 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		
		response.sendRedirect("/admin/qna/view?idx="+dto.getRefIdx());
	}

}
