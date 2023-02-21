CREATE TABLE [dbo].[Department] (
  [dept_id] [int] IDENTITY,
  [dept_manager] [int] NULL,
  [dept_name] [varchar](50) NULL,
  CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([dept_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Department]
  ADD CONSTRAINT [FK_Department_Instructor] FOREIGN KEY ([dept_manager]) REFERENCES [dbo].[Instructor] ([insrt_id])
GO