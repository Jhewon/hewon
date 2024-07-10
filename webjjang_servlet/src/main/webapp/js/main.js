/**
 * main 에서 사용하는 js
 */
$(function(){
	$(".dataRow").click(function(){
		//alert("클릭");
			let no = $(this).find(".no").text();
			console.log("no = " + no);
			
		// 어떤 모듈을 클릭했는지 알아내 보자.
		if($(this).hasClass("board")){
			location="/board/view.do?no=" + no+"&inc=1";
			
		}
		else if($(this).hasClass("image")){
			location="/image/view.do?no=" + no+"&inc=0";
		}
	});
	
});