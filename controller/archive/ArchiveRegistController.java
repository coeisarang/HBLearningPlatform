package net.hb.controller.archive;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.FileDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.FileDTO;
import net.hb.utils.CommonFileUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class NoticeRegistController
 */
@WebServlet("/archive/regist")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 15     // 15MB
	)
public class ArchiveRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveRegistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!request.getSession().getAttribute("sessionMemberId").equals("admin")) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('권한이 없습니다.');history.back();</script>");
			return;
		}
		
		request.setAttribute("boardname", "자료실");
		request.setAttribute("uri", request.getRequestURI());
		request.getRequestDispatcher("/freeboard/freeboardRegist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		if (title == null || content == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('제목과 내용을 입력해주세요.');history.back();</script>");
			return;
		}

		///////////////////////////////

		BoardDTO dto = new BoardDTO();
		dto.setMemberId(request.getSession().getAttribute("sessionMemberId").toString());
		dto.setCategory("02");
		dto.setTitle(title);
		dto.setContent(content);
		BoardDAO dao = new BoardDAO();
		int result = dao.regist(dto);
		dao.close();

		if (result <= 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}

		System.out.println(">>>>>" + result);

		List<FileDTO> files = new ArrayList<>();

//		String saveDir = "C:\\Users\\Jerry\\Desktop\\java7\\project\\TClass\\HBLearningPlatform\\src\\main\\webapp\\uploads";
		String saveDir = request.getServletContext().getRealPath("/uploads");

		String newFileName = "";

		List<String> fileName = CommonFileUtil.filesUpload(request, saveDir, "file-upload");

		System.out.println(fileName);

		Map<String, String> fmap = null;

		if (fileName != null && !fileName.isEmpty()) {
			for (String name : fileName) {
				fmap = CommonFileUtil.fileRename(saveDir, name);
				if (fmap != null) {
					newFileName = fmap.get("newFileName");
					files.add(new FileDTO(newFileName, fmap.get("filePath"), Integer.parseInt(fmap.get("fileSize")),
							fmap.get("fileExt"), result));
				}
				newFileName = "";
			}
		}

		int fileResult = -1;
		if (files != null && result >= 0) {

			FileDAO dao2 = new FileDAO();
			for(FileDTO file : files) {
				fileResult = dao2.insert(file);
				if (fileResult < 0) {
					System.out.println("파일 저장 실패");
					BoardDAO filestatusdao = new BoardDAO();
					filestatusdao.updateFileStatus(result, "N");
					filestatusdao.close();
					break;
				}
			}
			dao2.close();
			BoardDAO filestatusdao = new BoardDAO();
			filestatusdao.updateFileStatus(result, "Y");
			filestatusdao.close();
		}

		if (result > 0 && (fileResult >= 0 || files.size()==0)) {
			response.sendRedirect("/archive");
		} else {
			FileDAO dao3 = new FileDAO();
			fileResult = dao3.deleteByRefIdx(result);
			dao3.close();

			BoardDAO dao4 = new BoardDAO();
			dao4.deleteByIdx(result);
			dao4.close();

			for (FileDTO file : files) {
				CommonFileUtil.fileDelete(request, saveDir, file.getFileName());
			}
			for (String file : fileName) {
				CommonFileUtil.fileDelete(request, saveDir, file);
			}

			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('등록 실패');history.back();</script>");
			return;
		}
	}

}
