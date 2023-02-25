CREATE TABLE [dbo].[Student_exams_questions] (
  [st_id] [int] NOT NULL,
  [exam_id] [int] NOT NULL,
  [qs_id] [int] NOT NULL,
  [grade] [int] NULL,
  [answer] [varchar](10) NULL,
  [is_corrected] [int] NULL CONSTRAINT [DF_Student_exams_questions_is_corrected] DEFAULT (0),
  CONSTRAINT [PK_Student_exams_questions] PRIMARY KEY CLUSTERED ([st_id], [exam_id], [qs_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student_exams_questions]
  ADD CONSTRAINT [FK_Student_exams_questions_Exam] FOREIGN KEY ([exam_id]) REFERENCES [dbo].[Exam] ([exam_id])
GO

ALTER TABLE [dbo].[Student_exams_questions]
  ADD CONSTRAINT [FK_Student_exams_questions_Question] FOREIGN KEY ([qs_id]) REFERENCES [dbo].[Question] ([q_id])
GO

ALTER TABLE [dbo].[Student_exams_questions]
  ADD CONSTRAINT [FK_Student_exams_questions_Student] FOREIGN KEY ([st_id]) REFERENCES [dbo].[Student] ([st_id])
GO