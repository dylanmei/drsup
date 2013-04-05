set nocount on
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl$Venue$Profile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) begin
	ALTER TABLE [dbo].[CompanyProfile] ALTER COLUMN [StreetAddress] varchar (100);	
	ALTER TABLE [dbo].[CompanyProfile] ALTER COLUMN [City] varchar (100);	
	ALTER TABLE [dbo].[CompanyProfile] ALTER COLUMN [State] varchar (100);	

	insert into [dbo].[CompanyProfile]
		select fo_UserID, '', tx_Address, tx_City, tx_State, tx_Zip, tx_Country, 3
		from [dbo].[tbl$Venue$Profile]
	
	update [dbo].[tbl$Members] set UserType = 3 where UserType = 4
	drop table [dbo].[tbl$Venue$Profile]
end
