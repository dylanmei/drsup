set nocount on

if not exists (select 1 from tbl$Members where MemberId=45) begin
	SET IDENTITY_INSERT [dbo].[tbl$Members] ON

	INSERT INTO tbl$Members
		(MemberId, Created, Edited, UserType, UserName, DisplayUserName, FirstName, LastName, Email, Active, PasswordHash)
	Values
		(45, getdate(), getdate(), 1, 'boss', 'Tim', 'Tim', 'Boss','boss@digitalrodeo.com', 1, 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=')

end


