if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Post' and COLUMN_NAME = 'Deleted')
	ALTER TABLE [dbo].[Post] ADD [Deleted] tinyint NOT NULL DEFAULT(0)