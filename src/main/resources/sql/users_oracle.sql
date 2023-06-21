DROP TABLE USERS;

CREATE TABLE USERS (
	ID	      VARCHAR2(20) CONSTRAINT USERS_ID_PK PRIMARY KEY,
	PASSWORD  VARCHAR2(100 char) NOT NULL,
	ROLE      VARCHAR2(20  char)
);

insert into users values ('python', '$2a$10$YxXwI4s3DdSIC1QGBtp7v.VW/6k5juLvU8N6sodRU6mbOKQ5R5YyK', 'USER');
insert into users values ('java',   '$2a$10$NxzmqUQea91tZ/w0pm79Ou6Z1P37ceqAsJOZ9WxrDlg40Yk9PoLx.', 'ADMIN');

COMMIT;
