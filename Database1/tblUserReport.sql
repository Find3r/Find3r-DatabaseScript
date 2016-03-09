

CREATE TABLE [dbo].[UserReport] (
    [id]		  BIGINT IDENTITY NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,

	
	[idUser] BIGINT NOT NULL,
	[idReport] BIGINT NOT NULL,
	[following] BIT DEFAULT 1,

	
	FOREIGN KEY(idUser) REFERENCES [dbo].[User](id) ,
	FOREIGN KEY(idReport) REFERENCES [dbo].[Report](id) 
	
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[UserReport]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[UserReport]
    ADD CONSTRAINT [DF_UserReport_id] primary key(id);


GO
ALTER TABLE [dbo].[UserReport]
    ADD CONSTRAINT [DF_UserReport___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];

