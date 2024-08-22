/**
 * Utility 프로그램
 * 댓글의 페이지 네이션 
 */
 
 // 댓글 페이지 네이션 태그들의 문자열을 만들어서 넘겨준다.
 function replyPagination(pageObject){
 
	let str = "";
	str += "<li class=\"page-item";

	// 이전 페이지 처리 :  disabled 추가 여부 - 이전 페이지가 없으면 disabled 붙인다.
	if(pageObject.startPage == 1) str += " disabled ";
	
	str += "\"  data-page=\""+ (pageObject.startPage - 1) +" \"> <a class=\"page-link\" href=\"#\">Previous</a></li>";
	
	// startPage 부터 endPage 까지 반복 처리 한다 페이지 만들어 내기
	for(i = pageObject.startPage; i <= pageObject.endPage; i++){
		str += "<li class=\"page-item";
		if(i == pageObject.page) str += " active ";
		str += "\" data-page=\""+i+"\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>";
	} 
	
	// 다음 페이지 - endPage 가 10 이면 11로 보내는 처리
	
	str += "<li class=\"page-item";
	if(pageObject.endPage >= pageObject.totalPage) str += " disabled ";
		
	str +="\" data-page=\""+(pageObject.endPage + 1)+"\"><a class=\"page-link\" href=\"#\">Next</a></li>";
	
	return str;
 
 }