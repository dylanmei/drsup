CREATE TABLE [dbo].[Theme](
	[Id] [bigint] IDENTITY (1,1) NOT NULL,
	[TabColor] [varchar](10) NULL,
	[TextColor] [varchar](10) NULL,
	[TextFont] [varchar](30) NULL,
	[TitleColor] [varchar](10) NULL,
	[LinkColor] [varchar](10) NULL,
	[BackgroundColor] [varchar](10) NULL,
	[BackgroundImage] [varchar](50) NULL,
	[ForegroundColor] [varchar](10) NULL,
	[BannerImage] [varchar](50) NULL,
 CONSTRAINT [PK_ProfileStyle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[tbl$Members] ADD [ThemeId] bigint NULL