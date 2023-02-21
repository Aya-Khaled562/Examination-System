CREATE TABLE [dbo].[Instructor_courses] (
  [instr_id] [int] NOT NULL,
  [course_id] [int] NOT NULL,
  CONSTRAINT [PK_instructor_courses] PRIMARY KEY CLUSTERED ([instr_id], [course_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Instructor_courses]
  ADD CONSTRAINT [FK_Instructor_courses_Course] FOREIGN KEY ([course_id]) REFERENCES [dbo].[Course] ([courses_id])
GO

ALTER TABLE [dbo].[Instructor_courses]
  ADD CONSTRAINT [FK_Instructor_courses_Instructor] FOREIGN KEY ([instr_id]) REFERENCES [dbo].[Instructor] ([insrt_id])
GO