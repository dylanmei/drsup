if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Music$Track' and COLUMN_NAME = 'Deleted')
	ALTER TABLE [dbo].[tbl$Music$Track] ADD [PurchaseLink] varchar (500) NULL