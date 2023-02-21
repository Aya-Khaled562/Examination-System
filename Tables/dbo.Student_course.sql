CREATE TABLE [dbo].[Student_course] (
  [course_id] [int] NOT NULL,
  [st_id] [int] NOT NULL,
  [grade] [int] NULL,
  CONSTRAINT [PK_Student_course] PRIMARY KEY CLUSTERED ([course_id], [st_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student_course]
  ADD CONSTRAINT [FK_Student_course_Course] FOREIGN KEY ([course_id]) REFERENCES [dbo].[Course] ([courses_id])
GO

ALTER TABLE [dbo].[Student_course]
  ADD CONSTRAINT [FK_Student_course_Student] FOREIGN KEY ([st_id]) REFERENCES [dbo].[Student] ([st_id])
GO