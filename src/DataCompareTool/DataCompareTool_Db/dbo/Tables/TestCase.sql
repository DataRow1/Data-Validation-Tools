CREATE TABLE [dbo].[TestCase] (
    [TestCaseId]             INT            IDENTITY (1, 1) NOT NULL,
    [TestLayerId]            INT            NULL,
    [Description]            VARCHAR (255)  NOT NULL,
    [SourceConnectionString] VARCHAR (255)  NOT NULL,
    [SourceQueryType]        VARCHAR (50)   NOT NULL,
    [SourceStatement]        VARCHAR (8000) NOT NULL,
    [TargetConnectionString] VARCHAR (255)  NOT NULL,
    [TargetQueryType]        VARCHAR (50)   NOT NULL,
    [TargetStatement]        VARCHAR (8000) NOT NULL,
    [Enabled]                BIT            NOT NULL,
    CONSTRAINT [PK_TestCaseId] PRIMARY KEY CLUSTERED ([TestCaseId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_TestCase_TestLayerId] FOREIGN KEY ([TestLayerId]) REFERENCES [dbo].[TestLayer] ([TestLayerId])
);