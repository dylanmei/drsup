
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NeighborRelationship]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[NeighborRelationship]

CREATE TABLE [dbo].[NeighborRelationship](
	[MemberId] [bigint] NOT NULL,
	[NeighborId] [bigint] NOT NULL
) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_NeighborRelationship_Cluster] ON [dbo].[NeighborRelationship] (
	[MemberId] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
ON [PRIMARY]
