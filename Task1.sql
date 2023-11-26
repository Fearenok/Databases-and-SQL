/* 1. Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. 
Функция должна возвращать номер пользователя. */

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS DeleteUserFunc;

DELIMITER //

CREATE FUNCTION DeleteUserFunc (user_id_104145216 INT)
RETURNS INT
BEGIN

    DELETE 
    FROM `vk`.`likes` l
    WHERE l.user_id = user_id_104145216;
    
    DELETE 
    FROM `vk`.`users_communities` uc
    WHERE uc.user_id = user_id_104145216;
    
    DELETE 
    FROM `vk`.`messages` m
    WHERE m.to_user_id = user_id_104145216 
        OR m.from_user_id = user_id_104145216;
    
    DELETE 
    FROM `vk`.`friend_requests` fr
    WHERE fr.initiator_user_id = user_id_104145216 
        OR fr.target_user_id = user_id_104145216;

    DELETE l
    FROM `vk`.`media` m
    JOIN `vk`.`likes` l ON l.media_id = m.id
    WHERE m.user_id = user_id_104145216;
    
    UPDATE `vk`.`profiles` p
    JOIN `vk`.`media` m ON p.photo_id = m.id
    SET p.photo_id = NULL
    WHERE m.user_id = user_id_104145216;

    DELETE 
    FROM `vk`.`media` m
    WHERE m.user_id = user_id_104145216;

    DELETE 
    FROM `vk`.`profiles` p
    WHERE p.user_id = user_id_104145216;
    
    DELETE 
    FROM `vk`.`users` u
    WHERE u.id = user_id_104145216;
    
    RETURN user_id_104145216;

END; // 

DELIMITER ;

SELECT DeleteUserFunc(1) AS user_id_104145216;