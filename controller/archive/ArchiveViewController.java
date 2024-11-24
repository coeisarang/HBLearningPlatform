package net.hb.controller.archive;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.FileDAO;
import net.hb.dto.BoardDTO;

@WebServlet("/archive/view")
public class ArchiveViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("idx") == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		dao.addReadCnt(idx);
		BoardDTO dto = dao.view(idx);
		dao.close();
		
		if(dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('삭제된 글입니다.');history.back();</script>");
			return;
		}
		
		request.setAttribute("first", "archive");
		
		if(dto.getFileStatus() != null && dto.getFileStatus().equals("Y")) {
			FileDAO fdao = new FileDAO();
			request.setAttribute("filelist", fdao.listByRefIdx(idx));
			fdao.close();
		}
		
		request.setAttribute("item", dto);
		request.getRequestDispatcher("/freeboard/postView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
