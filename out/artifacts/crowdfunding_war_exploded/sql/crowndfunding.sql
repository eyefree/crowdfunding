create database crowdfunding;

create table user_message(
                        username char (50) not null,
                        tel char (50) not null,
                        password char (50) not null,
                        email char (50) not null,
                        primary key (tel)
);
insert into user_message values ("test123", "13015614522", "test123", "123@qq.com");

create table ATTACHMENT
(
    ID          BIGINT not null,
    FILE_NAME   VARCHAR(100) not null,
    FILE_DATA   LONGBLOB not null,
    DESCRIPTION VARCHAR(255)
);


alter table ATTACHMENT
    add constraint ATTACHMENT_PK primary key (ID) ;