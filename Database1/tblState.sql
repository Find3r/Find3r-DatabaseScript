
CREATE TABLE [dbo].[State] (
    [id]		  INT IDENTITY NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [pictureURL] VARCHAR(MAX) NOT NULL,
	[idCountry] SMALLINT NOT NULL,
	
	FOREIGN KEY(idCountry) REFERENCES [dbo].[Country](id) 
	
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[State]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[State]
    ADD CONSTRAINT [DF_State_id] primary key(id);


GO
ALTER TABLE [dbo].[State]
    ADD CONSTRAINT [DF_State___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];

