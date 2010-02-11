# language: ru
Функционал: Разграничение прав доступа на удаление приказа
  Для того чтобы удалять приказы могли только определенные пользователи и только в определенном состоянии приказа
  Администратор, Ментор, Супервизор, Аноним
  Администратор может удалять приказы в любом состоянии.
  Супервизор может удалять приказы только в состоянии "черновик", "отправлен на визирование" и "визирован".
  Ментор может удалять приказы только в состоянии "черновик".


  Сценарий: Аноним не может удалять приказы
  Допустим я не вхожу в систему
  То мне запрещено удаление приказа о формировании проектов
    И мне запрещено удаление приказа об изменении рабочих групп

  Сценарий: Руководитель проекта не может удалять приказы
  Допустим я вхожу в систему как руководитель проекта
  То мне запрещено удаление приказа о формировании проектов
    И мне запрещено удаление приказа об изменении рабочих групп

  Сценарий: Супервизор может удалять приказы
  Допустим я вхожу в систему как супервизор
  То мне разрешено удаление приказа о формировании проектов в состоянии "черновик"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "черновик"
    И мне разрешено удаление приказа о формировании проектов в состоянии "отправлен на визирование"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "отправлен на визирование"
    И мне разрешено удаление приказа о формировании проектов в состоянии "визирован"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "визирован"
    И мне запрещено удаление приказа о формировании проектов в состоянии "утвержден"
    И мне запрещено удаление приказа об изменении рабочих групп в состоянии "утвержден"

  Сценарий: Ментор кафедры может удалять приказы в состоянии "черновик" на своей кафедре
  Допустим я вхожу в систему как ментор кафедры АОИ
  То мне разрешено удаление приказа о формировании проектов в состоянии "черновик" на кафедре АОИ
    И мне разрешен удаление приказа об изменении рабочих групп в состоянии "черновик" на кафедре АОИ

    И мне запрещено удаление приказа о формировании проектов в состоянии "отправлен на визирование" на кафедре АОИ
    И мне запрещено удаление приказа об изменении рабочих групп в состоянии "отправлен на визирование" на кафедре АОИ

    И мне запрещено удаление приказа о формировании проектов в состоянии "визирован" на кафедре АОИ
    И мне запрещено удаление приказа об изменении рабочих групп в состоянии "визирован" на кафедре АОИ

    И мне запрещено удаление приказа о формировании проектов в состоянии "утвержден" на кафедре АОИ
    И мне запрещено удаление приказа об изменении рабочих групп в состоянии "утвержден" на кафедре АОИ


  Сценарий: Ментор не может удалять приказы на чужой кафедре
  Допустим я вхожу в систему как ментор кафедры АОИ
  То мне запрещено удаление приказа о формировании проектов в состоянии "черновик" на кафедре АСУ
    И мне запрещено удаление приказа об изменении рабочих групп в состоянии "черновик" на кафедре АСУ


  Сценарий: Администратор может удалять приказы в любом состоянии
  Допустим я вхожу в систему как администратор
  То мне разрешено удаление приказа о формировании проектов в состоянии "черновик"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "черновик"
    И мне разрешено удаление приказа о формировании проектов в состоянии "отправлен на визирование"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "отправлен на визирование"
    И мне разрешено удаление приказа о формировании проектов в состоянии "визирован"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "визирован"
    И мне разрешено удаление приказа о формировании проектов в состоянии "утвержден"
    И мне разрешено удаление приказа об изменении рабочих групп в состоянии "утвержден"
