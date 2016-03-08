CREATE TABLE [dbo].[User] (
    [id]		  BIGINT  NOT NULL,
    [__createdAt] DATETIMEOFFSET (3) NOT NULL,
    [__updatedAt] DATETIMEOFFSET (3) NULL,
    [__version]   ROWVERSION         NOT NULL,
	[name] VARCHAR(50) NOT NULL,
    [lastName] VARCHAR(70) NOT NULL,
    [phoneNumber] VARCHAR(25) NOT NULL,
    [alternativePhoneNumber] VARCHAR(25) NOT NULL,
    [profilePictureURL] VARCHAR(MAX) NOT NULL,
    [coverPictureURL] VARCHAR(MAX) NOT NULL,
    [gender] BIT NOT NULL,
    [age] TINYINT,
    [idState] INT NOT NULL,
    [idFacebook] BIGINT,
    [facebook_profile] VARCHAR(MAX),   
    [totalComments] BIGINT DEFAULT 0,
    [positiveComments] BIGINT DEFAULT 0 ,
    [negativeComments] BIGINT DEFAULT 0,
    [banned] BIT DEFAULT 0,
    
    
	FOREIGN KEY(idState) REFERENCES [dbo].[State](id) 
	
);


GO
CREATE CLUSTERED INDEX [__createdAt]
    ON [dbo].[User]([__createdAt] ASC);


GO
ALTER TABLE [dbo].[User]
    ADD CONSTRAINT [DF_User_id] primary key(id);


GO
ALTER TABLE [dbo].[User]
    ADD CONSTRAINT [DF_User___createdAt] DEFAULT (CONVERT([datetimeoffset](3),sysutcdatetime(),(0))) FOR [__createdAt];
