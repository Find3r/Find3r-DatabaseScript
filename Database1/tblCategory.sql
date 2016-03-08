CREATE TABLE [dbo].[Category] (
    [id]		  TINYINT  NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,
    [name] VARCHAR(25) NOT NULL,
    [pictureURL] VARCHAR(MAX) NOT NULL
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[Category]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[Category]
    ADD CONSTRAINT [DF_Category_id] primary key(id);


GO
ALTER TABLE [dbo].[Category]
    ADD CONSTRAINT [DF_Category___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];
