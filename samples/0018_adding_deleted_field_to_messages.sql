if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Message' and COLUMN_NAME = 'Deleted')
	ALTER TABLE [dbo].[tbl$Message] ADD [Deleted] tinyint NOT NULL DEFAULT(0)