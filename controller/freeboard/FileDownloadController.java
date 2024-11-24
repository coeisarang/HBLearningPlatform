package net.hb.controller.freeboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.FileDAO;
import net.hb.dto.FileDTO;
import net.hb.utils.CommonFileUtil;

import java.io.File;
import java.io.IOException;

/**
 * Servlet implementation class FileDownloadController
 */
@WebServlet("/file/download")
public class FileDownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String fileIdx = request.getParameter("idx");
		if(fileIdx == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('잘못된 접근입니다.');history.back();</script>");
			return;
		}
		
		FileDAO dao = new FileDAO();
		FileDTO dto = dao.view(Integer.parseInt(fileIdx));
		dao.close();

		CommonFileUtil.fileDownload(request, response, dto.getFilePath(), dto.getFileName(), dto.getFileName());			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
