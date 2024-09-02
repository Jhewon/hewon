-- 질문답변 테이블 스키마

-- 1. 객체 제거
DROP TABLE qna CASCADE CONSTRAINTS;

DROP SEQUENCE qna_seq;

-- 2. 객체 생성

CREATE TABLE qna
(
	no                    NUMBER  NOT NULL ,
	title                 VARCHAR2(300)  NOT NULL ,
	content               VARCHAR2(2000)  NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate ,
	refNo                 NUMBER  NOT NULL , -- 질문에 대한 관련 글 : 1차 정렬을 한다.
	ordNo                 NUMBER   DEFAULT  1 , -- 관련글 중에서의 순서번호 : 2차 정렬
	levNo                 NUMBER   DEFAULT  0 , -- 화면에 보여줄 들여쓰기
	parentNo              NUMBER  , -- 질문이 삭제되면 답변을 자동삭제하기 위한 컬럼
CONSTRAINT  XPK질문답변 PRIMARY KEY (no),
CONSTRAINT  R_7 FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE,
CONSTRAINT  R_8 FOREIGN KEY (refNo) REFERENCES qna(no),
CONSTRAINT  R_9 FOREIGN KEY (parentNo) REFERENCES qna(no) ON DELETE CASCADE
);

CREATE  SEQUENCE qna_seq;

-- 3. 샘플데이터
--  3-1. 최초 질문
insert into qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '자바란?', '자바란 무엇일까요?', 'test', qna_seq.nextval, 1, 0, null);
-- 3-2. 답변
update qna set ordNo = ordNo + 1 where refNo = 1 and ordNo >= 2;
insert into qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변]자바란?', '프로그래밍언어 / 자바란 무엇일까요?', 'admin', 1, 2, 1, 1);

insert into qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '오라클이란?', '오라클이란 무엇일까요?', 'test', qna_seq.nextval, 1, 0, null);

commit;

select * from qna q order by q.refNo desc, q.ordNo;
/*
select no, title,
    (select count(*) from qna iq where iq.refNo = oq.refNo) - 1 anwCnt,
    id, writeDate
from qna oq 
where no = refNo
order by refNo, ordNo
;
*/
