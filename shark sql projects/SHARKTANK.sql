select * from project1..data;

-- total number of episodes (30)---
select count(distinct(Epi)) episode from project1..data;
--or--
select max(epi) from project1..data;

-- numbers of pitches in shark tanks (98)---
select count(distinct(brand)) brand from project1..data;

-- how many startup's get funding's (57)---
select count(Amount_invest) as got_funds from project1..data 
where (amount_invest)>0 ;

-- how many startups get no funding's (40)---
select count(amount_invest) as not_funds from project1..data
where (amount_invest)=0 ;

-- pitches converted---

select amount_invest, case when (amount_invest)>0 then' got_fund' else 'not_fund' 
end as quality from project1..data;
--- or---
---count number of pitches--
select sum(a.got_fund_not_fund)funds_recive,count(*) total_pitches from(
select (amount_invest) ,case when (amount_invest)>0 then 1 else 0 end as got_fund_not_fund from project1..data)a;

--- total number of males enterprenuers ---
select sum(male) male_enterprenuer from project1..data;

-- total number of female enterprenuers ----
select sum(female) female_enterpreners from project1..data;

-- gender ratios---
select round(sum(female)/sum(male),2 )from project1..data;

-- total number invested ---
select sum(amount_invest) from project1..data;

--- average equity taken by sharks-----

select avg(Equity_Taken) from project1..data
where (equity_taken)>0;

-- highest deals on sharks tanks---
select max(amount_invest) from project1..data;

--- highest equity taken by sharks---
select max(equity_taken) from project1..data;

--- startup_have_one_females--
select sum(a.female_domi) startup_have_one_female from (
select female,
case
when female>0 then 1
else 0
end as female_domi
from project1..data)a;

-- pitches converted having atleat one womens---
select sum(b.female_count) as shark_invest_atleast_females from(
select case when a.female>0 then 1 else 0 end as female_count,a. * from(
(select * from project1..data
where deal!='NO DEAL'))a)b;

--average team members--
select avg(team_members) as team_member from project1..data;

-- amount invested per deal--
select avg(a.amount_invest) amount_per_deal from 
(select * from project1..data where deal!='No Deal') a;

-- average age group of contestants --
select Avg_age,count(Avg_age) cnt from  project1..data group by Avg_age order by cnt desc;

-- locations group of contestants --
select (location),count(location) cnt from project1..data group by location order by cnt desc;

-- sector group of contestants---
select sector,count(sector) cnt from project1..data group by sector order by cnt desc;

--  partners groups of contestants --
select partners,count(partners) cnt from project1..data group by partners order by cnt desc;

---  total number of deals by ashneer----
select 'Ashner' as ashner , count(Ashneer_Amount_Invested) as ashneer_amount_invested_enterprenaurs from project1..data
where Ashneer_Amount_Invested is not null and Ashneer_Amount_Invested!=0;

---  total number of deals by narmita-----
select 'narmita' as narmita , count(Namita_Amount_Invested) as Namita_Amount_Invested_enterprenaurs from project1..data
where Namita_Amount_Invested is not null and Namita_Amount_Invested!=0;

-- totla number of deals by anupam----
select 'anupam' as anupam , count(Anupam_Amount_Invested) as Anupam_Amount_Invested_enterprenaurs from project1..data
where Anupam_Amount_Invested is not null and Anupam_Amount_Invested!=0;

-- total number of vineeta---
select 'vineeta' as vineeta , count(Vineeta_Amount_Invested) as Vineeta_Amount_Invested_enterprenaurs from project1..data
where Vineeta_Amount_Invested is not null and Vineeta_Amount_Invested!=0;

--  total number of aman deals----

select 'Aman' as Aman , count(Aman_Amount_Invested) as Aman_Amount_Invested_enterprenaurs from project1..data
where Aman_Amount_Invested is not null and Aman_Amount_Invested!=0;




