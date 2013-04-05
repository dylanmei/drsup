
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Members' and COLUMN_NAME = 'MasterID')
	ALTER TABLE dbo.[tbl$Members] ADD [MasterID] bigint NULL
