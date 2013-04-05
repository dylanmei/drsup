if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Comment' and COLUMN_NAME = 'ResourceType')
	ALTER TABLE [dbo].[Comment] ADD [ResourceType] tinyint NOT NULL DEFAULT(4)