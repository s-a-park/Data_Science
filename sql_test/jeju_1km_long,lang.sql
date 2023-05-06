use travel;
select * from eatery;
select * from nature;
select * from spot;
select * from olle;
select * from stay;

select Spot_ID,spot_name,Spot_langtitude, Spot_longtitude from spot
where Spot_langtitude <= any(select Stay_langtitude + 0.00839 from stay 
where Stay_Name like '%글래드%') 
and Spot_langtitude >= any(select Spot_langtitude -0.00839 from stay where Stay_Name like '%글래드%')
and Spot_longtitude <= any(select Stay_longtitude + 0.11260 from stay where Stay_Name like '%글래드%')
and Spot_longtitude >= any(select Spot_longtitude - 0.11260 from stay where Stay_Name like '%글래드%')
order by Spot_longtitude asc;
 