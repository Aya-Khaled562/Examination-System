CREATE TABLE [dbo].[Student_course] (
  [course_id] [int] NOT NULL,
  [st_id] [int] NOT NULL,
  [grade] [int] NULL,
  CONSTRAINT [PK_Student_course] PRIMARY KEY CLUSTERED ([course_id], [st_id])
)
ON [PRIMARY]
GO