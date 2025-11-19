select * from user;

insert into user values (3, 'cindy', 11);

alter table user add column age int;

alter table user drop column age;

alter table user add column city varchar(128);

update user set city = '12,23' where id = 1;
update user set city = '12,24' where id = 2;

select * from user where city = 12;