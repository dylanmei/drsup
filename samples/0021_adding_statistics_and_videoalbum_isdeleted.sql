
-- Add Video Plays Table
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl$VideoPlays]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[tbl$VideoPlays](
	[pk_PlayID] [bigint] IDENTITY(1,1) NOT NULL,
	[fo_Listener] [int] NULL,
	[tx_IP] [varchar](50) NULL,
	[fo_VideoID] [int] NOT NULL,
	[dt_Played] [datetime] NULL,
	[dr_src] [int] NULL,
 CONSTRAINT [PK_tbl$VideoPlays] PRIMARY KEY CLUSTERED 
(
	[pk_PlayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END


-- Update Web Statistics Stored Procedure
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_WebStatisticsGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_WebStatisticsGet]
GO

CREATE PROC [dbo].[sp_WebStatisticsGet] 	
AS		
	-- Get Music Play Counts
	select top 20 fo_TrackID as TrackID, t.tx_Title as Title, t.tx_MP3Location as Location, m.UserName as Artist, count(*) as PlayCount 
		from tbl$Music$TrackPlays tp
			JOIN tbl$Music$Track t ON t.pk_TrackID = tp.fo_TrackID	
			LEFT OUTER JOIN tbl$Music$Album ma ON ma.pk_AlbumID = t.fo_AlbumID	
			LEFT OUTER JOIN tbl$Members m on m.MemberID = ma.no_ArtistID
			Group By fo_TrackID, t.tx_Title, m.UserName, t.tx_MP3Location
			ORDER BY COUNT(*) DESC
	
	-- Get Video Play Counts
	select top 20 fo_VideoID as VideoID, v.tx_Title as Title, v.tx_Location as Location, COUNT(*) as PlayCount
		FROM tbl$VideoPlays vp
			JOIN tbl$Videos v on v.pk_VideoID = vp.fo_VideoID
			LEFT OUTER JOIN tbl$Videos$Album va ON va.pk_AlbumId = v.fo_AlbumID	
			LEFT OUTER JOIN tbl$Members m on m.MemberID = va.no_UserId			
			GROUP BY fo_VideoID, v.tx_Title, m.UserName, v.tx_Location
			ORDER BY COUNT(*) DESC	

-- Add IsDeleted Column to Video Albums
if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tbl$Videos$Album' and COLUMN_NAME = 'bo_IsDeleted')
	ALTER TABLE [dbo].[tbl$Videos$Album] ADD bo_IsDeleted int NULL