#Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
select   count(*) as total_likes from likes
inner join profiles on likes.user_id = profiles.user_id
where profiles.birthday >= date_sub(curdate(), interval 12 year);

# Определить кто больше поставил лайков всего: мужчины или женщины. 

select gender, count(*) as total_likes
from likes
inner join profiles on likes.user_id = profiles.user_id
where profiles.gender = 'm' or profiles.gender = 'f'
group by gender;

# Вывести всех пользователей, которые не отправляли сообщения.

select * from users u
left join messages m on m.from_user_id = u.id
where  m.from_user_id is null;

# Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.

select u.id, u.firstname, u.lastname,  count(*) as total_message
from users u
left join messages m on m.from_user_id = u.id
where  to_user_id=1
group by u.id
order by total_message desc
limit 1;



