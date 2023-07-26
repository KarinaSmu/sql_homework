-- 1 Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.

CREATE OR REPLACE VIEW teenagers AS
SELECT u.firstname, u.lastname, p.hometown, p.gender
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE p.birthday >= date_sub(curdate(), interval 20 year);

SELECT * FROM teenagers;
    -- TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) <= 20;


-- 2 Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, указав имя и фамилию пользователя, количество отправленных сообщений 
-- и место в рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)

SELECT u.firstname, u.lastname, msg_count,
DENSE_RANK() OVER (ORDER BY msg_count DESC) AS ranking
FROM users u
JOIN (SELECT from_user_id, COUNT(*) AS msg_count 
FROM messages
GROUP BY from_user_id) AS m ON u.id = m.from_user_id
ORDER BY msg_count DESC;


-- 3 Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) и найдите разницу дат отправления между соседними сообщениями,
-- получившегося списка. (используйте LEAD или LAG) 

SELECT id, from_user_id, to_user_id, body, created_at,
TIMESTAMPDIFF (SECOND, created_at, LEAD(created_at) OVER (ORDER BY created_at)) AS timediff_next,
TIMESTAMPDIFF (SECOND, LAG(created_at) OVER (ORDER BY created_at ), created_at ) AS timediff_previos
FROM messages
ORDER BY created_at;


 
 