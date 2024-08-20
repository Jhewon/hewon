/**
 * 일반 게시판 댓글 처리 객체
 */

// 이곳이 실행이 되는지 확인 할 수 있다.
console.log("Board Reply Module .........................");

// 일반 게시판 댓글을 처리하는 객체 선언 - jquery의 ajax 사용 : ajax(), getJSON(), get(), post()
let replyService = {
	
	// 1. 일반 게시판 댓글 리스트 처리 함수 - replyService.list(page, 성공함수 , 실패함수);
	"list" : function(page,callback,error){
		console.log("댓글 리스트 ----------------------");
		// page가 없으면 1로 세팅한다.
		if(!page) page = 1;
		console.log("page : " + page + ", no : " + no);
		
		// ajax 형태를 만들어 처리한다. - getJSON()
		$.getJSON(
			"/boardreply/list.do?page=" + page + "&no=" + no,
			// 데이터 가져오기를 성고하면 실행되는 함수. data가 서버에서 넘겨주는 JSON 데이터
			function(data){
				console.log(data);
				console.log(JSON.stringify(data));
				// callback 이 있으면 실행하자
				if(callback) callback(data);
			}
		).fail(function(xhr , status ,err){
			console.log("데이터 가져오기 오류----------------------------------------");
			console.log("xhr" + xhr);
			console.log("status" + status);
			console.log("err" + err);
			// callback 이 있으면 실행 -> html 테그를 만들어서 표시하는 함수 실행
			if(error) error();
			 else alert("댓글 데이터 를 가져 오는중 오류 발생");
		});
	},

	// 2. 일반 게시판 댓글 등록 처리 함수 - replyService.write(댓글객체, 성공함수, 실패함수);
	"write" : function(reply, callback, error){
		console.log("댓글 등록 ----------------------");
	},

	// 3. 일반 게시판 댓글 수정 처리 함수 - replyService.update(댓글객체, 성공함수, 실패함수);
	"update" : function(reply, callback, error){
		console.log("댓글 수정 ----------------------");
	},

	// 일반 게시판 댓글 리스트 처리 함수 - replyService.delete(rno, 성공함수, 실패함수);
	"delete" : function(rno, callback, error){
		console.log("댓글 삭제 ----------------------");
	}

};