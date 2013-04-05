if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Modules' and COLUMN_NAME = 'ContentType')
	ALTER TABLE [dbo].[Modules] ADD [ContentType] tinyint NULL

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Modules' and COLUMN_NAME = 'ContentId')
	ALTER TABLE [dbo].[Modules] ADD [ContentId] bigint NULL