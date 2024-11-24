package net.hb.controller.archive;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dto.BoardDTO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ArchiveListController
 */
@WebServlet("/archive")
public class ArchiveListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pageNo = 1;
		if(request.getParameter("pageNo")!=null) pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.list(null, "02", 10, pageNo);
		int count = dao.count(null, "02", null, 0);
		dao.close();
		
		request.setAttribute("count", count);
		request.setAttribute("url", request.getRequestURI()+"?");
		
		request.setAttribute("first", "archive");
		request.setAttribute("boardname", "자료실");
		request.setAttribute("list", list);
		request.getRequestDispatcher("/freeboard/freeboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
