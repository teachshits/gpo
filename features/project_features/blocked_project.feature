# language: ru
Функционал: Нельзя изменять заблокированный проект
  Для того чтобы изменения в проекте проходили только в определенный момент
  Ментор и руководитель
  Должны быть ограничены в свободе действий
  
  Сценарий: Администратор может делать что угодно даже в заблокированном проекте, кроме удаления
  Допустим в контингенте существуют студенты 
  И в базе существуют следующие проекты
  | cipher   | editable_state |
  | АОИ-0701 | blocked        |
  И я вхожу в систему как администратор
  И я на странице проекта АОИ-0701
  То я вижу "Правки запрещены"
    И мне разрешен просмотр формы редактирования проекта АОИ-0701
    И мне разрешено обновление проекта АОИ-0701
    И мне запрещено удаление проекта АОИ-0701
    
    И мне разрешен просмотр списка участников проекта АОИ-0701
    И мне разрешен просмотр формы включения участника в проект АОИ-0701
    И мне разрешено добавить в проект АОИ-0701 студента
    И мне разрешено исключение студента из проекта АОИ-0701
    И мне разрешено утверждение действия над участником проекта АОИ-0701
    И мне разрешена отмена действия над участником проекта АОИ-0701
    
    И мне разрешен просмотр календарного плана проекта
    И мне разрешен просмотр этапа календарного плана проекта
    И мне разрешен просмотр формы создания этапа календарного плана проекта
    И мне разрешено создание этапа календарного плана проекта
    И мне разрешен просмотр формы редактирования этапа календарного плана проекта
    И мне разрешено обновление этапа календарного плана проекта
    И мне разрешено удаление этапа календарного плана проекта
    
    И мне разрешен просмотр списка руководителей проекта АОИ-0701
    И мне разрешен просмотр формы назначения руководителя проекта АОИ-0701
    И мне разрешено назначение руководителя проекта АОИ-0701
    И мне разрешено утверждение действия над руководителем проекта АОИ-0701
    И мне разрешена отмена действия над руководителем проекта АОИ-0701
    И мне разрешено удаление руководителя проекта АОИ-0701
  
  Сценарий: Ментору нельзя вносить изменения в заблокированный проект
  Допустим в базе существуют следующие проекты
  | cipher   | editable_state |
  | АОИ-0701 | blocked        |
  И в контингенте существуют студенты
  И я вхожу в систему как ментор кафедры АОИ
  И я на странице проекта АОИ-0701
  То я вижу "Правки запрещены"
    И мне запрещён просмотр формы редактирования проекта АОИ-0701
    И мне запрещено обновление проекта АОИ-0701
    И мне запрещено удаление проекта АОИ-0701
    
    И мне разрешен просмотр списка участников проекта АОИ-0701
    И мне запрещён просмотр формы включения участника в проект АОИ-0701
    И мне запрещено добавить в проект АОИ-0701 студента
    И мне запрещено исключение студента из проекта АОИ-0701
    И мне запрещена отмена действия над участником проекта АОИ-0701
    
    И мне разрешен просмотр календарного плана проекта
    И мне разрешен просмотр этапа календарного плана проекта
    И мне запрещен просмотр формы создания этапа календарного плана проекта
    И мне запрещено создание этапа календарного плана проекта
    И мне запрещен просмотр формы редактирования этапа календарного плана проекта
    И мне запрещено обновление этапа календарного плана проекта
    И мне запрещено удаление этапа календарного плана проекта
    
    И мне разрешен просмотр списка руководителей проекта АОИ-0701
    И мне запрещен просмотр формы назначения руководителя проекта АОИ-0701
    И мне запрещено назначение руководителя проекта АОИ-0701
    И мне запрещено утверждение действия над руководителем проекта АОИ-0701
    И мне запрещена отмена действия над руководителем проекта АОИ-0701
    И мне запрещено удаление руководителя проекта АОИ-0701
    
  Сценарий: Руководителю проекта нельзя вносить изменения в заблокированный проект
  Допустим в базе существуют следующие проекты
  | cipher   | editable_state |
  | АОИ-0701 | blocked        |
  И в контингенте существуют студенты
  И я вхожу в систему как руководитель проекта АОИ-0701
  И я на странице проекта АОИ-0701
  То я вижу "Правки запрещены"
    И мне запрещён просмотр формы редактирования проекта АОИ-0701
    И мне запрещено обновление проекта АОИ-0701
        
    И мне разрешен просмотр списка участников проекта АОИ-0701
    И мне запрещён просмотр формы включения участника в проект АОИ-0701
    И мне запрещено добавить в проект АОИ-0701 студента
    И мне запрещено исключение студента из проекта АОИ-0701
    И мне запрещена отмена действия над участником проекта АОИ-0701
    
    И мне разрешен просмотр календарного плана проекта
    И мне разрешен просмотр этапа календарного плана проекта
    И мне запрещен просмотр формы создания этапа календарного плана проекта
    И мне запрещено создание этапа календарного плана проекта
    И мне запрещен просмотр формы редактирования этапа календарного плана проекта
    И мне запрещено обновление этапа календарного плана проекта
    И мне запрещено удаление этапа календарного плана проекта
    
