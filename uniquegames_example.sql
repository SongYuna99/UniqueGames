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
INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(1, 'DARK SOUL', 'http://localhost:9000/uniquegames/images/DS.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(2, 'ELDEN RING', 'http://localhost:9000/uniquegames/images/ER.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(3, 'RYTHME DOCTOR', 'http://localhost:9000/uniquegames/images/RD.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(4, 'FALL GUYS', 'http://localhost:9000/uniquegames/images/FG.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(5, 'GETTING OVER IT', 'http://localhost:9000/uniquegames/images/GOI.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(6, 'BABA IS YOU', 'http://localhost:9000/uniquegames/images/BIY.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(7, 'ALT F4', 'http://localhost:9000/uniquegames/images/AF.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(8, '60 SECONDS', 'http://localhost:9000/uniquegames/images/60S.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(9, 'AMONG US', 'http://localhost:9000/uniquegames/images/AU.png', '몰루', 1);

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS)
VALUES(10, 'ANGVIK', 'http://localhost:9000/uniquegames/images/ANG.png', '몰루', 1);


-- COMPANY
SELECT * FROM COMPANY;
INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('AA', '123', 'GOODGAME', 'AA@gmail.com', '판교', 'KT', '010-7777-7888', 1);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('SS', '123', 'SONGGAME', 'SS@gmail.com', '판교', 'KT', '010-4444-7888', 2);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('DD', '123', 'DUCKGAME', 'DD@gmail.com', '판교', 'KT', '010-7777-3333', 3);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('FF', '123', 'FALLGAME', 'FF@gmail.com', '판교', 'KT', '010-7777-7777', 4);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('QQ', '123', 'QQQGAME', 'QQ@gmail.com', '판교', 'KT', '010-1212-7888', 5);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('WW', '123', 'WOWGAME', 'WW@gmail.com', '판교', 'KT', '010-7777-3434', 6);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('EE', '123', 'EEGAME', 'EE@gmail.com', '판교', 'KT', '010-2456-7888', 7);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('RR', '123', 'RRGAME', 'RR@gmail.com', '판교', 'KT', '010-7777-8973', 8);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('TT', '123', 'TANKGAME', 'TT@gmail.com', '판교', 'KT', '010-5365-1646', 9);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM, G_ID)
VALUES ('YY', '123', 'YAYGAME', 'YY@gmail.com', '판교', 'KT', '010-3757-8966', 10);

INSERT INTO COMPANY (COMPANY_ID, PASSWORD, NAME, EMAIL, ADDR, TEL, PHONE_NUM)
VALUES ('test', '123', 'test', 'test@gmail.com', '판교', 'KT', '010-3412-3144');

