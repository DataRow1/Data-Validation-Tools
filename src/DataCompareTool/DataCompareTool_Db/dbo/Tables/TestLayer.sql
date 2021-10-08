CREATE TABLE [dbo].[TestLayer] (
    [TestLayerId]   INT           IDENTITY (1, 1) NOT NULL,
    [ApplicationId] INT           NULL,
    [Name]          VARCHAR (255) NOT NULL,
    [Description]   VARCHAR (255) NULL,
    [Source]        VARCHAR (255) NOT NULL,
    [Target]        VARCHAR (255) NOT NULL,
    [Enabled]       BIT           NOT NULL,
    CONSTRAINT [PK_TestLayerId] PRIMARY KEY CLUSTERED ([TestLayerId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_TestLayer_Application] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[Application] ([ApplicationId])
);