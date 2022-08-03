----------- drop -----------

drop SEQUENCE seq_prj_book;
drop SEQUENCE seq_prj_platform;
drop SEQUENCE seq_book_bookmark;
drop SEQUENCE seq_book_bookmemo;
drop TABLE prj_bookmark;
drop TABLE prj_bookmemo;
drop table prj_file_upload;
drop table prj_book;
drop TABLE prj_platform;

commit;

----------- create -----------
CREATE SEQUENCE seq_prj_book;
CREATE SEQUENCE seq_prj_platform;
CREATE SEQUENCE seq_book_bookmemo;
CREATE SEQUENCE seq_book_bookmark;

CREATE TABLE prj_book (
user_id VARCHAR2(20) --userID
, importance NUMBER(3) DEFAULT 0 --중요도
, book_no VARCHAR2(100) --글번호
, platform_id NUMBER(2)--플랫폼 아이디
, book_title VARCHAR2(100) NOT NULL --제목
, writer VARCHAR2(100) NOT NULL --작가
, star_rate NUMBER(1)  --별점
, book_comment VARCHAR2(100) --한줄평
, cur_page NUMBER(5) DEFAULT 0 --현재 회차
, total_page NUMBER(5) DEFAULT 0 --총 회차
, the_end NUMBER(1) DEFAULT 1 --완결 0 연재중 1
, reg_date DATE DEFAULT SYSDATE    -- 등록 날짜
-- , book_img clob -- 책 표지 이미지
, CONSTRAINT pk_book_no PRIMARY KEY (book_no)
);

CREATE TABLE prj_platform (
platform_id NUMBER(2) --플랫폼 아이디
, platform_name VARCHAR2(100) not null --플랫폼
, platform_link clob -- 플랫폼 링크
, CONSTRAINT pk_platform_no PRIMARY KEY (platform_id)
);

CREATE TABLE prj_bookmark(
    bookmark_no NUMBER(5)
    , book_no VARCHAR2(100) not null
    , bookmark_page NUMBER(5)not null
    , reg_date DATE DEFAULT SYSDATE
    , bookmark_content CLOB not null
    , CONSTRAINT pk_bookmark_no PRIMARY KEY (bookmark_no)
);


CREATE TABLE prj_bookmemo(
    bookmemo_no NUMBER(5)
    , book_no VARCHAR2(100) not null
    , reg_date DATE DEFAULT SYSDATE
    , bookmemo_content CLOB not null
    , CONSTRAINT pk_bookmemo_no PRIMARY KEY (bookmemo_no)
);

-- 첨부파일 정보를 가지는 테이블 생성
CREATE TABLE prj_file_upload (
    file_name VARCHAR2(150),
    reg_date DATE DEFAULT SYSDATE,
    bno VARCHAR2(100) NOT NULL
);



------------ Foreign key ----------------


ALTER TABLE prj_book
ADD CONSTRAINT fk_platform_id
FOREIGN KEY (platform_id)
REFERENCES prj_platform(platform_id);

ALTER TABLE prj_bookmark
ADD CONSTRAINT fk_book_no
FOREIGN KEY (book_no)
REFERENCES prj_book(book_no);


ALTER TABLE prj_bookmemo
ADD CONSTRAINT fk_book_no2
FOREIGN KEY (book_no)
REFERENCES prj_book(book_no);

-- PK, FK 부여
ALTER TABLE prj_file_upload
ADD CONSTRAINT pk_prj_file_name
PRIMARY KEY (file_name);

ALTER TABLE prj_file_upload
ADD CONSTRAINT fk_prj_file_upload
FOREIGN KEY (bno)
REFERENCES prj_book (book_no)
ON DELETE CASCADE; -- 게시글 지워지면 같이 사라진다

commit;

----------- insert into -----------

insert into prj_platform VALUES (seq_prj_platform.nextval, '카카오 페이지', 'https://page.kakao.com/main');
insert into prj_platform VALUES (seq_prj_platform.nextval, '네이버 시리즈', 'https://series.naver.com/novel/home.series?isWebtoonAgreePopUp=true');
insert into prj_platform VALUES (seq_prj_platform.nextval, '리디북스', 'https://ridibooks.com/webtoon/recommendation');
insert into prj_platform VALUES (seq_prj_platform.nextval, '문피아', 'https://www.munpia.com/?NaPm=ct%3Dl5z6meny%7Cci%3Dcheckout%7Ctr%3Dds%7Ctrx%3D%7Chk%3De875374da6b62f00a05d7e68449faa3cced00dde');
insert into prj_platform VALUES (seq_prj_platform.nextval, '조아라', 'https://www.joara.com/');
insert into prj_platform (platform_id, platform_name) VALUES (seq_prj_platform.nextval, '미분류');
commit;

SELECT
    * FROM prj_book;

SELECT
    * FROM prj_file_upload;