set nocount on
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Notifications]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[Notifications]
GO

CREATE TABLE Notifications
(
	NotificationID INT PRIMARY KEY IDENTITY(1,1),
	NotificationCode nvarchar(40),
	XslPath VARCHAR(255),
	Sender	VARCHAR(255),
	Subject VARCHAR(255),
	IsActive BIT DEFAULT 1,
	Created DateTime Default getdate(),
	Edited DateTime Default getdate()
)


GO
--Change xslt path here
INSERT INTO	Notifications (NotificationCode,XslPath,Sender,Subject) VALUES('Registration','<http://localhost:28203>/Content/registration.xslt','info@digitalrodeo.com','Thank you for Registering')
GO
INSERT INTO	Notifications (NotificationCode,XslPath,Sender,Subject) VALUES('ForgotPassword','http://localhost:28203/Content/forgotpassword.xslt','info@digitalrodeo.com','Your Password')
GO
INSERT INTO	Notifications (NotificationCode,XslPath,Sender,Subject) VALUES('NewMessageNotify','http://localhost:28203/Content/newmessagenotify.xslt','info@digitalrodeo.com','New Message')
GO
INSERT INTO	Notifications (NotificationCode,XslPath,Sender,Subject) VALUES('NewCommentNotify','http://localhost:28203/Content/newcommentnotify.xslt','info@digitalrodeo.com','New Comment')
GO