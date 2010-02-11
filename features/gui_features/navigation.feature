# language: ru
Функционал: Навигационное меню
  Для того чтобы эффективно пользоваться системой
  Пользователь
  Должен иметь возможность переходить по основным страницам сайта

  Сценарий: Навигационное меню для администратора
  Допустим я вхожу в систему как администратор
  Если я перехожу по ссылке главного меню "Моя страница"
  То я вижу заголовок "Моя страница"
  Если я перехожу по ссылке главного меню "Кафедры"
  То я вижу заголовок "Кафедры"
  Если я перехожу по ссылке главного меню "Пользователи"
  То я вижу заголовок "Пользователи"
  Если я перехожу по ссылке главного меню "Отчеты"
  То я вижу заголовок "Отчеты"

  Сценарий: Навигационное меню для ментора
  Допустим я вхожу в систему как ментор кафедры АОИ
  Если я перехожу по ссылке в подменю "Проекты"
  То я вижу заголовок "Проекты"
  Если я перехожу по ссылке в подменю "Пользователи"
  То я вижу заголовок "Пользователи кафедры АОИ"
  Если я перехожу по ссылке в подменю "Руководители"
  То я вижу заголовок "Руководители"

  Сценарий: Навигационное меню для ментора на нескольких кафедрах

  Сценарий: Навигационное меню для руководителя проектов
  Допустим я вхожу в систему как руководитель проекта АОИ-0701
  Если я перехожу по ссылке в подменю "Проекты"
  То я вижу заголовок "Проекты"

