CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL,
	saveFileName VARCHAR2(100) NOT NULL,
	fileSize NUMBER NOT NULL,
	regdate DATE);
	
CREATE SEQUENCE board_file_seq;


SELECT *
FROM
	(SELECT result1.*, ROWNUM AS rnum
	FROM
		(SELECT num, writer, title, orgFileName, regdate
		FROM BOARD_FILE
		ORDER BY num DESC) result1)
WHERE rnum BETWEEN 1 AND 5


-- 게시글을 저장할 테이블
CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자(로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글내용
	viewCount NUMBER, --조회수
	regdate DATE --글작성일
);

--게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_seq;