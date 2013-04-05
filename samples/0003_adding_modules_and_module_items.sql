
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleListItem]') AND type in (N'U')) 
	drop table  [dbo].[ModuleListItem]
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modules]') AND type in (N'U'))
	drop table  [dbo].[Modules]

CREATE TABLE  [dbo].[Modules](
  [Abstract] NVarChar(256), 
  [ModuleId] Int NOT NULL IDENTITY, 
  [PageType] tinyint NOT NULL, 
  [Title] NVarChar(100) NOT NULL, 
  [ModuleType] tinyint NOT NULL, 
  [Order] smallint NOT NULL, 
  CONSTRAINT [PK_Modules] PRIMARY KEY ([ModuleId]))

CREATE TABLE  [dbo].[ModuleListItem](
  [Id] int NOT NULL IDENTITY, 
  [ModuleId] int NOT NULL, 
  [ContextID] int NOT NULL, 
  [Title] nvarchar(100) NOT NULL, 
  [SubHeader1] nvarchar(100), 
  [SubHeader2] nvarchar(100), 
  [Order] smallint NOT NULL, 
  [Abstract] nvarchar(500), 
  CONSTRAINT [PK_ModuleListItem] PRIMARY KEY ([Id])
  )

ALTER TABLE  [dbo].[ModuleListItem]
  ADD CONSTRAINT [FK_Module_ListItem] FOREIGN KEY ([ModuleId]) REFERENCES  [dbo].[Modules]([ModuleId])

