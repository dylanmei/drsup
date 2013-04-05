set nocount on
SET IDENTITY_INSERT dbo.tbl$members ON

If Not Exists(Select 1 from tbl$members where memberid=0)
begin
INSERT INTO tbl$members(MemberId,Created,Edited,UserType,UserName,
DisplayUserName,FirstName,LastName,Email,Active)
Values
(0,getdate(),getdate(),1,'DR','Digital Rodeo','Digital Rodeo','','',1)

end

SET IDENTITY_INSERT dbo.tbl$members OFF
go

