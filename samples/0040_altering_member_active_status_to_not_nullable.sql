set nocount on
update [dbo].[tbl$Members] set Active = 0 where Active is null
ALTER TABLE [dbo].[tbl$Members] ALTER COLUMN [Active] tinyint not null
