if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MemberStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[MemberStatus]
