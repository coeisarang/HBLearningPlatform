package net.hb.controller.teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.BoardDAO;
import net.hb.dao.CourseDAO;
import net.hb.dao.FileDAO;
import net.hb.dto.BoardDTO;
import net.hb.dto.FileDTO;
import net.hb.utils.CommonFileUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class TeacherNoticeModifyController
 */
@WebServlet("/teacher/archive/modify")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 15 // 15MB
)
public class TeacherArchiveModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeacherArchiveModifyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idx = request.getParameter("idx");
		if (idx == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요');history.back();</script>");
			return;
		}

		BoardDAO bDao = new BoardDAO();
		BoardDTO dto = bDao.view(Integer.parseInt(idx));
		bDao.close();

		if (dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('존재하지 않는 게시글입니다.');history.back();</script>");
			return;
		}
		
		if(!dto.getMemberId().equals(request.getSession().getAttribute("sessionMemberId").toString())) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('수정 권한이 없습니다.');history.back();</script>");
			return;
		}
		
		request.setAttribute("item", dto);

		if (dto.getFileStatus() != null && dto.getFileStatus().equals("Y")) {
			FileDAO fDao = new FileDAO();
			List<FileDTO> files = fDao.listByRefIdx(dto.getIdx());
			fDao.close();
			request.setAttribute("files", files);
		}

		request.setAttribute("boardname", "강의 자료실");
		request.setAttribute("uri", request.getRequestURI()+"?"+request.getQueryString());
		request.getRequestDispatcher("/freeboard/freeboardRegist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String idxparam = request.getParameter("idx");
		int count = 0;

		if (title == null || content == null || idxparam == null) {
			System.out.println(title);
			System.out.println(content);
			System.out.println(idxparam);
			
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('제목과 내용을 입력해주세요.');history.back();</script>");
			return;
		}
		
		int idx = Integer.parseInt(idxparam);

		///////////////////////////////

		

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
							fmap.get("fileExt"), idx));
				}
				newFileName = "";
			}
		}

		int fileResult = -1;
		if (files != null) {

			FileDAO dao2 = new FileDAO();
			for (FileDTO file : files) {
				fileResult = dao2.insert(file);
				if (fileResult < 0) {
					System.out.println("파일 저장 실패");
					break;
				}
			}
			count = dao2.countByRefIdx(idx);
			dao2.close();
		}
		
		

		if (files.size() > 0 && fileResult <= 0) {
			FileDAO dao3 = new FileDAO();
			fileResult = dao3.deleteByRefIdx(idx);
			dao3.close();

			for (FileDTO file : files) {
				CommonFileUtil.fileDelete(request, saveDir, file.getFileName());
			}
			for (String file : fileName) {
				CommonFileUtil.fileDelete(request, saveDir, file);
			}

			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('수정 실패');history.back();</script>");
			return;
		}

		///////////////////////////////
		
		
		BoardDAO dao = new BoardDAO();
		int result = dao.updateByIdx(idx, title, content);
		dao.close();

		if (result <= 0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}

		String[] deleteFile = request.getParameterValues("deleteFile");
		

		if (deleteFile != null) {
			FileDAO filedeletedao = new FileDAO();
			FileDTO fileinfo;
			for (String file : deleteFile) {
				fileinfo = filedeletedao.view(Integer.parseInt(file));
				filedeletedao.deleteByIdx(Integer.parseInt(file));
				CommonFileUtil.fileDelete(request, fileinfo.getFilePath(), fileinfo.getFileName());
			}
			count = filedeletedao.countByRefIdx(idx);
			filedeletedao.close();
		}
		
		BoardDAO updateDAO = new BoardDAO();
		if(count==0) {
			updateDAO.updateFileStatus(idx, "N");
		}
		else if(count > 0) {
			updateDAO.updateFileStatus(idx, "Y");
		}
		updateDAO.close();
		///////////////////////////////
		
		response.sendRedirect("/course/archive/view?idx=" + idx);

	}

}
