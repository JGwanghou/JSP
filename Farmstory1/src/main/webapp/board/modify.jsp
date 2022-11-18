<%@page import="bean.ArticleBean"%>
<%@page import="dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	String pg	 = request.getParameter("pg");
	String no	 = request.getParameter("no");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	pageContext.include("/board/_"+group+".jsp");
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	ArticleBean article = dao.selectArticle(no);
%>
        <main id="board">
            <section class="modify">

                <form action="./proc/modifyProc.jsp" method="post">
                		<input type="hidden" name="pg" value="<%= pg %>">
                		<input type="hidden" name="no" value="<%= no %>">
                		<input type="hidden" name="group" value="<%= group %>">
                		<input type="hidden" name="cate" value="<%= cate %>">
                    <table border="0">
                        <caption>글수정</caption>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요." value="<%= article.getTitle()%>"/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content"><%= article.getContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>파일</th>
                            <td>
                                <input type="file" name="file"/>
                            </td>
                        </tr>
                    </table>
                    
                    <div>
                        <a href="./view.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>&pg=<%= pg %>" class="btn btnCancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete"/>
                    </div>
                </form>

            </section>
        </main>
        </article>
</section>
</div>
<%@ include file="/_footer.jsp" %>