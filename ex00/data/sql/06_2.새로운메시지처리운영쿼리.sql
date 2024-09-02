update member am
set
    newMsgCnt = (select count(*) 
    from message m  where (acceptDate is null)
        and (m.accepterId = am.id))
;

select * from member;

select * from message;
        
commit;