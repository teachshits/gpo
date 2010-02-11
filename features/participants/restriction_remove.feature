# language: ru
Функционал: Разграничение прав доступа на исключение участника проекта
  Для того чтобы исключать участника из проекта могли только определенные пользователи
  Аноним, Руководитель проекта, Ментор, Супервизор
  Исключать участника из проекта могут ментор своей кафедры, руководитель этого проекта и админ

  Сценарий: Аноним не может исключать участника из проекта
  Допустим я не вхожу в систему
    И в контингенте существуют студенты
  То мне запрещено исключение студента из проекта

  Сценарий: Руководитель проекта может исключать участника из своего проект
  Допустим я вхожу в систему как руководитель проектов АОИ-0701
    И в контингенте существуют студенты
  То мне разрешено исключение студента из проекта АОИ-0701
    И мне запрещено исключение студента из проекта АОИ-0703

  Сценарий: Ментор может исключать участника из проекта на своей кафедры
  Допустим я вхожу в систему как ментор кафедры АОИ
    И в контингенте существуют студенты
  То мне разрешено исключение студента из проекта АОИ-0701
    И мне запрещено исключение студента из проекта АСУ-0703

  Сценарий: Супервизор не может исключать участника из проекта
  Допустим я вхожу в систему как супервизор
    И в контингенте существуют студенты
  То мне запрещено исключение студента из проекта