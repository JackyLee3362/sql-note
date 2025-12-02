-- 准备数据
drop table if exists account;

create table
    if not exists account (
        id bigint primary key,
        name varchar(255),
        asset int
    );

insert into
    account
values
    (1, '小明', 2000),
    (2, '小红', 2000);

-- 复原
update account set asset = 2000;

select * from account;

begin;
    update account set asset = 1500 where id = 1;
    update account set asset = 2500 where id = 2;
commit;
rollback;