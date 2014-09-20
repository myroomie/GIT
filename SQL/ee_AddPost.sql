if exists (select * from sys.objects where name = 'ee_AddPost' and type = 'P')
	drop procedure ee_AddPost
go

create Procedure ee_AddPost
(
 @UniversityId		int,
 @FirstName			varchar(max)= null,
 @LastName			varchar(max)=null,
 @RoomsAvailable	int =null,
 @Vacancy			int =null,
 @Rent				money=null,
 @Email				varchar(max)= null,
 @Food				varchar(3)= null,
 @HouseNumber		varchar(10) =null,
 @Street			varchar(max) =null,
 @City				varchar(max) =null,
 @State				varchar(max) =null,
 @Country			varchar (max) =null,
 @ZipCode			int=null,
 @Shared			varchar(1) =null,
 @Single			varchar(1) =null,
 @Gender			varchar(3) =null,
 @Ethnicity			varchar(3) = null,
 @Nationality		varchar(3) = null,
 @AgeStart			int = null,
 @AgeEnd			int = null,
 @Description		varchar(max) = null
)

as
begin
set nocount on

declare @PostId int,
		@Code int

	exec ii_AddPost
	@UniversityId			=	@UniversityId	,
	@FirstName				=	@FirstName	,	
	@LastName				=	@LastName	,	
	@RoomsAvailable			=	@RoomsAvailable,
	@Vacancy				=	@Vacancy	,	
	@Rent					=	@Rent	,		
	@Email					=	@Email	,		
	@Food					=	@Food	,		
	@HouseNumber			=	@HouseNumber	,
	@Street					=	@Street	,	
	@City					=	@City	,		
	@State					=	@State	,		
	@Country				=	@Country,		
	@ZipCode				=	@ZipCode,		
	@Shared					=	@Shared,		
	@Single					=	@Single,		
	@Gender					=	@Gender,	
    @Ethnicity				=	@Ethnicity,		
	@Nationality			=	@Nationality,	
	@AgeStart				=	@AgeStart,		
	@AgeEnd				    =	@AgeEnd,		
	@Description		    =   @Description,
	@PostId                 =   @PostId out,
	@Code					=   @Code out


end

NormalExit:
select 'PostId' = @PostId, 'Code' = @Code