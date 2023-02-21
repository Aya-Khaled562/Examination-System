CREATE TABLE [dbo].[Student] (
  [st_id] [int] IDENTITY,
  [fname] [varchar](50) NULL,
  [lname] [varchar](50) NULL,
  [st_gender] [varchar](3) NULL,
  [st_phone] [varchar](11) NULL,
  [st_birthdate] [date] NULL,
  [st_joindate] [date] NULL,
  [dept_id] [int] NULL,
  [city] [varchar](50) NULL,
  [street] [varchar](50) NULL,
  CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([st_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student]
  ADD CONSTRAINT [FK_Student_Department] FOREIGN KEY ([dept_id]) REFERENCES [dbo].[Department] ([dept_id])
GO