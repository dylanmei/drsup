if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Activity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[Activity]

CREATE TABLE [dbo].[Activity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[ActorId] [bigint] NOT NULL,
	[ResourceId] [bigint] NOT NULL,
	[ResourceType] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[Text] [nvarchar](256) NULL
) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_Activity_Cluster] ON [dbo].[Activity] (
	[ActorId] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
ON [PRIMARY]
