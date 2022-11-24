<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>

        <main id="board">
            <section class="list">                
                <form action="#">
                    <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
                    <input type="submit" value="검색">
                </form>
                
                <table border="0">
                    <caption>글목록</caption>
                    
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>                    
                    <tr>
                        <td>${articles.no}</td>
                        <td>${articles.title}</td>
                        <td>${articles.nick}</td>
                        <td>${articles.rdate}</td>
                        <td>${articles.hit}</td>
                    </tr>
                </table>

                <div class="page">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num current">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="next">다음</a>
                </div>
                <a href="./write.html" class="btn btnWrite">글쓰기</a>
            </section>
        </main>
<jsp:include page="./_footer.jsp"/>        
        