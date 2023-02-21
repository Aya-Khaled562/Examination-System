CREATE TABLE [dbo].[Exam] (
  [exam_id] [int] IDENTITY,
  [ex_date] [date] NULL,
  CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED ([exam_id])
)
ON [PRIMARY]
GO