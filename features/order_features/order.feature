# language: ru
Функционал: Управление приказами на формирование проектов на кафедре
  Для того чтобы обеспечить формальный жизненный цикл проектов
  Администратор
  Должен иметь возможность управлять приказами на кафедре

  Сценарий: Редактирование приказа о формировании проектов на кафедре в состоянии черновик
  Допустим в базе существуют следующие проекты
    | chair | cipher   | title                  | state  | editable_state |
    | АОИ   | АОИ-0701 | Термоядерная установка | draft  | editable       |
    | АОИ   | АОИ-0702 | Пирожковый автомат     | active | editable       |
    | АОИ   | АОИ-0901 | Гудронный коллайдер    | draft  | editable       |
    И в базе существует приказ о формировании проектов АОИ-0701
    И я вхожу в систему как администратор
    И я на странице кафедры АОИ
  Если я перехожу по ссылке "Приказы"
    И я перехожу по ссылке "Приказ о формировании проектов"
    И я перехожу по ссылке "Редактировать"
    То я вижу заголовок "Изменение приказа о формировании проектов"
      И я вижу форму ввода
      И я не вижу "Номер"
      И я не вижу "Дата"
      И выбран чекбокс "АОИ-0701 Термоядерная установка"
      И не выбран чекбокс "АОИ-0901 Гудронный коллайдер"
      И я не вижу "АОИ-0702"
    Если я убираю галочку "АОИ-0701 Термоядерная установка"
      И я ставлю галочку "АОИ-0901 Гудронный коллайдер"
      И я нажимаю "Сохранить"
    То не должно быть ошибок
      И я вижу "Приказ успешно сохранен"
      И я вижу заголовок "Приказ о формировании проектов"
      И я вижу "АОИ-0901 Гудронный коллайдер"
      И я не вижу "АОИ-0702"
      И я не вижу "АОИ-0701"
      И в базе должно быть 3 проекта АОИ

  Сценарий: Редактирование приказа о формировании проектов на кафедре в состоянии утвержден
  Допустим я вхожу в систему как администратор
    И я на странице приказа о формировании проектов АОИ-0701 в состоянии "утвержден"
  Если я перехожу по ссылке "Редактировать"
    То я вижу форму ввода
      И я вижу "Номер"
      И я вижу "Дата"

  Сценарий: Удаление приказа о формировании проектов на кафедре
  Допустим в базе существуют следующие проекты
    | chair | cipher   | title                  | state  | editable_state |
    | АОИ   | АОИ-0701 | Термоядерная установка | draft  | editable       |
    | АОИ   | АОИ-0702 | Пирожковый автомат     | active | editable       |
    | АОИ   | АОИ-0901 | Гудронный коллайдер    | draft  | editable       |
    И я вхожу в систему как администратор
    И в базе существует приказ о формировании проектов АОИ-0701 в состоянии "отправлен на визирование" с записью об активности
    И я на странице кафедры АОИ
  Если я перехожу по ссылке "Приказы"
    И я перехожу по ссылке "Приказ о формировании проектов"
    И я перехожу по ссылке удаления "Удалить"
  То я вижу "Приказ успешно удален"
    И я вижу заголовок "Приказы"
    И в базе должно быть 0 приказов АОИ
    И в базе должно быть 3 проекта АОИ
    И проект АОИ-0701 должен быть с состояниями "черновик" и "правки разрешены"
    И в базе не должно быть связок проекта АОИ-0701 с приказом
    И в базе не должно быть активностей

  Сценарий: Отправка приказа о формировании проектов на кафедре на визирование
  Допустим в базе существуют следующие пользователи
    | login | last_name   | first_name | mid_name     | post                  |
    | saa   | Сидоров     | Анатолий   | Анатольевич  | старший преподаватель |
    | asu   | Катаев      | Михаил     | Юрьевич      | к.т.н., доцент        |
    И в базе существуют следующие руководители
    | user  | project  | state             |
    | saa   | АОИ-0701 | awaiting_approval |
    | saa   | АОИ-0702 | awaiting_approval |
    | asu   | АОИ-0702 | awaiting_removal  |
    И в контингенте существуют студенты
    И в базе существуют следующие участники
    | student | project  | state             |
    | ivanov  | АОИ-0701 | awaiting_approval |
    | petrov  | АОИ-0702 | awaiting_approval |
    | sidorov | АОИ-0702 | awaiting_approval |
    И я вхожу в систему как администратор
    И я на странице приказа о формировании проектов АОИ-0701, АОИ-0702
  Если я ввожу в поле "Комментарий" значение "комммент"
    И я нажимаю "Отправить на визирование"
  То я вижу "Приказ отправлен на визирование"
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "отправлен на визирование"
    И проекты АОИ-0701, АОИ-0702 должны быть с состояниями "черновик" и "правки запрещены"
    И у приказа должен быть файл
    И у приказа должна зафиксироваться деятельность "to_review" с комментарием "комммент"

  Сценарий: Визирование приказа о формировании проектов на кафедре
  Допустим я вхожу в систему как администратор
    И я на странице приказа о формировании проектов АОИ-0701, АОИ-0702 в состоянии "отправлен на визирование"
  Если я нажимаю "Визировать"
  То я вижу "Приказ визирован"
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "визирован"
    И проекты АОИ-0701, АОИ-0702 должны быть с состояниями "черновик" и "правки запрещены"
    И у приказа должна зафиксироваться деятельность "review" с комментарием ""

  Сценарий: Возврат приказа о формировании проектов на кафедре в состоянии отправлен на визирование
  Допустим я вхожу в систему как администратор
    И я на странице приказа о формировании проектов АОИ-0701, АОИ-0702 в состоянии "отправлен на визирование"
  Если я ввожу в поле "Комментарий" значение "комммент"
    И я нажимаю "Вернуть"
  То я вижу "Приказ возвращён на доработку"
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "черновик"
    И проекты АОИ-0701, АОИ-0702 должны быть с состояниями "черновик" и "правки разрешены"
    И у приказа не должно быть файла
    И у приказа должна зафиксироваться деятельность "return" с комментарием "комммент"

  Сценарий: Возврат приказа о формировании проектов на кафедре в состоянии визирован
  Допустим я вхожу в систему как администратор
    И я на странице приказа о формировании проектов АОИ-0701, АОИ-0702 в состоянии "визирован"
  Если я ввожу в поле "Комментарий" значение "комммент"
    И я нажимаю "Вернуть"
  То я вижу "Приказ возвращён на доработку"
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "черновик"
    И проекты АОИ-0701, АОИ-0702 должны быть с состояниями "черновик" и "правки разрешены"
    И у приказа должна зафиксироваться деятельность "return" с комментарием "комммент"
    И у приказа не должно быть файла
