<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2 manager</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/list.js"></script>
		<script src="./js/register.js"></script>
		<script src="./js/modify.js"></script>
		<script>
		$(document).ready(function(){
			
			// user2 목록 불러오기
			list();
			
			// user2 목록화면
			$(document).on('click', '#userList', function(e){
				e.preventDefault();
				list();
			});
			
			// user2 등록화면
			$(document).on('click', '#userAdd', function(e){
				e.preventDefault();
				register();
			});
			
			// user2 등록하기
			$(document).on('click', '#btnRegister', function(){
				
				//데이터가져오기
				let uid	 = $('input[name=uid]').val();
				let name = $('input[name=name]').val();
				let hp	 = $('input[name=hp]').val();
				let age	 = $('input[name=age]').val();
				
				// json객체
				let jsonData = {
						"uid":uid,
						"name":name,
						"hp":hp,
						"age":age, 
				};
				
				// 데이터 전송
				$.ajax({
					url:'./data/register.jsp',
					method:'post',
					data: jsonData,
					dataType:'json',
					success: function(data){
						if(result == 1){
							alert('입력이 성공되었습니다.');
						}else{
							alert('입력을 실패하였습니다.');
						}
						list();
					}
				});
				
			});
			
			// user2 수정화면
			$(document).on('click', '.userModify', function(e){
				e.preventDefault();				
				let user = $(this).parent().parent().children('td');
				modify(user);
			});
			
			// user2 수정하기
			$(document).on('click', '#btnModify', function(){
				let uid	 = $('input[name=uid]').val();
				let name = $('input[name=name]').val();
				let hp	 = $('input[name=hp]').val();
				let age	 = $('input[name=age]').val();
				
				let jsonData = {
						"uid":uid,
						"name":name,
						"hp":hp,
						"age":age
				}
				
				$.ajax({
					url:'./data/modify.jsp',
					type:'post',
					data:jsonData,
					dataType:'json',
					success: function(data){
						if(result == 1){
							alert('수정 완료!');
							
						}else{
							alert('수정 실패!');
						}
						list();
					}
				});
				
			})
			
			// user2 삭제
			$(document).on('click', '.userDelete', function(){
				let uid = $(this).parent().parent().children('td:eq(0)').text();
				
				let jsonData = {
						"uid":uid
				};
				
				$.ajax({
					url:'./data/delete.jsp',
					method:'post',
					data:jsonData,
					dataType:'json',
					success: function(data){
						if(data.result == 1){
							alert('삭제 성공!');
						}else{
							alert('삭제 실패!');
						}
						list();
					}
					
				});
			});
			
		});
		</script>
	</head>
	<body>
		<h3>user2 관리자</h3>
		
		<nav></nav>
		<section></section>
		
	</body>
</html>