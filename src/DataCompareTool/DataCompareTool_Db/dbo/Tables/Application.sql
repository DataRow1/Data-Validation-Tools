CREATE TABLE [dbo].[Application] (
    [ApplicationId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (50)  NOT NULL,
    [Description]   VARCHAR (255) NULL,
    [CategoryId]    INT           NOT NULL,
    CONSTRAINT [PK_ApplicationId] PRIMARY KEY CLUSTERED ([ApplicationId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ApplicationCategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[ApplicationCategory] ([CategoryId])
);