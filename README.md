GET:
http://yii2-rest.wr/api/v1/books - возвращает весь список книг
http://yii2-rest.wr/api/v1/books/author/{id} - возвращает список книг автора с id = {id}

POST:
http://yii2-rest.wr/api/v1/books/add - добавляет книгу
Параметры:
name - название книги
author_id - id автора из таблицы authors
edition_id - id издательства из таблицы editions
issue_year - год выхода книги
Заголовки:
Content-Type = application/x-www-form-urlencoded

PUT:
http://yii2-rest.wr/api/v1/books/edit/{id} - изменяет автора книги с id = {id}
Параметры:
author_id - id автора из таблицы authors
Заголовки:
Content-Type = application/x-www-form-urlencoded

DELETE:
http://yii2-rest.wr/api/v1/books/author/{id} - удаляет автора с id = {id} и все пренадлежащие ему книги из таблицы books


Дамп базы данных находится в корне, под именем dump.sql
