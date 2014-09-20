if exists (select * from sys.objects where name = 'ii_AddPost' and type = 'P')
	drop procedure ii_AddPost
go

create Procedure ii_AddPost
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
 @Description		varchar(max) = null,
 @PostId			int out,
 @Code				int out
)
as
begin
set nocount on
insert into Posts
(		
	 UniversityId		,
	 FirstName			,
	 LastName			,
	 RoomsAvailable	,
	 Vacancy		,	
	 Rent			,	
	 Email			,	
	 Food			,	
	 HouseNumber	,	
	 Street			,
	 City			,	
	 State			,	
	 Country		,	
	 ZipCode		,	
	 Shared			,
	 Single			,
	 Gender			,
	 Status			,
	 Ethnicity		,
	 Nationality	,
	 AgeStart		,
	 AgeEnd			,
	 Description	,
	 PostDate
 )

 values
 (
	@UniversityId,	
	@FirstName,		
	@LastName,		
	@RoomsAvailable,
	@Vacancy		,
	@Rent			,
	@Email			,
	@Food			,
	@HouseNumber	,
	@Street		,
	@City		,	
	@State		,	
	@Country	,	
	@ZipCode	,	
	@Shared		,
	@Single		,
	@Gender		,
	0			,
	@Ethnicity	,	
	@Nationality,	
	@AgeStart	,	
	@AgeEnd		,
	@Description,
	GETDATE()
 )

select @PostId = @@IDENTITY

DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT

---- This will create a random number between 1 and 999
SET @Lower = 999 ---- The lowest random number
SET @Upper = 9999 ---- The highest random number
SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

select @Code = convert(varchar(4),@Random)
--select @Body = 'Please Enter the confirmation code on the website to verify your email address: ' + @Code

--EXEC [msdb].dbo.sp_send_dbmail @profile_name='Gmail',
--@recipients=@Email,
--@subject='Myroomie.info confirmation code',
--@body= @Body


update Posts
set ConfirmationCode = @Code 
where PostId = @PostId

 end

 