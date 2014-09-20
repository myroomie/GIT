if exists (select * from sys.objects where name = 'ee_GetRefernceCodes' and type = 'P')
	drop procedure ee_GetRefernceCodes
go

create Procedure ee_GetRefernceCodes
(
@Type varchar(max),
@Subtype varchar (max)
)

as
begin

create table #ResultSet
(
 Code varchar(3),
 Name varchar(max)
)
insert into #ResultSet
(
 Code, 
 Name 
)
select
Code,
Name
from ReferenceCodes 
where Type = @Type and Subtype = @Subtype
end

NormalExit:
  select * from #ResultSet