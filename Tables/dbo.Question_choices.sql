CREATE TABLE [dbo].[Question_choices] (
  [q_id] [int] NOT NULL,
  [choices] [varchar](50) NOT NULL,
  CONSTRAINT [PK_Question_choices_1] PRIMARY KEY CLUSTERED ([q_id], [choices])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Question_choices]
  ADD CONSTRAINT [FK_Question_choices_Question] FOREIGN KEY ([q_id]) REFERENCES [dbo].[Question] ([q_id])
GO