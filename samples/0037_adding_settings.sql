set nocount on
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Settings]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[Settings]

CREATE TABLE [dbo].[Settings](
	[Id] [int] NOT NULL,
	[StorageRoot] [varchar](120) NOT NULL,
	[EmailTemplatePath] [varchar](120) NOT NULL,
	[SmtpServers] [ntext] NOT NULL,
	[NoReplyAddress] [varchar](120) NOT NULL,
	[RegistrationEmailSubject] [varchar](120) NOT NULL,
	[ForgotPasswordEmailSubject] [varchar](120) NOT NULL,
	[NeighborRequestEmailSubject] [varchar](120) NOT NULL,
	[NewMessageEmailSubject] [varchar](120) NOT NULL,
	[NewCommentEmailSubject] [varchar](120) NOT NULL,
	[TwitterConsumerKey] [varchar](60) NOT NULL,
	[TwitterConsumerSecret] [varchar](60) NOT NULL,
	[FacebookClientID] [varchar](60) NOT NULL,
	[FacebookClientSecret] [varchar](60) NOT NULL,
	[GreetingSubject] [varchar](120) NOT NULL,
	[GreetingMessage] [ntext] NOT NULL
) ON [PRIMARY]

insert into [dbo].[Settings] values (
	0,
	'C:\Websites\DigitalRodeo\Storage', 
	'C:\Websites\DigitalRodeo\Templates\Email',
	'192.168.1.2',
	'noreply@digitalrodeo.com',
	'Thank you for registering',
	'Your password',
	'You''ve been added as a neighbor by [name] on DigitalRodeo.com',
	'You have a new message from [name] on DigitalRodeo.com‏',
	'You have a new comment from [name] on DigitalRodeo.com‏',
	'yGsof16xjAMrNL5a3OzqA',
	'H083upto18HbJj1r4pnmV9wE9p3Nu5HrwvoKFQws',
	'e97e06de087572c6dbba3e2e0fe593ef',
	'b8ea4849bb3eb4917905defd32be0b25',
	'Welcome to the Digital Rodeo!',
	'Hi [name], <br /><br />Welcome to Digital Rodeo, the fastest growing music community around. Here at Digital Rodeo we pride ourselves on the ability to provide a safe and fun network, designed exclusively for country music enthusiasts.<br /><br />My name is Tim and I developed this website along with my buddy <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/jostin">Jostin</a>. We are here to help! So feel free to send us a message or comment at any time. If you need some help right away, visit our <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/help">help section</a>. It has a lot of really easy to understand tutorials as well as a Live Chat feature where you can connect with a help specialist (during business hours of course).<br /><br />What should you do now? I’m glad you asked! Here are some quick ideas to get you started on your new Digital Rodeo account:<br />&nbsp;&nbsp;- Fill your profile with content. <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/manage/profile/details">fill in some details about yourself</a>, <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/manage/photos/images/new">upload some photos</a>(as many as you want), express yourself through your profile with our easy to use <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/manage/profile/theme/edit">profile customizer</a>.<br />&nbsp;&nbsp;- Invite some friends! Dr is free so why not <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/neighborrequests">invite the friends you already know</a><br />&nbsp;&nbsp;- Make some new friends! You can use our <a style="color:#770000;font:bold 11px Arial, Verdana;text-decoration:none;" href="/search">search page</a> to find people in your area with similar interests.<br /><br /><br />Thanks for joining, we’re happy to see you here!<br />&nbsp;-Tim, Jostin, and the rest of the DR gang.'
)

