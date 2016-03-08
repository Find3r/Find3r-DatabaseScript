
CREATE TABLE [dbo].[Comment] (
    [id]		  BIGINT IDENTITY NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,
	[description] VARCHAR(50) NOT NULL,
	
	[idUser] BIGINT NOT NULL,
	[idReport] BIGINT NOT NULL,

	
	FOREIGN KEY(idUser) REFERENCES [dbo].[User](id) ,
	FOREIGN KEY(idReport) REFERENCES [dbo].[Report](id) 
	
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[Comment]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[Comment]
    ADD CONSTRAINT [DF_Comment_id] primary key(id);


GO
ALTER TABLE [dbo].[Comment]
    ADD CONSTRAINT [DF_Comment___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];

