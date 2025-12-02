select * from orders o join user u on o.user_id = u.id; -- 默认 join = inner join
-- select * from orders o inner join user u on o.user_id = u.id;
-- select * from orders o cross join user u on o.user_id = u.id;
-- select * from user u left join orders o on u.id = o.user_id;
-- select * from user u right join orders o on u.id = o.user_id;
-- select * from user u full outer join orders o on u.id = o.user_id;
