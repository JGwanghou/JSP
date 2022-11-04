<%@page import="kr.co.jboard1.bean.BoardBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// multipart 폼 데이터 수신
	String savePath = application.getRealPath("/file");
	int maxSize = 1024 * 1024 * 10;
	// cos라이브러리사용. (request, 파일경로, 파일 용량제한, utf-8, DefaultfileRenamePolicy) 
	// MultipartRequest : 스트림화 된 파일들 전송, 여기서 객체만들어 수신
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String title	 = mr.getParameter("title");
	String content	 = mr.getParameter("content");
	String uid 		 = mr.getParameter("uid");
	String fname	 = mr.getFilesystemName("fname");
	String regip	 = request.getRemoteAddr();
	
	System.out.println("fname : " + fname);
	
	BoardBean board = new BoardBean();
	board.setTitle(title);
	board.setContent(content);
	board.setUid(uid);
	board.setFname(fname);
	board.setRegip(regip);
	ArticleDAO dao = ArticleDAO.getInstance();
	// 글 등록
	int parent = dao.insertArticle(board);
	
	// 파일 첨부했으면 
	if(fname != null){
		
		// 파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext; // 20221026160517_letary.txt
		
		File f1 = new File(savePath+"/"+fname);
		File f2 = new File(savePath+"/"+newName);
		
		f1.renameTo(f2);
		
		// 파일 테이블 Insert
		dao.insertFile(parent, newName, fname);
		
	}
	
	response.sendRedirect("/Jboard1/list.jsp");
%>