-- ORDERS - NOT
SELECT *FROM ORDERS;
COMMIT;
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(357, 'hong', 'AA', 1, 10000, 'DARK SOUL', 'http://localhost:9000/uniquegames/images/DS.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(2, 'hong', 'SS', 2, 100000, 'ELDEN RING', 'http://localhost:9000/uniquegames/images/ER.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(3, 'hong', 'DD', 3, 30000, 'RYTHME DOCTOR', 'http://localhost:9000/uniquegames/images/RD.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(4, 'hong', 'FF', 4, 50000, 'FALL GUYS', 'http://localhost:9000/uniquegames/images/FG.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(5, 'hong', 'WW', 6, 50000, 'BABA IS YOU', 'http://localhost:9000/uniquegames/images/BIY.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(6, 'hong', 'RR', 8, 100000, '60 SECONDS', 'http://localhost:9000/uniquegames/images/60S.png');


INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(555, 'mtest', 'FF', 4, 10000, 'FALL GUYS', 'http://localhost:9000/uniquegames/images/FG.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(4444, 'mtest', 'WW', 6, 50000, 'BABA IS YOU', 'http://localhost:9000/uniquegames/images/BIY.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(8888, 'mtest', 'RR', 8, 100000, '60 SECONDS', 'http://localhost:9000/uniquegames/images/60S.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(34234, 'mtest', 'RR', 8, 1000, '60 SECONDS', 'http://localhost:9000/uniquegames/images/60S.png');


-- ORDERS - COMPLETE
SELECT *FROM ORDERS;
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, ORDER_DATE, AMOUNT, METHOD, PAYMENT_STATUS, GAMETITLE, GAME_IMG)
VALUES(123, 'mtest', 'RR', 8, '2023-01-02', 10000, 'KAKAO', 'COMPLETE', '60 SECONDS', 'http://localhost:9000/uniquegames/images/60S.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, ORDER_DATE, AMOUNT, METHOD, PAYMENT_STATUS, GAMETITLE, GAME_IMG)
VALUES(1223, 'mtest', 'AA', 1, '2023-02-02', 50000, 'KAKAO', 'COMPLETE', 'DARK SOUL', 'http://localhost:9000/uniquegames/images/DS.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, ORDER_DATE, AMOUNT, METHOD, PAYMENT_STATUS, GAMETITLE, GAME_IMG)
VALUES(93, 'mtest', 'EE', 7, '2023-03-03', 50000, 'KAKAO', 'COMPLETE', 'ALT F4', 'http://localhost:9000/uniquegames/images/AF.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, ORDER_DATE, AMOUNT, METHOD, PAYMENT_STATUS, GAMETITLE, GAME_IMG)
VALUES(11230, 'mtest', 'WW', 6, '2022-11-02', 10000, 'KAKAO', 'COMPLETE', 'BABA IS YOU', 'http://localhost:9000/uniquegames/images/BIY.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, ORDER_DATE, AMOUNT, METHOD, PAYMENT_STATUS, GAMETITLE, GAME_IMG)
VALUES(131, 'mtest', 'FF', 4, '2023-01-13', 30000, 'KAKAO', 'COMPLETE', 'FALL GUYS', 'http://localhost:9000/uniquegames/images/FG.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, ORDER_DATE, AMOUNT, METHOD, PAYMENT_STATUS, GAMETITLE, GAME_IMG)
VALUES(132, 'mtest', 'SS', 2, '2023-01-17', 30000, 'KAKAO', 'COMPLETE', 'ELDEN RING', 'http://localhost:9000/uniquegames/images/ER.png');

INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(55124598, 'mtest', 'FF', 4, 10000, 'FALL GUYS', 'http://localhost:9000/uniquegames/images/FG.png');
COMMIT;
SELECT *FROM ORDERS where m_id='mtest';

SELECT ROW_NUMBER() OVER(ORDER BY AMOUNT DESC) AS RNO, 
			
		DATE_FORMAT(ORDER_DATE, '%y-%m-%d') ORDER_DATE, GAMETITLE, AMOUNT FROM ORDERS 
		WHERE M_ID = 'mtest' AND PAYMENT_STATUS = 'COMPLETE' ;

SELECT ID, G_ID, GAME_IMG, GAMETITLE, AMOUNT 
		FROM ORDERS WHERE PAYMENT_STATUS = 'NOT' AND M_ID = 'mtest';
        
        
GRANT ALL PRIVILEGES ON *.* TO 'uniquegames'@'localhost' IDENTIFIED BY '1234';
DELETE FROM GAME WHERE ID < 100;
SELECT *FROM GAME;
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(6607, 'mtest', 'test', 1, 10000, '디 엑시트 이터널 매터스', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(5899, 'mtest', 'test', 2, 30000, '스트리트 파이터 6 디럭스', 'http://localhost:9000/uniquegames/images/img-game-street2.jpg');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(4874, 'mtest', 'test', 3, 50000, '뱀파이어: 마스커레이드', 'http://localhost:9000/uniquegames/images/img-game-vampire2.jpg');
INSERT INTO ORDERS (ID, M_ID, C_ID, G_ID, AMOUNT, GAMETITLE, GAME_IMG)
VALUES(2038, 'mtest', 'test', 4, 100000, '더 라스트 오브 어스 파트 1', 'http://localhost:9000/uniquegames/images/img-game-last1.jpg');

INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(1, '디 엑시트 이터널 매터스 ', 'http://localhost:9000/uniquegames/images/img-game-deexit4.jpg', '액션 어드벤처', 1,'죽음을 넘어선 생명을 느끼다');
INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(2, '스트리트 파이터 6 디럭스', 'http://localhost:9000/uniquegames/images/img-game-street2.jpg', '격투', 1,'시리즈 최신작 『Street Fighter 6(스트리트 파이터 6)』');
INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(3, '뱀파이어: 마스커레이드', 'http://localhost:9000/uniquegames/images/img-game-vampire2.jpg', '액션 어드벤처', 1,'월드 오브 다크니스에 오신 것을 환영합니다');
INSERT INTO GAME (ID, NAME, IMAGE_PATH, GAME_GENRE, DONATION_STATUS, DESCRIPTION)
VALUES(4, '더 라스트 오브 어스 파트 1', 'http://localhost:9000/uniquegames/images/img-game-last1.jpg', '액션', 1,'살기 위해 오늘도 길을 나선다 탐험 액션');

COMMIT;