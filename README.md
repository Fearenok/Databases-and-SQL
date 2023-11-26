# ```Базы данных и SQL (семинары)```
### *HomeWork 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы.*
➤ __Task 1:Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.__

➤ __Task 2:Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.__

➤ __Task 3:* Написать триггер, который проверяет новое появляющееся сообщество. Длина названия сообщества (поле name) должна быть не менее 5 символов. Если требование не выполнено, то выбрасывать исключение с пояснением.__