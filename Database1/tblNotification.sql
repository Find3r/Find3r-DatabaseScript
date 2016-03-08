CREATE TABLE [dbo].[tblNotification] (
    [id]		  BIGINT IDENTITY NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,
	[visibility] BIT DEFAULT 1,
	[description] VARCHAR(MAX) ,
	[idReport] BIGINT NOT NULL,

	
	FOREIGN KEY(idReport) REFERENCES [dbo].[Report](id) 
	
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[tblNotification]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[tblNotification]
    ADD CONSTRAINT [DF_Notification_id] primary key(id);


GO
ALTER TABLE [dbo].[tblNotification]
    ADD CONSTRAINT [DF_Notification___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];

