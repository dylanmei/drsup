if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Members' and COLUMN_NAME = 'PasswordHash')
ALTER TABLE [dbo].[tbl$Members] ADD [PasswordHash] varchar(64)