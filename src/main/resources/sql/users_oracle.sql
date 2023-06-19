DROP TABLE USERS;

CREATE TABLE USERS (
	ID	  VARCHAR2(20) CONSTRAINT USERS_ID_PK PRIMARY KEY,
	PASSWORD  VARCHAR2(100 char) NOT NULL,
	ROLE      VARCHAR2(20  char)
);

insert into users values ('python', '1234', 'USER');
insert into users values ('java',   '1234', 'ADMIN');
COMMIT;
