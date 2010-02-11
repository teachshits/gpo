# language: ru
Функционал: Утверждение приказа
  Для того чтобы утверждались все изменения в проектах, связанные с приказом
  Система
  Система должна проводить необходимые утверждения состояния проекта при утверждении приказа

  Сценарий: Утверждение приказа о формировании проектов на кафедре
  Допустим в базе существуют следующие пользователи
    | login | last_name   | first_name | mid_name     |
    | saa   | Сидоров     | Анатолий   | Анатольевич  |
    | asu   | Катаев      | Михаил     | Юрьевич      |
    | pup   | Пупкин      | Василий    | Феоклистович |
    И в базе существуют следующие проекты
    | chair | cipher   | state | editable_state |
    | АОИ   | АОИ-0701 | draft | blocked        |
    | АОИ   | АОИ-0702 | draft | blocked        |
    И в базе существуют следующие руководители
    | user  | project  | state             |
    | saa   | АОИ-0701 | awaiting_approval |
    | pup   | АОИ-0701 | awaiting_approval |
    | saa   | АОИ-0702 | awaiting_approval |
    И в контингенте существуют студенты
    И в базе существуют следующие участники
    | student | project  | state             |
    | ivanov  | АОИ-0701 | awaiting_approval |
    | petrov  | АОИ-0701 | awaiting_approval |
    | sidorov | АОИ-0702 | awaiting_approval |
    И я вхожу в систему как администратор
    И я на странице приказа о формировании проектов АОИ-0701, АОИ-0702 в состоянии "визирован"
    И я вижу "Приказ требует утверждения. Вы можете утвердить или вернуть приказ на доработку"
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "визирован"
  Если я нажимаю "Утвердить"
  То должны быть ошибки
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "визирован"
    И я вижу "Номер не может быть пустым"
    И я вижу "Дата не может быть пустым"
  Если я ввожу в поле "Номер" значение "111"
    И я ввожу в поле "Дата" значение "11.12.2008"
    И я нажимаю "Утвердить"
  То не должно быть ошибок
    И я вижу "Приказ о формировании проектов №111 от 11.12.2008"
    И в базе должен быть 1 приказ кафедры АОИ о формировании проектов в состоянии "утвержден"
    И проекты АОИ-0701, АОИ-0702 должны быть с состояниями "активный" и "правки разрешены"
    И руководитель saa проекта АОИ-0701 должен быть в состоянии "Утверждён"
    И руководитель pup проекта АОИ-0701 должен быть в состоянии "Утверждён"
    И руководитель saa проекта АОИ-0702 должен быть в состоянии "Утверждён"
    И участник ivanov проекта АОИ-0701 должен быть в состоянии "Утверждён"
    И участник petrov проекта АОИ-0701 должен быть в состоянии "Утверждён"
    И участник sidorov проекта АОИ-0702 должен быть в состоянии "Утверждён"
    И у приказа должна зафиксироваться деятельность "approve" с комментарием ""


  Сценарий: Утверждение приказа об изменении рабочих групп проектов на кафедре
  Допустим я вхожу в систему как администратор
    И в контингенте существуют студенты
    И я на странице приказа об изменении рабочих групп проектов АОИ-0701, АОИ-0702 в состоянии "визирован"
    И в базе существуют следующие участники
    | student | project  | state             |
    | ivanov  | АОИ-0701 | awaiting_approval |
    | petrov  | АОИ-0701 | awaiting_removal  |
    | sidorov | АОИ-0702 | awaiting_approval |
    И я вижу "Приказ требует утверждения. Вы можете утвердить или вернуть приказ на доработку"
    И в базе должен быть 1 приказ кафедры АОИ об изменении рабочих групп в состоянии "визирован"
  Если я нажимаю "Утвердить"
  То должны быть ошибки
    И в базе должен быть 1 приказ кафедры АОИ об изменении рабочих групп в состоянии "визирован"
    И я вижу "Номер не может быть пустым"
    И я вижу "Дата не может быть пустым"
  Если я ввожу в поле "Номер" значение "111"
    И я ввожу в поле "Дата" значение "11.12.2008"
    И я нажимаю "Утвердить"
  То не должно быть ошибок
    И я вижу "Приказ об изменении рабочих групп проектов №111 от 11.12.2008"
    И в базе должен быть 1 приказ кафедры АОИ об изменении рабочих групп в состоянии "утвержден"
    И проекты АОИ-0701, АОИ-0702 должны быть с состояниями "активный" и "правки разрешены"
    И участник ivanov проекта АОИ-0701 должен быть в состоянии "Утверждён"
    И в проекте АОИ-0701 не должно быть участника petrov
    И участник sidorov проекта АОИ-0702 должен быть в состоянии "Утверждён"
    И у приказа должна зафиксироваться деятельность "approve" с комментарием ""
