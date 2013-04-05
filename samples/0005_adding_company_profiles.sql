if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CompanyProfile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[CompanyProfile]
	
CREATE TABLE [dbo].[CompanyProfile](
	[fo_UserID] [bigint] NOT NULL,
	[About] [varchar](8000) NULL,
	[StreetAddress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[PostalCode] [varchar](20) NULL,
	[CountryCode] [varchar](2) NULL,
	[CompanyType] smallint NOT NULL
) ON [PRIMARY]

