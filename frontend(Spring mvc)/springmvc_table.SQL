-- 회원 테이블
CREATE TABLE member_baseball (
    num NUMBER(15) NOT NULL,
    id VARCHAR2(10) NOT NULL,
    pwd VARCHAR2(10) NOT NULL,
    name VARCHAR2(50),
    email VARCHAR2(50),
    tel VARCHAR2(20),
    grade VARCHAR2(20),
    favteam VARCHAR2(50),
    rdate date default sysdate,
    gender VARCHAR2(10),
    CONSTRAINT member_baseball_PK PRIMARY KEY (num)
);
ALTER TABLE member_baseball ADD CONSTRAINT member_baseball_UK unique (id);
CREATE SEQUENCE member_baseball_seq
INCREMENT BY 1 START WITH 1;

-- loginlog 테이블
create table loginlog(
	num	number(15)	 ,
	idn	varchar2(10)	 ,
	reip	varchar2(20)	 ,
	uagent	varchar2(100)	 ,
	status	varchar2(10)	 ,
	rdate	date	 ,
	CONSTRAINT LOGINLOG_PK PRIMARY KEY (NUM)
);
CREATE SEQUENCE loginlog_seq
INCREMENT BY 1 START WITH 1;


-- 응원 게시판 테이블
create table    cheerboard(
   num   number(15)   not null ,
   favteam VARCHAR2(50),
   title   varchar2(100)   not null,
   content   varchar2(3000),
   writer   varchar2(20),
   hit NUMBER(10) DEFAULT 0,
   rdate DATE DEFAULT SYSDATE,
   cnt NUMBER(10) DEFAULT 0,
   CONSTRAINT cheerboard_PK PRIMARY KEY (NUM)
   );
CREATE SEQUENCE cheerboard_seq
INCREMENT BY 1 START WITH 1;

-- 응원 게시판 댓글 테이블 변경(수정버전)
CREATE TABLE cheerboard_comm (
    num NUMBER NOT NULL,
    ucode number NOT NULL,
    uwriter VARCHAR2(34),
    ucontent VARCHAR2(400),
    uregdate DATE DEFAULT SYSDATE,
    CONSTRAINT cheerboard_comm_pk PRIMARY KEY (ucode, num), -- 기본키를 ucode와 num의 조합으로 설정
    CONSTRAINT fk_cheerboard FOREIGN KEY (ucode) REFERENCES cheerboard(num) ON DELETE CASCADE
);
