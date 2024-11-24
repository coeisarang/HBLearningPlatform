package net.hb.controller.freeboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

@WebServlet("/freeboard/regist")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1, // 1MB: 메모리에 임시로 저장할 파일 크기 (이 크기 초과 시 디스크에 임시 저장)
	maxFileSize = 1024 * 1024 * 10,      // 10MB: 업로드할 단일 파일 최대 크기
	maxRequestSize = 1024 * 1024 * 50
)
public class FreeBoardRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/freeboard/freeboardRegist.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		if (title == null || content == null) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('제목과 내용을 입력해주세요.');history.back();</script>");
			return;
		}

		///////////////////////////////

		BoardDTO dto = new BoardDTO();
		dto.setMemberId(req.getSession().getAttribute("sessionMemberId").toString());
		dto.setCategory("04");
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFileStatus("Y");
		BoardDAO dao = new BoardDAO();
		int result = dao.regist(dto);
		dao.close();

		if (result <= 0) {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('다시 시도해주세요.');history.back();</script>");
			return;
		}

		System.out.println(">>>>>" + result);
		//멀티파일업로드
        String saveDir = req.getServletContext().getRealPath("/uploads"); // 저장 경로 설정
        List<FileDTO> files = new ArrayList<>();


		String newFileName = "";

		List<String> fileName = CommonFileUtil.filesUpload(req, saveDir, "file-upload");

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
					break;
				}
			}
			dao2.close();
		}

		if (result >= 0 && (files.size()==0 || fileResult > 0)) {
			res.sendRedirect("/freeboard");
		} else {
			FileDAO dao3 = new FileDAO();
			fileResult = dao3.deleteByRefIdx(result);
			dao3.close();

			BoardDAO dao4 = new BoardDAO();
			dao4.deleteByIdx(result);
			dao4.close();

			for (FileDTO file : files) {
				CommonFileUtil.fileDelete(req, saveDir, file.getFileName());
			}
			for (String file : fileName) {
				CommonFileUtil.fileDelete(req, saveDir, file);
			}

			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('등록 실패');history.back();</script>");
			return;
		}
	}
}
        



