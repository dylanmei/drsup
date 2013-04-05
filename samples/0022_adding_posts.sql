set nocount on
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Post]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[Post]

CREATE TABLE [dbo].[Post](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthorId] [bigint] NOT NULL,
	[RecipientId] [bigint] NOT NULL,
	[Text] [varchar](1000) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_Post_Cluster] ON [dbo].[Post] (
	[RecipientId] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
ON [PRIMARY]

-- previously, posts were simply recorded as activities (Type=1)
insert into [dbo].[Post] (AuthorId, RecipientId, Text, CreateDate)
	select ActorId, ResourceId, Text, CreateDate
	from [dbo].[Activity] where Type=1

-- Resource = Post (ResourceType=4)
delete from [dbo].[Activity] where Type=1
insert into [dbo].[Activity] (Type, ActorId, ResourceId, ResourceType, CreateDate, ModifyDate, Text, ResourceCount)
	select 1, AuthorId, Id, 4, CreateDate, CreateDate, Text, 0
	from [dbo].[Post]