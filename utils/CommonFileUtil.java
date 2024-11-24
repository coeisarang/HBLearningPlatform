package net.hb.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class CommonFileUtil {
	public CommonFileUtil() {
	}

	// 파일 업로드
	public static String fileUpload(HttpServletRequest req, String saveDir, String infileTagName)
			throws ServletException, IOException {

		System.out.println("==========================================================");
		System.out.println("CommonFileUtil >> fileUpload Start");

		// part 객체를 사용
		Part part = req.getPart(infileTagName);
		
		if(part == null) return null;
		
		System.out.println(part.getName());

		// 헤더값에서 파일 객체 부분 읽어오기
		String partHeader = part.getHeader("content-disposition");
		// 파일객체부분: form-data; name="attachFile"; filename="파일명"
		System.out.println("partHeader >> " + partHeader);

		String[] arrPartHeader = partHeader.split("filename=");
		String orgFileName = arrPartHeader[1].trim().replace("\"", "");

		if (!orgFileName.isEmpty()) {
			System.out.println("orgFileName >> " + orgFileName);

			//파일 사이즈 체크
			
			// 파일을 업로드하는 경로
			// D:\java7\JSP\chap13\src\main\webapp\Uploads
			part.write(saveDir + File.separator + orgFileName);
		}

		System.out.println("CommonFileUtil >> fileUpload End");
		System.out.println("==========================================================");

		return orgFileName;
	}
	
	public static int randomNumber() {
		return (int)(Math.random() *100000);
	}

	// 업로드된 파일명 변경
	public static Map<String,String> fileRename(String saveDir, String fileName) {
		if(saveDir == null || saveDir.isEmpty() || fileName == null || fileName.isEmpty()) {
			return null;
		}
		// 파일확장자 추출
		String fileExt = fileName.substring(fileName.lastIndexOf("."));

		// 임시파일명 생성
		String tmpName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + randomNumber();

		// 새로운 파일명 조합
		String newFileName = tmpName + fileExt;

		// 기존 파일명 --> 새로운 파일명으로 변경
		File oldFile = new File(saveDir + File.separator + fileName);
		File newFile = new File(saveDir + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		Map<String, String> fmap = new HashMap<>();
		fmap.put("filePath", saveDir);
		fmap.put("orgFileName", fileName);
		fmap.put("newFileName", newFileName);
		fmap.put("fileExt", fileExt);
		fmap.put("fileSize", String.valueOf(newFile.length()));
		
		System.out.println("filePath: " + saveDir);
		System.out.println("orgFileName: " + fileName);
		System.out.println("newFileName: " + newFileName);
		System.out.println("fileExt: " + fileExt);
		System.out.println("fileSize: " + fmap.get("fileSize"));
		
		return fmap;
	}
	
	// 업로드된 파일명 변경
		public static Map<String,String> teacherFileRename(String saveDir, String fileName, String teacherId) {
			if(saveDir == null || saveDir.isEmpty() || fileName == null || fileName.isEmpty()) {
				return null;
			}
			// 파일확장자 추출
			String fileExt = fileName.substring(fileName.lastIndexOf("."));

			// 임시파일명 생성
			String tmpName = teacherId+"_profile";

			// 새로운 파일명 조합
			String newFileName = tmpName + fileExt;

			// 기존 파일명 --> 새로운 파일명으로 변경
			File oldFile = new File(saveDir + File.separator + fileName);
			File newFile = new File(saveDir + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			Map<String, String> fmap = new HashMap<>();
			fmap.put("filePath", saveDir);
			fmap.put("orgFileName", fileName);
			fmap.put("newFileName", newFileName);
			fmap.put("fileExt", fileExt);
			fmap.put("fileSize", String.valueOf(newFile.length()));
			
			System.out.println("filePath: " + saveDir);
			System.out.println("orgFileName: " + fileName);
			System.out.println("newFileName: " + newFileName);
			System.out.println("fileExt: " + fileExt);
			System.out.println("fileSize: " + fmap.get("fileSize"));
			
			return fmap;
		}

	// 파일 다운로드
	public static void fileDownload(HttpServletRequest req, HttpServletResponse res, String dir, String orgFileName,
			String outFileName) {
		// dir : D:\java7\JSP\chap13\src\main\webapp\Uploads
		// dir : Uploads
		String realPath = req.getServletContext().getRealPath(orgFileName);

		try {
			File file = new File(dir, orgFileName);
			InputStream inputStream = new FileInputStream(file);

			// 클라이언트의 브라우저 체크
			String userAgent = req.getHeader("user-agent");
			if (userAgent.indexOf("WOW64") == -1) {
				outFileName = new String(outFileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				outFileName = new String(outFileName.getBytes("KSC5601"), "ISO-8859-1");
			}

			// 다운로드할 파일의 응답 헤더 설정
			res.reset();
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment;filename=\"" + outFileName + "\"");
			res.setHeader("Content-Length", "" + file.length()); // String.valueOf(file.length());
//			out.clear();

			// response 내장 객체를 이용하여 출력 스트림 생성
			OutputStream outStream = res.getOutputStream();

			// 출력 스트림에 파일 내용을 출력
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while( (readBuffer = inputStream.read(b)) > 0) {
				outStream.write(b, 0, readBuffer);
			}
			outStream.write("<script>history.back();</script>".getBytes("UTF-8"));
			
			//입출력 스트림 닫기
			inputStream.close();
			outStream.close();

		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다. : "+ e.getMessage());
		} catch (Exception e) {
			System.out.println("예외발생 : "+ e.getMessage());
		}
	}
	
	//파일 삭제
	public static void fileDelete(HttpServletRequest req, String dir, String fileName) {
		
		System.out.println("==========================================================");
		System.out.println("CommonFileUtil >> fileDelete Start");
		try {
			//파일이 존재할 경우 삭제
			File file = new File(dir + File.separator + fileName);
			if(file.exists()) {
				file.delete();
				System.out.println("dir + File.separator + fileName");
			}
		} catch(Exception e) {
			System.out.println("파일 삭제시 에러가 발생: "+e.getMessage());
			e.printStackTrace();
		}
		
		System.out.println("CommonFileUtil >> fileDelete End");
		System.out.println("==========================================================");
	}
	
	// 파일 업로드
		public static List<String> filesUpload(HttpServletRequest req, String saveDir, String infileTagName)
				throws ServletException, IOException {

			System.out.println("==========================================================");
			System.out.println("CommonFileUtil >> FilesUpload Start");

			//파일명 처리 리스트
			List<String> fileNameList = new ArrayList<>();
			
			//part 객체 --> 여러개 처리
			// part 객체를 사용
			Collection<Part> parts = req.getParts();
			
			for(Part part : parts) {
				if(!part.getName().equals(infileTagName)) {
					continue;
				}
				
				System.out.println(part.getName());
	
				// 헤더값에서 파일 객체 부분 읽어오기
				String partHeader = part.getHeader("content-disposition");
				// 파일객체부분: form-data; name="attachFile"; filename="파일명"
				System.out.println("partHeader >> " + partHeader);
	
				String[] arrPartHeader = partHeader.split("filename=");
				String orgFileName = arrPartHeader[1].trim().replace("\"", "");
	
				if (!orgFileName.isEmpty()) {
					System.out.println("orgFileName >> " + orgFileName);
	
					//파일 사이즈 체크
					
					// 파일을 업로드하는 경로
					// D:\java7\JSP\chap13\src\main\webapp\Uploads
					part.write(saveDir + File.separator + orgFileName);
					
					fileNameList.add(orgFileName);
				}
			}
			
			System.out.println("CommonFileUtil >> FilesUpload End");
			System.out.println("==========================================================");

			
			return fileNameList;
		}
}
