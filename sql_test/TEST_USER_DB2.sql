CREATE TABLE BBS (
NO    number(10) NOT NULL,
TITLE VARCHAR(255),
WRITER VARCHAR(100),
B_CONTENT VARCHAR(4000),
REGDATE date,
OK number(1) DEFAULT 1,
PRIMARY KEY (NO)
);

commit;

CREATE SEQUENCE bbs_seq START WITH 1 INCREMENT BY 1 MAXVALUE 100000 CYCLE NOCACHE;

INSERT INTO BBS VALUES(bbs_seq.NEXTVAL, 'DB�׽�Ʈ', '�����', 'DB�׽�Ʈ', sysdate, 1);
INSERT INTO BBS VALUES(bbs_seq.NEXTVAL, 'DB�׽�Ʈ', '�����2', 'DB�׽�Ʈ', sysdate, 1);

SELECT* FROM BBS;

alter table BBS add(COUNT int default 0);
alter table BBS drop (COUNT);