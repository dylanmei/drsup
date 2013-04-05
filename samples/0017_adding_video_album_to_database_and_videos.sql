if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl$Videos$Album]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) begin
	CREATE TABLE [dbo].[tbl$Videos$Album](
		[pk_AlbumID] [int] IDENTITY(1,1) NOT NULL,
		[dt_Created] [datetime] NULL,
		[tx_Title] [varchar](200) NULL,
		[tx_ShortTitle] [varchar](200) NULL,
		[tx_Description] [varchar](500) NULL,
		[fo_MainPhoto] [varchar](500) NULL,
		[no_UserID] [int] NULL,
		[bo_Privileges] [tinyint] NULL,
		[no_Position] [int] NULL,
		[bo_IsDeleted] [bit]
	) ON [PRIMARY]
end

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Videos' and COLUMN_NAME = 'fo_AlbumID')
	ALTER TABLE [dbo].[tbl$Videos] ADD fo_AlbumID int NULL


if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Videos$Album' and COLUMN_NAME = 'bo_IsDeleted')
	ALTER TABLE [dbo].[tbl$Videos$Album] ADD bo_IsDeleted int NULL
