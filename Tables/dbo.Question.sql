CREATE TABLE [dbo].[Question] (
  [q_id] [int] IDENTITY,
  [question] [varchar](200) NULL,
  [q_type] [varchar](50) NULL,
  [q_grade] [int] NULL,
  [q_answer] [varchar](10) NULL,
  [courses_id] [int] NULL,
  CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED ([q_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Question]
  ADD CONSTRAINT [FK_Question_Course] FOREIGN KEY ([courses_id]) REFERENCES [dbo].[Course] ([courses_id])
GO