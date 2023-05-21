CREATE TABLE MEMBER (
                        ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        MEMBER_ID VARCHAR(15) NOT NULL,
                        PASSWORD VARCHAR(15),
                        NAME VARCHAR(15),
                        EMAIL VARCHAR(30) NOT NULL,
                        PHONE_NUM VARCHAR(20) NOT NULL,
                        ADDR VARCHAR(100),
                        GENDER VARCHAR(1),
                        TEL VARCHAR(20) NOT NULL
);

CREATE TABLE COMPANY (
                         ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         COMPANY_ID VARCHAR(15) NOT NULL,
                         PASSWORD VARCHAR(15),
                         NAME VARCHAR(15),
                         ADDR VARCHAR(100)
);

CREATE TABLE NOTICE (
                        POST_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        COMPANY_ID VARCHAR(15) NOT NULL,
                        TITLE VARCHAR(50),
                        CONTENT VARCHAR(300),
                        NOTICE_HITS INT,
                        NOTICE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY(COMPANY_ID)
);

CREATE TABLE COMMENT (
                         COMMENT_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         POST_ID INT NOT NULL,
                         MEMBER_ID VARCHAR(15) NOT NULL,
                         COMMENT_CONTENT VARCHAR(50),
                         COMMENT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (POST_ID) REFERENCES NOTICE(POST_ID),
                         FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);

CREATE TABLE ORDERS (
                        ORDER_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        MEMBER_ID INT NOT NULL,
                        COMPANY_ID INT NOT NULL,
                        DONATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
                        DON_AMOUNT INT NOT NULL,
                        PAY_METHOD VARCHAR(20) NOT NULL,
                        REFUND VARCHAR(20),
                        FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(ID),
                        FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY(ID)
);
