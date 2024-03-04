show tables;

SELECT * FROM member;

CREATE TABLE IF NOT EXISTS developer(
	dno INT PRIMARY KEY auto_increment,				
	developer_title VARCHAR(255) NOT NULL,          -- 제목
	developer_content TEXT NULL,				-- 소개
	developer_skill TEXT NULL,					-- 기술스택
	developer_tendency VARCHAR(255),                -- 성향
	developer_school TEXT NULL,                 -- 학력사항
    uno INT NOT NULL,                               -- 회원번호(foreign Key)
	updatedate TIMESTAMP NULL DEFAULT now(),		-- 프로필 수정 시간
	viewcnt INT NULL DEFAULT 0,					    -- 조회수

	CONSTRAINT fk_developer
	FOREIGN KEY(uno) REFERENCES member(uno),
    CONSTRAINT fk_developer
);

CREATE TABLE IF NOT EXISTS dcareer (
    dno INT NOT NULL,
    job_name VARCHAR(255) NULL,
    job_period VARCHAR(255) NULL,
    job_responsibilities VARCHAR(255) NULL,

    CONSTRAINT fk_dcareer
    FOREIGN KEY(dno) REFERENCES developer(dno)
);

CREATE TABLE IF NOT EXISTS dlicense (
    dno INT NOT NULL,
    license_name VARCHAR(255),
    license_acqdate TIMESTAMP NULL,

    CONSTRAINT fk_dlicense
    FOREIGN KEY(dno) REFERENCES developer(dno)
);