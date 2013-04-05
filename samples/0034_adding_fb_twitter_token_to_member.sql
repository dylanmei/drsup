if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Members' and COLUMN_NAME = 'TwitterToken')
	ALTER TABLE [dbo].[tbl$Members] ADD [TwitterToken] varchar(50) NULL
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Members' and COLUMN_NAME = 'FacebookToken')
	ALTER TABLE [dbo].[tbl$Members] ADD [FacebookToken] varchar(50) NULL
