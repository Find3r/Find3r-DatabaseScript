
CREATE TABLE [dbo].[Report] (
    [id]		  BIGINT IDENTITY NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,
	[name] VARCHAR(50) NOT NULL,
	[description] VARCHAR(200) NOT NULL,
	[pictureURL] VARCHAR(MAX) NOT NULL,
	[date] DATETIMEOFFSET (3) NOT NULL,
	[totalComplaints] INT DEFAULT 0,
	[latitude] REAL DEFAULT 0,
	[longitude] REAL DEFAULT 0,
	[solved] BIT DEFAULT 0,
	[visibility] BIT DEFAULT 1 NOT NULL,
	[idState] INT NOT NULL,
	[idCategory] TINYINT NOT NULL,
	[idUser] BIGINT NULL,
	
	FOREIGN KEY(idState) REFERENCES [dbo].[State](id) ,
	FOREIGN KEY(idCategory) REFERENCES [dbo].[Category](id) ,
	FOREIGN KEY(idUser) REFERENCES [dbo].[User](id) 
	
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[Report]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[REPORT]
    ADD CONSTRAINT [DF_REPORT_id] primary key(id);


GO
ALTER TABLE [dbo].[Report]
    ADD CONSTRAINT [DF_REPORT___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];

