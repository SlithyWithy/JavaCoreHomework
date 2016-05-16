CREATE TABLE USERS (
    ID INT NOT NULL,
    USERNAME VARCHAR(30),
    EMAIL VARCHAR(30),
    PASSWORD VARCHAR(20),
    YEAROFBIRTH INT NOT NULL
);

ALTER TABLE USERS ADD CONSTRAINT PK_USERS PRIMARY KEY (ID);
ALTER TABLE USERS ADD CONSTRAINT CK_EMAIL_USERS CHECK EMAIL LIKE '%@%.%';
ALTER TABLE USERS ADD CONSTRAINT CK_PASSWORD_USERS CHECK LENGTH(PASSWORD) > 5;
ALTER TABLE USERS ADD CONSTRAINT CK_YEAROFBIRTH_USERS CHECK YEAROFBIRTH > 1900;



CREATE TABLE COOKIES (
    ID INT NOT NULL,
    COOKIE VARCHAR(30),
    MESSAGE VARCHAR(100),
    EXPIRED DATE NOT NULL
);

ALTER TABLE COOKIES ADD CONSTRAINT PK_COOKIES PRIMARY KEY (ID);



CREATE TABLE METADATA (
    ID INT NOT NULL AUTO_INCREMENT,
    USERS_ID INT,
    COOKIES_ID INT,
    TIME_ADDED TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ENABLED BOOL DEFAULT TRUE 
);

ALTER TABLE METADATA ADD CONSTRAINT PK_METADATA PRIMARY KEY (ID);
ALTER TABLE METADATA ADD CONSTRAINT FK_METADATA_1 FOREIGN KEY (USERS_ID) REFERENCES USERS (ID);
ALTER TABLE METADATA ADD CONSTRAINT FK_METADATA_2 FOREIGN KEY (COOKIES_ID) REFERENCES COOKIES (ID);
CREATE INDEX METADATA_IDX1 ON METADATA (TIME_ADDED); 