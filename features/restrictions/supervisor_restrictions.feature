# language: ru
Функционал: Ограничения для супервизора
  Для того чтобы супервизор мог осуществлять только допустимые действия в системе
  Супервизор
  Должен быть органичен в действиях правилами системы
   
  Сценарий: Навигационное меню супервизора
    
  Сценарий: Супервизор не может управлять пользователями системы
  Допустим я вхожу в систему как супервизор
  То мне запрещен просмотр списка пользователей
    И мне запрещен просмотр формы создания пользователя
    И мне запрещено создание пользователя
    И мне запрещен просмотр формы редактирования пользователя
    И мне запрещено обновление пользователя
    И мне запрещено удаление пользователя

  Сценарий: Супервизор не может управлять пользователями кафедры
  Допустим я вхожу в систему как супервизор
  То мне запрещен просмотр списка пользователей кафедры АОИ
    И мне запрещен просмотр формы создания пользователя кафедры АОИ
    И мне запрещено создание пользователя кафедры АОИ
    И мне запрещен просмотр формы редактирования пользователя кафедры АОИ
    И мне запрещено обновление пользователя кафедры АОИ
    И мне запрещено удаление пользователя на кафедре АОИ

  Сценарий: Супервизор может просматривать кафедры
  Допустим я вхожу в систему как супервизор
  То мне разрешен просмотр списка кафедр
    И мне запрещен просмотр формы создания кафедры
    И мне запрещено создание кафедры
    И мне разрешен просмотр кафедры
    И мне разрешен просмотр списка руководителей кафедры
    И мне запрещен просмотр формы редактирования кафедры
    И мне запрещено обновление кафедры
    И мне запрещено удаление кафедры
    
  Сценарий: Супервизор не может манипулировать правилами
  Допустим я вхожу в систему как супервизор
  То мне запрещен просмотр списка правил
    И мне запрещен просмотр формы создания правила
    И мне запрещено создание правила
    И мне запрещен просмотр формы редактирования правила
    И мне запрещено обновление правила
    И мне запрещено удаление правила
    
  Сценарий: Супервизор может просматривать студентов
  Допустим я вхожу в систему как супервизор
  То мне разрешен просмотр списка студентов
    И мне разрешен просмотр списка проблемных студентов
   
  Сценарий: Супервизор может просматривать проекты
  Допустим я вхожу в систему как супервизор
  То мне разрешен просмотр списка проектов
    И мне разрешен просмотр проекта
    И мне запрещен просмотр формы создания проекта
    И мне запрещено создание проекта
    И мне запрещен просмотр формы редактирования проекта
    И мне запрещено обновление проекта
    И мне запрещено удаление проекта

  Сценарий: Супервизор может просматривать календарным план проекта
  Допустим я вхожу в систему как супервизор
  То мне разрешен просмотр календарного плана проекта
    И мне разрешен просмотр этапа календарного плана проекта
    И мне запрещен просмотр формы создания этапа календарного плана проекта
    И мне запрещено создание этапа календарного плана проекта
    И мне запрещен просмотр формы редактирования этапа календарного плана проекта
    И мне запрещено обновление этапа календарного плана проекта
    И мне запрещено удаление этапа календарного плана проекта
