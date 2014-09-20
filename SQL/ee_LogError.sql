if exists (select * from sys.objects where name = 'ee_LogError' and type = 'P')
	drop procedure ee_LogError
go

create Procedure ee_LogError
(
 @LastErrorTypeName varchar(max) = null,
 @LastErrorMessage varchar(max) = null,
 @LastErrorStackTrace varchar(max) = null
)

as
begin
set nocount on

insert into ErrorLog
(
LastErrorTypeName ,
LastErrorMessage ,
LastErrorStackTrace 
)
values
(
@LastErrorTypeName,
@LastErrorMessage ,
@LastErrorStackTrace
)

end