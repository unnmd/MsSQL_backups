DECLARE @to varchar(100)

DECLARE @dbname varchar(100)

DECLARE @path varchar(400)

---------------------------------

SET @dbname = 'DB_NAME2'

SET @to = 'PATH2SAVE'

---------------------------------

SET @path = @to + 'Full_' + @dbname + '_' +

cast(day(getdate()) as varchar(5)) + '.' +

cast(month(getdate()) as varchar(5)) + '.' +

cast(year(getdate()) as varchar(5)) + '-' +

replace(cast(CONVERT(varchar(8), GETDATE(), 108) as varchar(8))+ '.bak', ':', '.')

BACKUP DATABASE @dbname TO DISK = @path WITH NOFORMAT, INIT,

NAME = @dbname,

SKIP, NOREWIND, NOUNLOAD, STATS = 10, CHECKSUM

GO