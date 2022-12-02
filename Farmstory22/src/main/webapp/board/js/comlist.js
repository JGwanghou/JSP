/**
 * 
 */
 
 function list(no){
	let jsonData = {
		"no":no
	};
	
	$.ajax({
		url:'/Farmstory22/comment/list.do',
		method:'get',
		data:jsonData,
		dataType:'json',
		success: function(data){
			let comlist = "<article>";
						comlist += "<span class='nick'>"+data.nick+"</span>";
						comlist += "<span class='date'>"+data.date+"</span>";
						comlist += "<p class='content'>"+data.content+"</p>";
						comlist += "<div>";
						comlist += "<a href='#' class='remove' data-no='"+no+"' data-parent='"+data.parent+"'>삭제</a>";
						comlist += "<a href='#' class='modify' data-no='"+no+"'>수정</a>";
						comlist += "</div>";							
						comlist += "</article>";
		}
	})
}