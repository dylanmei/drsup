
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Article]') AND type in (N'U')) 
	drop table  [dbo].[Article]
	
CREATE TABLE [dbo].[Article](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[ArticleTypeID] [int] NOT NULL,
	[Content] [text] NOT NULL,
	[Author] [varchar](150) NOT NULL,
	[Published] [bit] NOT NULL,
	[PublishedDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
