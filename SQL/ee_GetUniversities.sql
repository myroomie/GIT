if exists (select * from sys.objects where name = 'ee_GetUniversities' and type = 'P')
	drop procedure ee_GetUniversities
go

create Procedure ee_GetUniversities

as
begin
create table #ResultSet
(
UniversityId int,
UniversityName nvarchar(max)
)
insert into #ResultSet
(
UniversityId,
UniversityName
)
select
UniversityId,
Name
from Universities

end

NormalExit:
  select * from #ResultSet
  order by UniversityName