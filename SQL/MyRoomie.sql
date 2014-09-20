select * from universities
select * from ReferenceCodes
alter table Universities
add Universityid int identity

drop table Posts
create table Posts
( PostId			int identity,
  UniversityId		int,
  FirstName			varchar(max),
  LastName			varchar(max),
  RoomsAvailable int,
  Vacancy int,
  Rent money,
  Email varchar(max),
  Food varchar(3) null,
  HouseNumber varchar(10) null,
  Street	varchar(max),
  City	varchar(max),
  State varchar(max),
  Country varchar (max) null,
  ZipCode int,
  Shared varchar(1) null,
  Single varchar(1) null,
  Gender varchar(3) null,
  AgeGroup	varchar(3) null,
  ConfirmationCode	varchar(4) null,
  Status int null
  )

  drop table ReferenceCodes
  create table ReferenceCodes
  (
  ReferenceCodeId int identity,
  Type varchar(max),
  Subtype varchar(max),
  Code varchar(3),
  Name varchar(max)
  )
  
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('YesNo','YesNo','Y','Yes')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('YesNo','YesNo','N','No')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('Food','Food','VEG','Vegetarian')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('Food','Food','NVG','Non-Vegetarian')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('Food','Food','VAN','Vegan')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('Gender','Gender','MAL','Male')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('Gender','Gender','FEM','Female')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('AgeGroup','AgeGroup','13','13-20')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('AgeGroup','AgeGroup','21','21-30')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('AgeGroup','AgeGroup','31','31-40')
  insert into ReferenceCodes (Type,Subtype,Code,Name)
  values('AgeGroup','AgeGroup','41','41+')




  EXECUTE msdb.dbo.sysmail_add_account_sp
    @account_name = 'AdventureWorks Administrator',
    @description = 'Mail account for administrative e-mail.',
    @email_address = 'dba@Adventure-Works.com',
    @display_name = 'AdventureWorks Automated Mailer',
    @mailserver_name = 'smtp.Adventure-Works.com' ;

	EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'Profile Name',
@description = 'Desciption'


select * from posts


--------------------------------------------------------9/19/2014---------------------

alter table Posts
add 
AgeStart int null,
AgeEnd int null,
Ethnicity varchar(3) null,
Nationality varchar(3) null

alter table Posts
add Description varchar(max) null


--------------------------------------------------------9/20/2014---------------------------

create table ErrorLog
(
LastErrorTypeName varchar(max) null,
LastErrorMessage varchar(max) null,
LastErrorStackTrace varchar(max) null
)

select * from ErrorLog

------------------------------------------------------9/20/2014------------------------------

alter table Posts
add PostDate Datetime
