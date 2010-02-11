# language: ru
Функционал: Генерация шифра проекта
  Для того чтобы автоматически генерировать шифр проекта
  Система
  Шифр проекта должен генерироваться автоматически

  Сценарий: Когда на кафедре еще нет проектов
  Допустим я вхожу в систему как ментор кафедры АОИ
    И в базе нет проектов
    И я на странице добавления проекта кафедры АОИ
  Если я ввожу в поле "Название" значение "Пробный проект"
    И я нажимаю "Создать"
  То не должно быть ошибок
    И я вижу "Пробный проект"
    И я вижу "АОИ-1001"
    И в базе должен быть 1 проект на кафедре АОИ


  Сценарий: Когда на кафедре есть проекты
  Допустим я вхожу в систему как ментор кафедры АОИ
    И в базе существуют следующие проекты
    | chair | cipher   | title                  |
    | АОИ   | АОИ-1001 | Термоядерная установка |
    | АОИ   | АОИ-0702 | Пирожковый автомат     |
    | АСУ   | АСУ-0701 | Чужой проект           |
    И я на странице добавления проекта кафедры АОИ
  Если я ввожу в поле "Название" значение "Пробный проект"
    И я нажимаю "Создать"
  То не должно быть ошибок
    И я вижу "Пробный проект"
    И я вижу "АОИ-1002"
    И в базе должен быть 3 проекта на кафедре АОИ

  Сценарий: Когда на кафедре есть проекты
  Допустим я вхожу в систему как ментор кафедры АОИ
    И в базе существуют следующие проекты
    | chair | cipher   | title                  |
    | АОИ   | АОИ-1005 | Термоядерная установка |
    | АОИ   | АОИ-0702 | Пирожковый автомат     |
    | АСУ   | АСУ-0701 | Чужой проект           |
    И я на странице добавления проекта кафедры АОИ
  Если я ввожу в поле "Название" значение "Пробный проект"
    И я нажимаю "Создать"
  То не должно быть ошибок
    И я вижу "Пробный проект"
    И я вижу "АОИ-1006"
    И в базе должен быть 3 проекта на кафедре АОИ
