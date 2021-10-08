CREATE TABLE [dbo].[ApplicationCategory] (
    [CategoryId]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ApplicationCategoryId] PRIMARY KEY CLUSTERED ([CategoryId] ASC) WITH (FILLFACTOR = 80)
);