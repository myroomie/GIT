if exists (select * from sys.objects where name = 'ee_GetPosts' and type = 'P')
	drop procedure ee_GetPosts
go

create Procedure ee_GetPosts
(
@UniversityId		int,
@Food				varchar(3)= null,
@City				varchar(max) = null,
@State				varchar(max) = null,
@Country			varchar (max) =null,
@ZipCode			int = null,
@Shared				varchar(1) =null,
@Single				varchar(1) =null,
@Gender				varchar(3) =null,
@RentMin			Money = null,
@RentMax			Money = null,
@Ethnicity			varchar(3) = null,
@Nationality		varchar(3) = null,
@AgeStart			int = null,
@AgeEnd				int = null
)
as
begin
	
	create table #Resultset
	(
	FirstName			varchar(max),
	LastName			varchar(max),
	RoomsAvailable		int,
	Vacancy				int,
	Rent				money,
	Email				varchar(max),
	Food				varchar(3) null,
	HouseNumber			varchar(10) null,
	Street				varchar(max),
	City				varchar(max),
	State				varchar(max),
	ZipCode				int,
	Shared				varchar(1) null,
	Single				varchar(1) null,
	Gender				varchar(3) null,
	Ethnicity			varchar(3) null,
	Nationality			varchar(3) null,
	AgeStart			int null,
	AgeEnd				int null,
	Description			varchar(max) null,
	DatePosted			Datetime	
	
	)
	
	insert into #Resultset
	(
	FirstName			,
	LastName			,
	RoomsAvailable		,
	Vacancy				,
	Rent				,
	Email				,
	Food				,
	HouseNumber			,
	Street				,
	City				,
	State				,
	ZipCode				,
	Shared				,
	Single				,
	Gender				,
	Ethnicity			,
	Nationality			,
	AgeStart			,
	AgeEnd				,
	Description			,
	DatePosted
	)
	select
	FirstName,			
	LastName,			
	RoomsAvailable,	
	Vacancy	,			
	Rent	,			
	Email	,			
	Food	,			
	HouseNumber	,		
	Street		,		
	City		,		
	State		,		
	ZipCode		,		
	Shared		,		
	Single		,		
	Gender		,		
	Ethnicity	,	
	Nationality	,	
	AgeStart	,	
	AgeEnd		,	
	Description	,
	PostDate			
	from Posts
	where UniversityId			= @UniversityId
	and	City					=  isnull(@City,City)	
	and	State					=  isnull(@State,State)
	and	ZipCode					=  isnull(@ZipCode,ZipCode)
	and	isnull(Shared,'')		=  isnull(@Shared, '')	
	and	isnull(Single,'')		=  isnull(@Single,'')	
	and	isnull(Gender,'')		=  isnull(@Gender,'')	
	and isnull(Food,'')			=  isnull(@Food,'')		
	and isnull(Ethnicity,'')	= isnull(@Ethnicity,'')	
	and isnull(Nationality,'')	= isnull(@Nationality,'')	
	and isnull(AgeStart,'')		= isnull(@AgeStart,'')	
	and isnull(AgeEnd,'')		= isnull(@AgeEnd,'')	
	and isnull(Rent,0)    between isnull(@RentMin,0) and isnull(@RentMax,9999999999)
	and PostDate > GETDATE()-30 
	--and Status = 1
	goto NormalExit
end


NormalExit:
  select * from #ResultSet
  order by DatePosted desc

  