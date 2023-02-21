CREATE TABLE [dbo].[Topic] (
  [topic_id] [int] IDENTITY,
  [topic_name] [varchar](50) NULL,
  CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED ([topic_id])
)
ON [PRIMARY]
GO