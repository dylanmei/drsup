set nocount on

set nocount on
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Videos' and COLUMN_NAME = 'bo_IsDeleted')
	ALTER TABLE tbl$videos ADD bo_IsDeleted BIT DEFAULT 0

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Pictures' and COLUMN_NAME = 'bo_IsDeleted')
	ALTER TABLE tbl$Pictures ADD bo_IsDeleted BIT DEFAULT 0

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Pictures$album' and COLUMN_NAME = 'bo_IsDeleted')
	ALTER TABLE tbl$Pictures$album ADD bo_IsDeleted BIT default 0
GO
UPDATE tbl$Pictures$album SET bo_isdeleted= 0 WHERE bo_isdeleted is null
UPDATE tbl$Pictures SET bo_isdeleted= 0 WHERE bo_isdeleted is null
UPDATE tbl$Videos SET bo_isdeleted= 0 WHERE bo_isdeleted is null
