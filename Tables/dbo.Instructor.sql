CREATE TABLE [dbo].[Instructor] (
  [insrt_id] [int] IDENTITY,
  [fname] [varchar](50) NULL,
  [lname] [varchar](50) NULL,
  [ins_phone] [varchar](11) NULL,
  [dept_id] [int] NULL,
  [city] [varchar](50) NULL,
  [street] [varchar](50) NULL,
  [hire_date] [date] NULL,
  CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([insrt_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Instructor]
  ADD CONSTRAINT [FK_Instructor_Department] FOREIGN KEY ([dept_id]) REFERENCES [dbo].[Department] ([dept_id])
GO

ALTER TABLE [dbo].[Instructor]
  ADD CONSTRAINT [FK_Instructor_Department1] FOREIGN KEY ([dept_id]) REFERENCES [dbo].[Department] ([dept_id])
GO