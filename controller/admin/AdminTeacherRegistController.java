package net.hb.controller.admin;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.hb.dao.FileDAO;
import net.hb.dao.MemberDAO;
import net.hb.dao.TeacherDAO;
import net.hb.dto.FileDTO;
import net.hb.dto.MemberDTO;
import net.hb.utils.CommonFileUtil;

@WebServlet("/admin/teacher/regist")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,   // 파일 크기 1MB를 초과할 경우 디스크에 저장 (기본적으로 메모리에 저장)
	    maxFileSize = 1024 * 1024 * 10,    // 단일 파일의 최대 크기 10MB
	    maxRequestSize = 1024 * 1024 * 50  // 전체 요청 크기 50MB
	)
public class AdminTeacherRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/admin/teacherregist.jsp").forward(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String teacherId = req.getParameter("teacherId");
		String subject = req.getParameter("subject");
		String description = req.getParameter("description");
		String phone = req.getParameter("phone");
		
		
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setMemberId(teacherId);
		dto.setPhone(phone);
		dto.setPwd("1234");
		dto.setBirthday("0000-00-00");
		
		
		
		
		String saveDir = req.getServletContext().getRealPath("/uploads/teacher");
		String orgFileName = CommonFileUtil.fileUpload(req, saveDir, "profileIdx");
		Map<String,String> fmap = null;
		int fresult = 0;		
		if(orgFileName != null && !orgFileName.isEmpty()) {
			fmap = CommonFileUtil.teacherFileRename(saveDir, orgFileName, teacherId);
			if(fmap != null && fmap.size() > 0) {
				FileDTO dto2 = new FileDTO();
				dto2.setFileName(fmap.get("newFileName"));
				dto2.setFilePath(fmap.get("filePath"));
				dto2.setFileExt(fmap.get("fileExt"));
				dto2.setFileSize(Integer.parseInt(fmap.get("fileSize")));
				
				FileDAO dao2 = new FileDAO();
				fresult = dao2.insert(dto2);
				dao2.close();
				
				if(fresult <= 0) {
					CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
					
					res.setContentType("text/html;charset=utf-8");
					res.getWriter().append("<script>alert('등록 실패');history.back();</script>");
					return;
				}
			}
		}
		
		
		MemberDAO dao = new MemberDAO();
		int result = dao.registT(dto);
		dao.close();
		
		
		if( result > 0) {
			TeacherDAO dao2 = new TeacherDAO();
			int result2 = dao2.regist(teacherId, subject, description, name);
			dao2.close();
			
			if(result2 > 0) {
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('선생님 등록 성공');location.href='/admin/teacher';</script>");
			} else {
				if(fresult > 0) {
					CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
				}
				res.setContentType("text/html;charset=utf-8");
				res.getWriter().append("<script>alert('선생님 등록 실패');history.back();</script>");
			}
		} else {
			
			if(fresult > 0) {
				CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
			}
			
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().append("<script>alert('선생님 등록 실패');history.back();</script>");
		}
		
		
		
		
		
		
	}

}
