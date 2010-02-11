# language: ru
Функционал: Удаление проекта
  Для того чтобы была возможность удалять черновики проектов
  Администратор
  Должен иметь возможность удалять проекты в состоянии "черновик"

  Сценарий: Удаление проекта
  Допустим в базе существуют следующие проекты
    | chair | cipher   | title                  | state  | editable_state |
    | АОИ   | АОИ-0702 | Пирожковый автомат     | draft  | editable       |
    И в базе существуют следующие пользователи
    | login | last_name   | first_name | mid_name     |
    | saa   | Сидоров     | Анатолий   | Анатольевич  |
    | asu   | Катаев      | Михаил     | Юрьевич      |
    И в базе существуют следующие руководители
    | user  | project    |
    | saa   | АОИ-0702   |
    | asu   | АОИ-0702   |
    И в контингенте существуют студенты
    И в базе существуют следующие участники
    | student | project  | state             |
    | ivanov  | АОИ-0702 | awaiting_approval |
    | petrov  | АОИ-0702 | awaiting_approval |
    | sidorov | АОИ-0702 | awaiting_approval |
    И я вхожу в систему как администратор
    И я на странице проекта АОИ-0702
  Если я перехожу по ссылке "Удалить"
  То я вижу заголовок "Проекты"
    И я вижу "Проект успешно удален"
    И я не вижу "Пирожковый автомат"
    И пользователь saa не является руководителем
    И пользователь asu не является руководителем
    И студент ivanov не является участником
    И студент petrov не является участником
    И студент sidorov не является участником

  Сценарий: Правила удаления проектов
  Допустим в базе существуют следующие проекты
    | chair | cipher   | title                                              | state  | editable_state |
    | АОИ   | АОИ-0801 | Новый проект без участников                        | draft  | editable       |
    | АОИ   | АОИ-0802 | Новый заблокированный проект без участников        | draft  | blocked        |
    | АОИ   | АОИ-0701 | Активный проект без участников                     | active | editable       |
    | АОИ   | АОИ-0601 | Закрытый проект                                    | closed | blocked        |
    И я вхожу в систему как администратор
      То мне разрешено удаление проекта АОИ-0801
        И мне запрещено удаление проекта АОИ-0802
        И мне запрещено удаление проекта АОИ-0701
        И мне запрещено удаление проекта АОИ-0601
