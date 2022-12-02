<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <main id="board">
            <section class="modify">
                <form action="/Farmstory22/board/modify.do" method="post">
                	<input type="hidden" name="group" value="${group}"/>
                	<input type="hidden" name="cate" value="${cate}"/>
                	<input type="hidden" name="no" value="${no}"/>
                    <table border="0">
                        <caption>글수정</caption>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요." value="${article.title}"/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content">${article.content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>파일</th>
                            <td>
                                <input type="file" name="fname" style="display:none;"/>
                            </td>
                        </tr>
                    </table>
                    
                    <div>
                        <a href="./view.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete"/>
                    </div>
                </form>

            </section>
        </main>
<jsp:include page="/_footer.jsp"/>