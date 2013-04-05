
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Profile$Contact' and COLUMN_NAME = 'Link')
	ALTER TABLE [dbo].[tbl$Profile$Contact] ADD [Link] varchar(255);	
