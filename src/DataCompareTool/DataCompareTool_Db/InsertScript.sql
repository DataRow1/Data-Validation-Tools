delete log.TestCaseResult
delete log.TestLayerRun
delete log.ApplicationRun
delete dbo.TestCase
delete dbo.TestLayer
delete dbo.Application
delete dbo.ApplicationCategory

dbcc checkident('log.TestCaseResult', reseed, 0)
dbcc checkident('log.TestLayerRun', reseed, 0)
dbcc checkident('log.ApplicationRun', reseed, 0)
dbcc checkident('dbo.TestCase', reseed, 0)
dbcc checkident('dbo.TestLayer', reseed, 0)
dbcc checkident('dbo.Application', reseed, 0)
dbcc checkident('dbo.ApplicationCategory', reseed, 0)

-- Insert script
declare @applicationid int
	, @testlayerid int
	, @testcaseid int

insert into dbo.ApplicationCategory (Name, Description)
values ('Demo', 'Category for demonstration and example purposes')
	, ('Cube', 'Category for multidimensional or tabular cubes')
	, ('Datafeed', 'Category for datafeeds')

insert into dbo.Application (Name, Description, CategoryId)
values ('Demo application', 'Dummy application solely for demonstration purposes', 1)

set @applicationid = @@IDENTITY


insert into dbo.TestLayer (ApplicationId, Name, Description, Source, Target/*, SequenceNo*/, Enabled)
values (@applicationid, 'Staging - ODS', '(Example) Comparing staging layer to ODS layer', 'Source description here', 'Target description here'/*, 1*/, 1)

set @testlayerid = @@IDENTITY


insert into dbo.TestCase (TestLayerId, Description, SourceConnectionString, SourceQueryType, SourceStatement, TargetConnectionString, TargetQueryType, TargetStatement/*, SequenceNo*/, Enabled)
values (
	@testlayerid
	, 'Dummy query with equal result'
	, 'Data Source=DEVBOX-WIN\DEV;Initial Catalog=InControl;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;'
	, 'SQL'
	, 'select cast(_AXIS as varchar(255)) as _AXIS, cast(_VALUE as varchar(255)) as _VALUE from (
			select ''Dummy Equal Test'' as _AXIS
			, 2 as _VALUE
		) sub'
	, 'Data Source=DEVBOX-WIN\DEV;Initial Catalog=InControl;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;'
	, 'SQL'
	, 'select _AXIS, _VALUE from (
			select ''Dummy Equal Test'' as _AXIS
			, 2 as _VALUE
		) sub'
	--, 1
	, 1
	)

insert into dbo.TestCase (TestLayerId, Description, SourceConnectionString, SourceQueryType, SourceStatement, TargetConnectionString, TargetQueryType, TargetStatement/*, SequenceNo*/, Enabled)
values (
	@testlayerid
	, 'Dummy query with unequal result'
	, 'Data Source=DEVBOX-WIN\DEV;Initial Catalog=InControl;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;'
	, 'SQL'
	, 'select cast(_AXIS as varchar(255)) as _AXIS, cast(_VALUE as varchar(255)) as _VALUE from (
			select ''Dummy Unuqual Test'' as _AXIS
			, 5 as _VALUE
		) sub'
	, 'Data Source=DEVBOX-WIN\DEV;Initial Catalog=InControl;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;'
	, 'SQL'
	, 'select _AXIS, _VALUE from (
			select ''Dummy Unequal Test'' as _AXIS
			, 10 as _VALUE
		) sub'
	--, 1
	, 1
	)