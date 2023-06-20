-- MEMBER
SELECT *FROM MEMBER;
INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('hong', '123', '홍길동', 'hong@naver.com', '서울시 강남구', 'SKT', '010-1111-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('kim', '123', '김길동', 'kim@gmail.com', '서울시 동작구', 'SKT', '010-2222-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('song', '123', '송길동', 'song@korea.kr', '서울시 강북구', 'KT', '010-3333-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('lee', '123', '이길동', 'lee@gmail.com', '서울시 강서구', 'KT', '010-4444-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('park', '123', '박길동', 'park@daum.net', '서울시 영등포구', 'SKT', '010-5555-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('min', '123', '민길동', 'min@korea.kr', '서울시 어쩌구', 'SKT', '010-6666-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('jeon', '123', '전길동', 'jeon@gmail.com', '서울시 저쩌구', 'KT', '010-7777-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('son', '123', '손길동', 'son@daum.net', '서울시 오지구', 'KT', '010-8888-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('namgoong', '123', '남궁길동', 'namgoong@korea.kr', '서울시 지리구', 'SKT', '010-9999-1111');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('choi', '123', '최길동', 'choi@naver.com', '서울시 렛잇구', 'SKT', '010-1111-2222');

INSERT INTO MEMBER (MEMBER_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES('mtest', '123', ' 엠길동', 'mtest@naver.com', '서울시 렛잇구', 'SKT', '010-3431-2222');


-- GAME
SELECT *FROM GAME;
INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(1, '디 엑시트 이터널 매터스 ', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', '액션 어드벤처', 1,'죽음을 넘어선 생명을 느끼다');

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(2, '스트리트 파이터 6 디럭스', 'http://localhost:9000/uniquegames/images/img-game-street2.jpg', '격투', 1,'시리즈 최신작 『Street Fighter 6(스트리트 파이터 6)』');

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(3, '뱀파이어: 마스커레이드', 'http://localhost:9000/uniquegames/images/img-game-vampire2.jpg', '액션 어드벤처', 1,'월드 오브 다크니스에 오신 것을 환영합니다');

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(4, '더 라스트 오브 어스 파트 1', 'http://localhost:9000/uniquegames/images/img-game-last1.jpg', '액션', 1,'살기 위해 오늘도 길을 나선다 탐험 액션');


-- COMPANY
SELECT * FROM COMPANY;
INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('test', '123', 'test', 'test@gmail.com', '판교', 'KT', '010-3412-3144', 1);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('SS', '123', 'SONGGAME', 'SS@gmail.com', '판교', 'KT', '010-4444-7888', 2);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('DD', '123', 'DUCKGAME', 'DD@gmail.com', '판교', 'KT', '010-7777-3333', 3);

UPDATE COMPANY SET G_ID = 1 WHERE COMPANY_ID = 'test';

GRANT ALL PRIVILEGES ON *.* TO 'uniquegames'@'localhost' IDENTIFIED BY '1234';

-- ORDERS - COMPLETE
SELECT *FROM ORDERS;
SELECT ID, G_ID, GAME_IMG, GAMETITLE, AMOUNT FROM ORDERS WHERE PAYMENT_STATUS = 'NOT' AND M_ID = 'mtest';
SELECT ID, G_ID, GAME_IMG, GAMETITLE, AMOUNT FROM ORDERS WHERE PAYMENT_STATUS = 'COMPLETE' AND M_ID = 'mtest';

DELETE FROM ORDERS WHERE ID < 100000;

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(1, 'mtest', 'test', 1, 10000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(2, 'mtest', 'SS', 2, 30000, '스트리트 파이터 6 디럭스', 'http://localhost:9000/uniquegames/images/img-game-street2.jpg');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(3, 'mtest', 'SS', 3, 50000, '뱀파이어: 마스커레이드', 'http://localhost:9000/uniquegames/images/img-game-vampire2.jpg');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(4, 'mtest', 'DD', 4, 100000, '더 라스트 오브 어스 파트 1', 'http://localhost:9000/uniquegames/images/img-game-last1.jpg');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(11, 'mtest', 'test', 1, 10000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', 'COMPLETE', 'KAKAO', '2023-05-07');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(22, 'mtest', 'test', 2, 30000, '스트리트 파이터 6 디럭스', 'http://localhost:9000/uniquegames/images/img-game-street2.jpg', 'COMPLETE', 'KAKAO', '2022-12-24');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(33, 'mtest', 'test', 3, 50000, '뱀파이어: 마스커레이드', 'http://localhost:9000/uniquegames/images/img-game-vampire2.jpg', 'COMPLETE', 'KAKAO', '2023-06-19');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(44, 'mtest', 'test', 4, 100000, '더 라스트 오브 어스 파트 1', 'http://localhost:9000/uniquegames/images/img-game-last1.jpg', 'COMPLETE', 'KAKAO', '2023-02-01');

UPDATE ORDERS SET ORDER_DATE = '2022-12-15' WHERE ID = 26;

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(47, 'lee', 'test', 1, 10000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', 'COMPLETE', 'KAKAO', '2023-06-06');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(48, 'hong', 'test', 1, 100000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', 'COMPLETE', 'KAKAO', '2023-06-07');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(49, 'mtest', 'test', 1, 50000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', 'COMPLETE', 'KAKAO', '2023-06-07');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG, PAYMENT_STATUS, METHOD, ORDER_DATE)
VALUES(50, 'kim', 'test', 1, 30000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', 'COMPLETE', 'KAKAO', '2023-06-07');


COMMIT;