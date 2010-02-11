# language: ru
Функционал: Добавление проекта
  Для того, чтобы вести учет проектов ГПО
  Ментор, Администратор
  Должен иметь возможность добавления проекта
  
  Сценарий: Успешное добавление проекта
  Допустим в базе нет проектов
    И я вхожу в систему как администратор
    И я на странице списка проектов кафедры "АОИ"
  Если я перехожу по ссылке "Новый проект"
  То я вижу заголовок "Добавление проекта"
    И я вижу форму ввода
    И не вижу поля ввода "Шифр"
    И не вижу поля ввода "Заинтересованные структуры"
    И не вижу поля ввода "Потребные ассигнования"
    И не вижу поля ввода "Источники средств"
    И не вижу поля ввода "Назначение"
    И не вижу поля ввода "Основные характеристики"
    И не вижу поля ввода "Анализ состояния дел и имеющихся достижений по тематике проекта"
    И не вижу поля ввода "Новизна предполагаемой разработки"
    И не вижу поля ввода "Ожидаемые результаты"
    И не вижу поля ввода "Оценка возможности реализации разработки и её рыночной ценности"
    И не вижу поля ввода "Прогноз возможных сроков и направлений практической реализации результатов проекта"
  Если я нажимаю "Создать"
  То должны быть ошибки
  Если я ввожу в поле "Название" значение "Термоядерная установка"
    И я нажимаю "Создать"    
  То не должно быть ошибок
    И я вижу заголовок "Термоядерная установка"
    И я вижу "Черновик проекта"
    И я вижу "Правки разрешены"
    И в базе должен быть 1 проект на кафедре АОИ

  Сценарий: Некорректные данные при добавлении проекта
