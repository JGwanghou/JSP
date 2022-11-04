<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script>

	$(function(){
		
		$('.btnNext').click(function(){
			
			let check1 = $('input[class=terms]').is(':checked');
			let check2 = $('input[class=privacy]').is(':checked');
			
			if(check1 && check2){
				return true;
			}else{
				alert('동의 체크를 완료해주세요');
				return false;
			}
		});
	})
	
</script>

<%
	TermsBean tb = UserDAO.getInstance().selectTerms();
%>
<main id="user">
    <section class="terms">
        <table border="1">
            <caption>사이트 이용약관</caption>
            <tr>
                <td>
                    <textarea name="terms"><%= tb.getTerms() %></textarea>
                    <label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
                </td>
            </tr>
        </table>

        <table border="1">
            <caption>개인정보 취급방침</caption>
            <tr>
                <td>
                    <textarea name="privacy"><%= tb.getPrivacy()  %></textarea>
                    <label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
                </td>
            </tr>
        </table>
        
        <div>
            <a href="/Jboard1/user/login.jsp" class="btn btnCancel">취소</a>
            <a href="/Jboard1/user/register.jsp" class="btn btnNext">다음</a>
        </div>

    </section>
</main>
<%@ include file="./_footer.jsp" %>       