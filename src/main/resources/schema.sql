create table if not exists users
(
    id       integer(11) primary key auto_increment,
    name     varchar(100) not null,
    email    varchar(100) not null,
    password varchar(255) not null
);

create table if not exists roles
(
    id   integer(11) primary key auto_increment,
    name varchar(255) not null
);


create table if not exists messages
(
    id      integer(11) primary key auto_increment,
    content varchar(255) not null
);
create table if not exists user_role
(
    user_id integer(11) not null,
    role_id integer(11) not null,
    primary key (user_id, role_id)
);

create table if not exists persistent_logins
(
    username  varchar(100) not null,
    series    varchar(64) primary key,
    token     varchar(64)  not null,
    last_used timestamp    not null
);

CREATE INDEX IX_User_Role_Id ON user_role (user_id);
ALTER TABLE user_role
    ADD FOREIGN KEY (user_id) REFERENCES users (id);

CREATE INDEX IX_Role_User_Id ON user_role (role_id);
ALTER TABLE user_role
    ADD FOREIGN KEY (role_id) REFERENCES roles (id);
