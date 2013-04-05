if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Modules' and COLUMN_NAME = 'SmallImage')
	ALTER TABLE [dbo].[Modules] ADD [SmallImage] varchar(50) NULL

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Modules' and COLUMN_NAME = 'MediumImage')
	ALTER TABLE [dbo].[Modules] ADD [MediumImage] varchar(50) NULL

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Modules' and COLUMN_NAME = 'LargeImage')
	ALTER TABLE [dbo].[Modules] ADD [LargeImage] varchar(50) NULL
