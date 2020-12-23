-- 시퀀스
DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCYCLE NOCACHE;


-- 테이블
DROP TABLE MEMBER;
CREATE TABLE MEMBER
(
	MNO NUMBER PRIMARY KEY,
	MID VARCHAR2(30) NOT NULL UNIQUE,
	MPW VARCHAR2(30) NOT NULL,
	MNAME VARCHAR2(30),
	MEMAIL VARCHAR2(50) NOT NULL UNIQUE,
	MPHONE VARCHAR2(20),
	MADDRESS VARCHAR2(100),
	MREGDATE DATE
);

INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, 'admin', '1111', '관리자', 'admin@myhome.com', '010-0000-0000', 'seoul', SYSDATE);
