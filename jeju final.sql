use travel;
select * from eatery;
select * from nature;
select * from spot;
select * from olle;
select * from stay;
select * from r_eatery;
select * from r_spot;
select * from r_stay;
 
 create table R_Eatery(
 R_Eatery_Name varchar(400) Not NULL,
 R_Eatery_Old_Addr varchar(400),
 R_Eatery_Addr varchar(400),
 R_Eatery_Langtitude double,
 R_Eatery_Longtitude double,
 R_Eatery_Score double,
 R_Eatery_Views double,
 R_Eatery_Preference double,
 R_Eatery_Reviews double,
 R_Eatery_Bookmarks double,
 primary key(R_Eatery_Name)
 );
 
 create table R_Stay (
 R_Stay_Name varchar(400) not null,
 R_Stay_Old_Addr varchar(400),
 R_Stay_Addr varchar(400),
 R_Stay_Langtitude double,
 R_Stay_Longtitude double,
 R_Stay_Score double,
 R_Stay_Views double,
 R_Stay_Preference double,
 R_Stay_Reviews double,
 R_Stay_Bookmarks double,
 primary key(R_Stay_Name)
 );
 
  create table R_Spot (
 R_Spot_Name varchar(400) not null,
 R_Spot_Old_Addr varchar(400),
 R_Spot_Addr varchar(400),
 R_Spot_Langtitude double,
 R_Spot_Longtitude double,
 R_Spot_Score double,
 R_Spot_Views double,
 R_Spot_Preference double,
 R_Spot_Reviews double,
 R_Spot_Bookmarks double,
 primary key(R_Spot_Name)
 );
 

create table Stay(
Stay_ID char(3) Not null,
Stay_Type varchar(400),
Stay_Name varchar(400),
Stay_Addr varchar(400),
Stay_Num  varchar(100),
Stay_longtitude double,
Stay_langtitude double,
primary key(Stay_ID)
);

create table Spot(
Spot_ID char(3) Not null,
Spot_Type varchar(400),
Spot_Name varchar(400),
Spot_Addr varchar(400),
Spot_Num  varchar(100),
Spot_longtitude double,
Spot_langtitude double,
primary key(Spot_ID)
);

create table Eatery (
Eatery_ID char(4) NOt NULL,
Eatery_Name varchar(100),
Eatery_Addr varchar(100),
Eatery_Num varchar(100),
Eatery_Type varchar(100),
primary key(Eatery_ID)
);

create table Nature(
Nature_ID char(3) Not null,
Nature_Type varchar(400),
Nature_Name varchar(400),
Nature_Addr varchar(400),
Nature_longtitude double,
Nature_langtitude double,
primary key(Nature_ID)
);

CREATE TABLE Olle(
Olle_ID char(2) Not Null,
Olle_Name varchar(100),
Olle_Start varchar(100),
Olle_End varchar(100),
Olle_Distance double,
Olle_Time double,
primary key(Olle_ID)
);


 
select Spot_ID,spot_name,Spot_langtitude, Spot_longtitude from spot
where Spot_langtitude <= any(select Stay_langtitude + 0.00839 from stay 
where Stay_Name like '%글래드%') 
and Spot_langtitude >= any(select Spot_langtitude -0.00839 from stay where Stay_Name like '%글래드%')
and Spot_longtitude <= any(select Stay_longtitude + 0.11260 from stay where Stay_Name like '%글래드%')
and Spot_longtitude >= any(select Spot_longtitude - 0.11260 from stay where Stay_Name like '%글래드%')
order by Spot_longtitude asc;

  select spot_ID, Spot_Name, Spot_Addr from spot where spot_addr like '%이도1동%' and spot_addr like '%제주시%' order by spot_Name asc;
 select * from R_eatery;
 SELECT * FROM spot WHERE spot_Addr LIKE '%애월읍%' ORDER BY spot_ID ASC;
 select avg(r_eatery_Score) as '애월읍 음식점 별점 평균', avg(r_stay_Score) as '애월읍 숙소 별점 평균' 
 from r_eatery,r_stay
 where R_Eatery_Addr like '%애월읍%' and R_Stay_Addr like '%애월읍%';

