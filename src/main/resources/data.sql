

create table if not exists users (
    id integer(11) primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null,
    password varchar(255) not null
);

create table if not exists roles (
    id integer(11) primary key auto_increment,
    name varchar(255) not null
);


create table if not exists messages (
    id integer(11) primary key auto_increment,
    content varchar(255) not null
);
create table if not exists user_role (
    user_id integer(11) not null,
    role_id integer(11) not null,
    primary key (user_id,role_id)
);

create table if not exists persistent_logins (
  username varchar(100) not null,
  series varchar(64) primary key,
  token varchar(64) not null,
  last_used timestamp not null
);

CREATE INDEX IX_User_Role_Id ON user_role (user_id);
ALTER TABLE user_role ADD FOREIGN KEY (user_id) REFERENCES users(id);

CREATE INDEX IX_Role_User_Id ON user_role (role_id);
ALTER TABLE user_role ADD FOREIGN KEY (role_id) REFERENCES roles(id);

delete from  user_role;
delete from  roles;
delete from  users;


INSERT INTO roles (id, name) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_ACTUATOR'),
(3, 'ROLE_USER')
;

INSERT INTO users (id, email, password, name) VALUES
(1, 'admin@gmail.com', '123@!', 'Admin'),
(3, 'user@gmail.com', '777', 'User');


insert into user_role(user_id, role_id) values
(1,1),
(1,2),
(1,3),
(3,2)
;
