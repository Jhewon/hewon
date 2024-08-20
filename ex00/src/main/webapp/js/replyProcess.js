/**
 * reply Service 객체를 이용한 댓글 처리 코드
 */
 
 replyService.list(1,
 // 데이터 가져오기 성공했을 때 실행되는 함수 -> html 테그를 만들어서 표시하는 함수 실행
 function(data){
 		// data의 구조 - {list[] , pageObject}
 		let list = data.list;
 		// ul tag 안에 들어가는 문자열
 		let str = "";
 		
 		//  데이터가 없는 경우의 처리
 		if(list == null || list.length == 0){
 			$(".chat").html("<li>데이터가 존재 하지 않습니다!");
 			return;
 		}
 		
 		// 데이터가 있는 경우의 처리
 		for(let i = 0 ; i < list.length ; i ++){
 			str +=	"<li class=\"left clearfix\"  data-rno=\""+list[i].rno+"\">";
				str += "<div>";
				str +=	"<div class=\"header\">";
				str +=	"<strong class=\"primary-font\"> " +list[i].name + "("+ list[i].id +")</strong>";
				str +=	"<small class=\"pull-right text-muted\">"
							+ toDateTime(list[i].writeDate) + "</small>";
				str +=	"</div>";			 
				str += 	"<p><pre>" + list[i].content + "</pre></p>";
				str += "</div>";
				str += "</li>";
 		}// end for
 		$(".chat").html(str);
 	}
 );