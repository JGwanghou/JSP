<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<script src="/Farmstory22/js/validation.js"></script>
<script src="/Farmstory22/js/zipcode.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <main id="user">
            <section class="register">
                <form action="/Farmstory22/user/userModify.do" method="post">
                    <table border="1">
                        <caption>회원정보 수정</caption>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력" readonly value="${sessUser.uid}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                            	<input type="password" name="pass1" placeholder="비밀번호 입력"/>
                            	<span class="passResult"></span>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                        </tr>
                    </table>

                    <table border="1">
                        <caption>개인정보 입력</caption>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력" value="${sessUser.name}"/>                        
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                                <input type="text" name="nick" placeholder="별명 입력" value="${sessUser.nick}"/>
                                <button type="button" id="btnNickCheck"><img src="/Farmstory22/img/chk_id.gif" alt="중복확인"/></button>
                                <span class="nickResult"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력" value="${sessUser.email}"/>
                                <span class="emailResult"></span>
                                <button type="button" id="btnEmailAuth"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>
                                <div class="auth">
                                    <input type="text" name="auth" placeholder="인증번호 입력"/>
                                    <button type="button" id="btnEmailConfirm"><img src="/Farmstory22/img/chk_confirm.gif" alt="확인"/></button>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" name="hp" placeholder="휴대폰 입력" value="${sessUser.hp}"/></td>
                        </tr>
                        
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type="text" name="zip" id="zip" placeholder="우편번호" value="${sessUser.zip}"/>
                                <button type="button" onclick="zipcode()"><img src="/Farmstory22/img/chk_post.gif" alt="우편번호찾기"/></button>
                                <input type="text" name="addr1" id="addr1" placeholder="주소 검색" value="${sessUser.addr1}"/>
                                <input type="text" name="addr2" id="addr2" placeholder="상세주소 입력" value="${sessUser.addr2}"/>
                            </td>
                        </tr>
                    </table>

                    <div>
                        <a href="./index.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="수정" class="btn btnRegister"/>
                    </div>

                </form>

            </section>
        </main>
<jsp:include page="../_footer.jsp"/>