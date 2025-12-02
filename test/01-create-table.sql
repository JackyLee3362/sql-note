-- 创建数据库
create schema if not exists test_db;

-- 使用数据库
use test_db;

-- 创建 user 数据库
drop table if exists user;

create table
    if not exists user (
        id bigint primary key auto_increment comment 'user id',
        name varchar(255) comment 'user name',
        gender tinyint default 0 comment '0 male, 1 female',
        age int comment 'age',
        email varchar(255) not null comment 'email'
    ) engine = innoDB;

-- 修改 user 数据库
alter table user add phone varchar(255) not null default '' comment 'phone number';

-- 查看 user
-- desc user;

-- 创建 orders 数据库
drop table if exists orders;

create table
    if not exists orders (
        id bigint primary key auto_increment comment 'order id',
        user_id bigint unique comment 'user id',
        order_desc varchar(255) comment 'order description',
        price decimal comment 'price',
        address varchar(255) comment 'address'
    ) engine = innoDB;

-- 查看 orders 
-- desc orders;