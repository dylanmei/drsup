
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Venue$Profile' and COLUMN_NAME = 'About')
	alter table [dbo].[tbl$Venue$Profile] add [About] [varchar](8000) NULL
