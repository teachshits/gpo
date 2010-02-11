# language: ru
Функционал: Закрытие проекта
  Для того чтобы "мертвые" проекты не числились активными
  Администратор
  Должен иметь возможность закрыть проект проект

  Сценарий: Закрытие проекта
  Допустим в базе существуют следующие проекты
    | chair | cipher   | title                  | state  | editable_state |
    | АОИ   | АОИ-0702 | Пирожковый автомат     | active | editable       |
    И в базе существуют следующие пользователи
    | login | last_name   | first_name | mid_name     |
    | saa   | Сидоров     | Анатолий   | Анатольевич  |
    | asu   | Катаев      | Михаил     | Юрьевич      |
    И в базе существуют следующие руководители
    | user  | project    |
    | saa   | АОИ-0702   |
    | asu   | АОИ-0702   |
    | saa   | АОИ-0701   |
    И я вхожу в систему как администратор
    И я на странице проекта АОИ-0702
  Если я перехожу по ссылке "Закрыть проект"
  То я вижу заголовок "Закрытие проекта"
    И я вижу "Будут удалены руководители проекта:"
    И я вижу "Сидоров"
    И я вижу "Катаев"
    И проект АОИ-0702 должен быть с состояниями "активный" и "правки разрешены"

    Если я перехожу по ссылке "Отмена"
      То я вижу заголовок "Пирожковый автомат"
        И проект АОИ-0702 должен быть с состояниями "активный" и "правки разрешены"

    Если я перехожу по ссылке "Закрыть проект"
      И я нажимаю "Закрыть проект"
      То должны быть ошибки
        И я вижу "Причина не может быть пустым"
        И пользователь saa является руководителем проекта АОИ-0702
        И пользователь asu является руководителем проекта АОИ-0702

    Если я ввожу в поле "Причина" значение "Успешно завершен"
      И я нажимаю "Закрыть проект"
      То я вижу заголовок "Пирожковый автомат"
        И я вижу "Проект успешно закрыт"
        И проект АОИ-0702 должен быть с состояниями "закрыт" и "правки запрещены"
        И пользователь saa является руководителем проекта АОИ-0701
        И пользователь saa не является руководителем проекта АОИ-0702
        И пользователь asu не является руководителем проекта АОИ-0702


  Сценарий: Проверка какие проекты можно закрывать
  Допустим в базе существуют следующие проекты
    | chair | cipher   | title                                              | state  | editable_state |
    | АОИ   | АОИ-0801 | Новый проект без участников                        | draft  | editable       |
    | АОИ   | АОИ-0802 | Новый заблокированный проект без участников        | draft  | blocked        |
    | АОИ   | АОИ-0803 | Новый проект с участниками                         | draft  | editable       |
    | АОИ   | АОИ-0701 | Активный проект без участников                     | active | editable       |
    | АОИ   | АОИ-0702 | Активный заблокированный проект без участников     | active | blocked        |
    | АОИ   | АОИ-0703 | Активный проект с участниками                      | active | editable       |
    | АОИ   | АОИ-0601 | Закрытый проект                                    | closed | blocked        |
    И в контингенте существуют студенты
    И в базе существуют следующие участники
    | student | project  |
    | ivanov  | АОИ-0803 |
    | petrov  | АОИ-0703 |
    И я вхожу в систему как администратор
      То мне разрешено закрыть проект АОИ-0801
        И мне запрещено закрыть проект АОИ-0802
        И мне запрещено закрыть проект АОИ-0803
        И мне разрешено закрыть проект АОИ-0701
        И мне запрещено закрыть проект АОИ-0702
        И мне запрещено закрыть проект АОИ-0703
        И мне запрещено закрыть проект АОИ-0601

  Сценарий: Аноним не может закрывать проекты
  Допустим я не вхожу в систему
  То мне запрещено закрыть проект

  Сценарий: Руководитель проекта не может закрывать проекты
  Допустим я вхожу в систему как руководитель проекта АОИ-0701
  То мне запрещено закрыть проект АОИ-0701

  Сценарий: Супервизор не может закрывать проекты
  Допустим я вхожу в систему как супервизор
  То мне запрещено закрыть проект

  Сценарий: Ментор может закрывать проекты на своей кафедре
  Допустим я вхожу в систему как ментор кафедры АОИ
  То мне разрешено закрыть проект АОИ-0701
    И мне запрещено закрыть проект АСУ-0701
