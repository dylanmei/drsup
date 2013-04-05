
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MemberStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[MemberStatus]

CREATE TABLE [dbo].[MemberStatus](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](800) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberStatus] PRIMARY KEY ([ID])
) ON [PRIMARY]
