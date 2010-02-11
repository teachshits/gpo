# language: ru
Функционал: Управление кафедрами
  Для того чтобы система функционировала
  Администратор
  Должен иметь возможность управлять кафедрами

  Сценарий: Администратор добавляет новую кафедру
  Допустим в базе нет кафедр
    И я вхожу в систему как администратор
    И я нахожусь на странице списка кафедр
  
  Если я перехожу по ссылке "Новая кафедра"
  То я вижу заголовок "Добавление новой кафедры"
    И я вижу форму ввода

  Если я нажимаю "Создать"
  То должны быть ошибки
    И я вижу "Название не может быть пустым"
    И я вижу "Аббревиатура не может быть пустым"
    И я вижу "Заведующий не может быть пустым"

  Если я ввожу в поле "Название" значение "Автоматизации обработки информации"
    И я ввожу в поле "Аббревиатура" значение "АОИ"
    И я ввожу в поле "Заведующий" значение "Ехлаков Ю.П."
    И я нажимаю "Создать"
  То не должно быть ошибок
    И я вижу "Кафедра успешно добавлена"
    И я вижу заголовок "Кафедра АОИ"
    И в базе ровно 1 кафедра
  
  Сценарий: Администратор измененяет информацию о кафедре
  Допустим я вхожу в систему как администратор
    И я на странице кафедры АОИ
  Если я перехожу по ссылке "Редактировать"
  То я вижу форму ввода
  Если я ввожу в поле "Аббревиатура" значение "ААА"
    И я нажимаю "Сохранить"
  То я вижу "Информация о кафедре успешно обновлена"
    И я вижу заголовок "Кафедра ААА"
    
  Сценарий: Администратор удаляет кафедру

