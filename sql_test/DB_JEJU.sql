CREATE TABLE Stay(
Stay_ID char(4) NOT NULL,
Stay_Name varchar(100),
Stay_Addr varchar(100),
Stay_Num varchar(100),
Stay_Type varchar(100),
primary key(Stay_ID)
);

CREATE TABLE Olle(
Olle_ID char(2) Not Null,
Olle_Name varchar(100),
Olle_Start varchar(100),
Olle_End varchar(100),
Olle_Distance NUMBER,
Olle_Time NUMBER,
primary key(Olle_ID)
);

create table Eatery (
Eatery_ID char(4) NOt NULL,
Eatery_Name varchar(100),
Eatery_Addr varchar(100),
Eatery_Num varchar(100),
Eatery_Type varchar(100),
primary key(Eatery_ID)
);

create table Spot(
Spot_ID char(3),
Spot_Type varchar(100),
Spot_Name varchar(100),
Spot_Addr varchar(100),
primary key(Spot_ID)
);

create table Nature(
Nature_ID char(3),
Nature_Type varchar(100),
Nature_Name varchar(100),
Nature_Addr varchar(100),
primary key(Nature_ID)
);
select * from Stay;
select * from Olle;
select * from Eatery;
select * from Spot;
select * from Nature;

drop table Stay;
drop table Olle;
drop table Eatery;
drop table Spot;
drop table Nature;