Резервное копирование баз данных MS SQL.

Настройка

1 backups.bat

Задайте: 
	Место расположение хранения архивов 
	SET bupath = C:\

	Католог sql файлов
	SET sql = db
	
	MS SQL Server хост
	SET host = localhost
	
	
2 *.sql

Задайте:
	Имя базы данных
	SET @dbname = 'DB_NAME'
	Путь для сохранения bak и log файлов. Укажите путь где хранятся sql файлы.sql
	SET @to = 'PATH2SAVE'
	
3  remolder7.ps1

Задайте:
	Место расположение хранения архивов
	$bf = C:\
	
	За какое количество дней хранить архивы
	$date = $now.AddDays(-7) 
  