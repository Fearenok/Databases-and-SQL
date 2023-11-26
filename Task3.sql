/* 3. Написать триггер, который проверяет новое появляющееся сообщество. 
Длина названия сообщества (поле name) должна быть не менее 5 символов. 
Если требование не выполнено, то выбрасывать исключение с пояснением. */

DROP TRIGGER IF EXISTS VerificationCommunityNameTrigger;

DELIMITER //

CREATE TRIGGER VerificationCommunityNameTrigger BEFORE INSERT ON `vk`.`Communities` 
FOR EACH ROW BEGIN
   IF (LENGTH(new.name) < 5) THEN
       SIGNAL SQLSTATE '45000'
	   SET MESSAGE_TEXT = 'Длина названия сообщества (поле name) должна быть не менее 5 символов';
       INSERT INTO VerificationCommunityNameTrigger_exception_table VALUES();
   END IF; 
END; // 

DELIMITER ;