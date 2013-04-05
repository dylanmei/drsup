if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Comment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[Comment]

CREATE TABLE [dbo].[Comment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthorId] [bigint] NOT NULL,
	[ResourceId] [bigint] NOT NULL,
	[Text] [varchar](1000) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_Comment_Cluster] ON [dbo].[Comment] (
	[ResourceId] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
ON [PRIMARY]
