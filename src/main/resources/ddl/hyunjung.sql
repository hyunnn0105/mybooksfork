-- 첨부파일 정보를 가지는 테이블 생성
CREATE TABLE prj_file_upload (
    file_name VARCHAR2(150),
    reg_date DATE DEFAULT SYSDATE,
    bno VARCHAR2(100) NOT NULL
);

-- PK, FK 부여
ALTER TABLE prj_file_upload
ADD CONSTRAINT pk_prj_file_name
PRIMARY KEY (file_name);

ALTER TABLE prj_file_upload
ADD CONSTRAINT fk_prj_file_upload
FOREIGN KEY (bno)
REFERENCES prj_book (book_no)
ON DELETE CASCADE; -- 게시글 지워지면 같이 사라진다

SELECT * FROM prj_file_upload;