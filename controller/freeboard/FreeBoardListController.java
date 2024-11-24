package net.hb.controller.freeboard;

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

@WebServlet("/freeboard")
public class FreeBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int pageNo = 1;
		if(req.getParameter("pageNo")!=null) pageNo = Integer.parseInt(req.getParameter("pageNo"));
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.list(null, "04", 10, pageNo);
		int count = dao.count(null, "04", null, 0);
		dao.close();
		
		req.setAttribute("count", count);
		req.setAttribute("url", req.getRequestURI()+"?");
	   
	    req.setAttribute("first", "freeboard");
		
		req.setAttribute("boardname", "자유게시판");
		req.setAttribute("list", list);
		req.getRequestDispatcher("/freeboard/freeboard.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

}
