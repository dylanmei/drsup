if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Activity' and COLUMN_NAME = 'Comments')
	ALTER TABLE [dbo].[Activity] ADD [Comments] varchar(1000)	
