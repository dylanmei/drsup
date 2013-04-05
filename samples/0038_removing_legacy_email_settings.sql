if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Settings' and COLUMN_NAME = 'RegistrationEmailSubject')
	alter table [dbo].[Settings] drop column [RegistrationEmailSubject]
if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Settings' and COLUMN_NAME = 'ForgotPasswordEmailSubject')
	alter table [dbo].[Settings] drop column [ForgotPasswordEmailSubject]
if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Settings' and COLUMN_NAME = 'NeighborRequestEmailSubject')
	alter table [dbo].[Settings] drop column [NeighborRequestEmailSubject]
if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Settings' and COLUMN_NAME = 'NewMessageEmailSubject')
	alter table [dbo].[Settings] drop column [NewMessageEmailSubject]
if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Settings' and COLUMN_NAME = 'NewCommentEmailSubject')
	alter table [dbo].[Settings] drop column [NewCommentEmailSubject]

