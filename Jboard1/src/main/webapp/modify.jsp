<%@page import="kr.co.jboard1.bean.BoardBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no	 = request.getParameter("no");
	String pg	 = request.getParameter("pg");
	
	
	BoardBean board = ArticleDAO.getInstance().selectArticle(no);
%>
<%@ include file="./_header.jsp"%>

        <main id="board">
            <section class="modify">

                <form action="/Jboard1/proc/modifyProc.jsp" method="post">
                	<input type="hidden" name="no" value="<%= no%>">
                	<input type="hidden" name="pg" value="<%= pg%>">
                    <table border="0">
                        <caption>글수정</caption>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요." value="<%= board.getTitle() %>"/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content"><%= board.getContent() %></textarea>
                            </td>
                        </tr>
                        
                    </table>
                    
                    <div>
                        <a href="/Jboard1/view.jsp?no=<%= no %>&pg=<%= pg %>" class="btn btnCancel">취소</a>
                        <input type="submit" value="수정완료" class="btn btnComplete"/>
                    </div>
                </form>

            </section>
        </main>
<%@ include file="./_footer.jsp"%>