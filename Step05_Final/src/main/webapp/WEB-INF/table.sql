CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL,
	saveFileName VARCHAR2(100) NOT NULL,
	fileSize NUMBER NOT NULL,
	regdate DATE);
	
CREATE SEQUENCE board_file_seq;