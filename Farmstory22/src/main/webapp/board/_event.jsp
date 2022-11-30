<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
    <div><img src="/Farmstory22/img/sub_top_tit4.png" alt="CROP TALK"></div>
    <section class="cate4">
        <aside>
            <img src="/Farmstory22/img/sub_aside_cate4_tit.png" alt="이벤트"/>

            <ul class="lnb">
                <li class="on"><a href="./event.do">이벤트</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory22/img/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
                <p>
                    HOME > 이벤트 > 
                    <c:if test="${cate eq 'event'}">
                    	<em>이벤트</em>
                    </c:if>
                </p>
            </nav>