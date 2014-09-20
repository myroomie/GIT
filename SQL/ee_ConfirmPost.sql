if exists (select * from sys.objects where name = 'ee_ConfirmPost' and type = 'P')
	drop procedure ee_ConfirmPost
go

create Procedure ee_ConfirmPost
(
@PostId varchar(max),
@ConfirmationCode varchar(4)
)
as
begin
set nocount on

declare @OriginalCode varchar(4)
select @OriginalCode = ConfirmationCode 
from Posts
where PostId = @PostId

if @OriginalCode = @ConfirmationCode
begin
update Posts set Status = 1 where PostId = @PostId
end
end