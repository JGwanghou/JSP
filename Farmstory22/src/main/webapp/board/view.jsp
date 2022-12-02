<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		
		$('.commentForm > form').submit(function(){
			
			let uid	 = $(this).children('input[name=uid]').val();
			let no	 = $(this).children('input[name=no]').val();
			let textarea = $('.commentForm > form > textarea[name=content]');
			let content  = textarea.val();
			
			if(content == ''){
				alert('댓글을 입력하세요!');
			}
			
			let jsonData = {
					"uid":uid,
					"no":no,
					"content":content
			};
			
			$.ajax({
				url:'/Farmstory22/board/view.do',
				method:'POST',
				data:jsonData,
				dataType:'json',
				success: function(data){
					console.log(data)
					
					if(data.result > 0){
						let article = "<article>";
						article += "<span class='nick'>"+data.nick+"</span>";
						article += "<span class='date'>"+data.date+"</span>";
						article += "<p class='content'>"+data.content+"</p>";
						article += "<div>";
						article += "<a href='#' class='remove' data-no='"+no+"' data-parent='"+data.parent+"'>삭제</a>";
						article += "<a href='#' class='modify' data-no='"+no+"'>수정</a>";
						article += "</div>";							
						article += "</article>";	
					
						$('.commentList > .empty').hide();
						
						$('.commentList').append(article);
						textarea.val('');
					}
					
				}
			})
		});
		
		$(document).on('click','.modify',function(e){
			e.preventDefault();
			
			let txt		 = $(this).text();
			let p_tag	 = $(this).parent().prev();
			
			if(txt == '수정'){
				// 수정모드
				$(this).text('수정완료');
				p_tag.attr('contentEditable', true);
				p_tag.focus();
			}else{
				// 수정완료
				$(this).text('수정');
				let no = $(this).attr('data-no');
				let content = p_tag.text();
				
				let jsonData = {
						"no":no,
						"content":content
				};
				
				$.ajax({
					url:'/Farmstory22/modifycomment.do',
					method:'get',
					data:jsonData,
					dataType:'json',
					success: function(data){
						
						if(data.result == 1){
							alert('수정이 완료 됐어요');
							p_tag.attr('contentEditable', false);
						}
						
					}
				})
			}
		})
		
	})
</script>
        <main id="board">
            <section class="view">
                
                <table border="0">
                    <caption>글보기</caption>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" value="${avo.title}" readonly/></td>
                    </tr>
                    <tr>
                        <th>파일</th>
                        <td><a href="#">${avo.oriName}</a>&nbsp;<span>${avo.download}</span>회 다운로드</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content" readonly>${avo.content}</textarea>
                        </td>
                    </tr>                    
                </table>
                
                <div>
                    <a href="./delete.do?group=${group}&cate=${cate}&no=${avo.no}" class="btn btnRemove">삭제</a>
                    <a href="./modify.do?group=${group}&cate=${cate}&no=${avo.no}" class="btn btnModify">수정</a>
                    <a href="./list.do?group=${group}&cate=${cate}" class="btn btnList">목록</a>
                </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                    <h3>댓글목록</h3>                   
					<c:forEach var="comment" items="${comments}">
                    <article>
                        <span class="nick">${comment.nick}</span>
                        <span class="date">${comment.rdate.substring(2, 10)}</span>
                        <p class="content">${comment.content}</p>
                        <c:if test="${sessUser.uid ne null }">                        
                        <div>
                            <a href="#" class="remove" data-no="${comment.no}" data-parent="${comment.parent}">삭제</a>
                            <a href="#" class="modify" data-no="${comment.no}">수정</a>
                        </div>
                        </c:if>
                    </article>
                    </c:forEach>
                    
                    <c:if test="">
                    <p class="empty">등록된 댓글이 없습니다.</p>
					</c:if>
                </section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="#">
                    	<input type="hidden" name="uid" value="${avo.uid}"/>
                    	<input type="hidden" name="no" value="${avo.no}"/>
                    	<input type="hidden" name="group" value="${group}"/>
                    	<input type="hidden" name="cate" value="${cate}"/>
                        <textarea name="content" placeholder="댓글을 입력하세요"></textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" value="작성완료" class="btn btnComplete"/>
                        </div>
                    </form>
                </section>

            </section>
        </main>
<jsp:include page="../_footer.jsp"/>