/* 
*    질문 답변에서 질문만 리스트로 가져오는 쿼리
*/
select no, title,
    (select count(*) - 1 from qna iq where iq.refNo = oq.refNo) anwCnt,
    id, writeDate,
    refNo, ordNo, levNo, parentNo
from qna oq 
where no = refNo
order by refNo, ordNo
;
/* 
*    질문 답변에서 글보기 데이터 가져오는 쿼리
*    질문/답변의 단계를 4단계까지만 하고 싶으면 levNo check(levNo between 0 and 3)
*/
select no, title,
     id, writeDate,
    refNo, ordNo, levNo, parentNo
from qna oq 
where refNo = 4
order by refNo, ordNo
;
/* */