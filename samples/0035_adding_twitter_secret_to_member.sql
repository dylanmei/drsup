if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Members' and COLUMN_NAME = 'TwitterSecret')
	ALTER TABLE [dbo].[tbl$Members] ADD [TwitterSecret] varchar(50) NULL