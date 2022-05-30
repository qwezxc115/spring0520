USE mydb6;
DROP TABLE Member;
CREATE TABLE Member (
	id VARCHAR(20) PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL UNIQUE,
    nickName VARCHAR(20) NOT NULL UNIQUE,
    inserted DATETIME NOT NULL DEFAULT NOW()
);

-- 권한 테이블
CREATE TABLE Auth (
	memberId VARCHAR(20) NOT NULL,
    role VARCHAR(20) NOT NULL,
    FOREIGN KEY (memberId) REFERENCES Member(id)
);

ALTER TABLE Member
MODIFY COLUMN email VARCHAR(50) NOT NULL UNIQUE;

ALTER TABLE Member
MODIFY COLUMN password VARCHAR(100) NOT NULL;

DESC Member;

SELECT * FROM Member;
SELECT * FROM Auth;
INSERT INTO Auth
VALUES ('admin', 'ROLE_ADMIN');

INSERT INTO Auth (memberId, role)
(SELECT id, 'ROLE_USER' 
 FROM Member 
 WHERE id NOT IN (SELECT memberId FROM Auth));
 
-- Board 테이블에 Member의 id 참조하는 컬럼 추가
DESC Board;
ALTER TABLE Board
ADD COLUMN memberId VARCHAR(20) NOT NULL DEFAULT 'user' REFERENCES Member(id) AFTER body;

ALTER TABLE Board
MODIFY COLUMN memberId VARCHAR(20) NOT NULL;

SELECT * FROM Board ORDER BY 1 DESC;




