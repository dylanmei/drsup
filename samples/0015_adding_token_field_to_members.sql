
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Members' and COLUMN_NAME = 'SecurityToken')
	ALTER TABLE dbo.[tbl$Members] ADD [SecurityToken] varchar(50) NULL
