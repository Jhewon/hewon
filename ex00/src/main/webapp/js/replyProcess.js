/**
 * reply Service 객체를 이용한 댓글 처리 코드
 */
 function showList(page){
 replyService.list(page,
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
				str += 	"<p><pre class=\"replyContent\">" + list[i].content + "</pre></p>";
				
				if(id == list[i].id){
				str += "<div>";
				str += "<button class=\"replyUpdateBtn   btn btn-dark btn-sm\">";
				str += "수정</button>";
				
				str += "<button class=\"replyDeleteBtn   btn btn-danger btn-sm\">";
				str += "삭제</button>";
				str += "</div>";
				}
				str += "</div>";
				str += "</li>";
 		}// end for
 		$(".chat").html(str);
 	}
 	);
 };
 // 일반게시판 글보기가 처음에 보여질때 댓글 리스트 보이기 실행
 showList(1);
 
 // HTML 이 로딩이 된 상태에서 실행한다.
 $(function(){
 	// 이벤트 처리
 	// 새로운 댓글 등록 모달 창 보이기 이벤트
 	$("#newReplyBtn").click(function(){
 		$("#replyModal .modal-title").text("댓글 등록");
 		$("#replyContent").val(""); // 댓글 내용 지우기 
 	 		// 버튼 처리
 		$("#replyWriteBtn").show();	
 		$("#replyUpdateBtn").hide();
 	});
 	
 	
 	// 댓글 등록 모달 창에서의 등록 처리
 	$("#replyWriteBtn").click(function(){

 		// alert("댓글등록");
 		// 댓글 등록에 필요한 데이터(no,content) 수정
 		let reply = {no : no, content : $("#replyContent").val()};
 		//alert(JSON.stringify(reply));
 		replyService.write(reply,
 		function(result){
 			$("#replyModal").modal("hide");
 			//alert(result);
 			$("#msgModal .modal-body").text(result);
 			$("#msgModal").modal("show");
 			// 댓글 리스트 데이터가 변경 되었으므로 리스트를 다시 불러온다.
 			showList(1);
 		});
 	}); // 모달 등록 처리 끝
 	
 	// 댓글 수정 버튼 
 	// 맨앞에 선택자는 새로 만들어서 진 게 아닌 원래 있었던 객체를 선택 해주세요.
 	// 그 앞 만들어진 HTML 에서 find를 이용해서 다시 찾아사 함수를 전달해서 사용한다. -> 이벤트위 위임
 	$(".chat").on("click",".replyUpdateBtn",function(){
 		//alert("수정 버튼 클릭");
 		
 		// 버튼 처리
 		$("#replyWriteBtn").hide();	
 		$("#replyUpdateBtn").show();
 			
 		let li = $(this).closest("li");
 		$("#replyModal .modal-title").text("댓글 수정");
 		$("#replyRno").val(li.data("rno")); // 댓글 번호 채우기
 		$("#replyContent").val(li.find(".replyContent").text()); // 댓글 내용 채우기
 		$("#replyModal").modal("show");
 		 
 	}); // 댓글 수정 끝
 	
 	// 댓글 삭제 버튼
 	$(".chat").on("click",".replyDeleteBtn",function(){
 		alert("삭제 버튼 클릭");
 	}); // 댓글 삭제 끝
 });
 
 