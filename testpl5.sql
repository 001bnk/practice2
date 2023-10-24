--------------------------------------------------------------------------------
--SHOW ALL THE OLYMPICS EVER HELD BY YEAR
--------------------------------------------------------------------------------
select distinct(games),year
from olympic
order by year;
--------------------------------------------------------------------------------
--HOW MANY OLYMPICS GAMES HAVE BEEN HELD
--------------------------------------------------------------------------------
select count( distinct(games)) no_of_olympics_held
from olympic;

--------------------------------------------------------------------------------
--LIST DOWN ALL OYMPICS GAMES HELD SO FAR
--------------------------------------------------------------------------------
select distinct(sport)
from olympic;

--------------------------------------------------------------------------------
--NUMBER OF DIFFERENT GAMES EVER PLAYED IN OLYMPICS
--------------------------------------------------------------------------------
select count(distinct(sport))Sprots_ever_played
from olympic;

--------------------------------------------------------------------------------
--NUMBER OF MALE AND FEMALE ATHELETES PARTICIPATING IN OLYMPIC HELD IN RIO DE JANERIO
--------------------------------------------------------------------------------

select sex,count(sex)count
from olympic
where city='Rio de Janeiro'
group by sex;

--------------------------------------------------------------------------------
--MENTION TOTAL NUMBER OF NATIONS WHO PARTICIPATED IN EACH OLYMPICS GAMES
--------------------------------------------------------------------------------
select games,count(distinct (team))no_of_nations_participated
from olympic
group by games
order by games;

-------------------------------------------------------------------------------
--FETCH THE DETAILS OF OLDEST ALTHLETES TO PARTICIPATE IN OLYMPICS
-------------------------------------------------------------------------------
select name ,medal ,age 
from olympic where age=(select max(age)
                        from olympic);


--------------------------------------------------------------------------------
--WHICH OLYMPICS SAW THE HIGHEST AND LOWEST NUMBER OF PARTICIPATING NATIONS
--------------------------------------------------------------------------------
(select games,count(distinct (team))npn
from olympic
group by games
order by npn
fetch first 1 rows only)
union
(select games,count(distinct (team))npn
from olympic
group by games
order by npn desc
fetch first 1 rows only);
-------------------------------------------------------------------------------
--FETCH DETAILS OF THE OLDEST ALTHELETE TO WIN GOLD MEDAL
-------------------------------------------------------------------------------
select name ,team,sport,age,medal
from olympic where medal='Gold' 
order by age desc 
fetch first 1 rows only;


--------------------------------------------------------------------------------
-- FETCH THE TOP 5 ATHELETE WHO HAVE WON THE MOST GOLD MEDALS IN OLYMPICS
--------------------------------------------------------------------------------
select name,count(medal)NO_of_golds
from olympic
where medal='Gold'
group by name
order by No_of_golds desc
fetch first 5 rows only;
--------------------------------------------------------------------------------
--FETCH TOP 5 ATHELETE WITH MOST NUMBER OF MEDALS
--------------------------------------------------------------------------------
select name,count(medal)NO_of_medals
from olympic
group by name
order by No_of_medals desc
fetch first 5 rows only;

--------------------------------------------------------------------------------
--FETCH TOP 5 MOST SUCCESSFUL COUNTRIES IN OLYMPIC
--------------------------------------------------------------------------------
select team,count(medal)NO_of_medals
from olympic
group by team
order by No_of_medals desc
fetch first 5 rows only;
--------------------------------------------------------------------------------