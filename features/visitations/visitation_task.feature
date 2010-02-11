# language: ru
Функционал: Отображение проблем, если незаполнен журнал посещаемости
  Чтобы оперативно видеть проблемы, когда не заполняется журнал посещаемости
  Супервизор, Ментор, Руководитель проекта
  Должны видеть проблемную ситуацию, если журнал ГПО не заполнен в течении недели

  Сценарий: Администратор видит проблему в проекте
  Допустим в расписании существует день ГПО 8 дней назад
    И в расписании существует день ГПО 2 дня назад
    И в контингенте существуют студенты
    И в базе существуют следующие проекты
      | chair | cipher   | state  |
      | АОИ   | АОИ-0701 | active |
      | АОИ   | АОИ-0702 | active |
      | АСУ   | АСУ-0701 | active |
    И в базе существуют следующие участники
      | student | project  | state    |
      | sidorov | АОИ-0701 | approved |
      | petrov  | АОИ-0702 | approved |
      | ivanov  | АСУ-0701 | approved |
    И у студента petrov установлено 2 балла за посещаемость в 1-ый день ГПО
    И я вхожу в систему как администратор
  Если я нахожусь на главной странице
  То я не вижу элемент с текстом "АОИ-0701" и "незаполненные данные по посещаемости"
    И я не вижу элемент с текстом "АСУ-0701" и "незаполненные данные по посещаемости"
    И я не вижу элемент с текстом "АОИ-0702" и "незаполненные данные по посещаемости"
  Если я на странице кафедры АОИ
  То я вижу элемент с текстом "АОИ-0701" и "незаполненные данные по посещаемости"
    И я не вижу элемент с текстом "АСУ-0701" и "незаполненные данные по посещаемости"

