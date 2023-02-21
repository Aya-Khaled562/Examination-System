CREATE TABLE [dbo].[Course] (
  [courses_id] [int] IDENTITY,
  [course_name] [varchar](50) NULL,
  [duration] [int] NULL,
  [topic_id] [int] NULL,
  CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([courses_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Course]
  ADD CONSTRAINT [FK_Course_Topic] FOREIGN KEY ([topic_id]) REFERENCES [dbo].[Topic] ([topic_id])
GO