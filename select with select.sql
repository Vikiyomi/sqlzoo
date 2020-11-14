--1	Bigger than Russia
  select name from world
  where population > (select population from world where name = 'Russia' )
--2	Richer than UK
  select name from world
  where continent = 'Europe' and gdp/population > (select gdp/population from world where name = 'United Kingdom')
--3	Neighbours of Argentina and Australia
  select name, continent from world
  where continent in (select continent from world where name in ('Argentina','Australia')) order by name
--4	Between Canada and Poland
  select name, population from world
  where population > (select population from world where name = 'Canada')
  and population < (select population from world where name = 'Poland')
--5	Percentages of Germany
  select name, concat(round(100*population/(select population from world where name = 'Germany')),'%') from world
  where continent = 'Europe'
--6	Bigger than every country in Europe
  select name from world
  where gdp > All (select gdp from world where gdp > 0 and continent = 'Europe')
--7	Largest in each continent
  select continent,name from world x
  where x.name<= All(select name from world y where x.continent = y.continent)
--8	First country of each continent (alphabetically)
  select continent,name from world x
  where x.name<= All(select name from world y where x.continent = y.continent)
--9	Difficult Questions That Utilize Techniques Not Covered In Prior Sections
  select name, continent, population from world x
  where 25000000 >= All(select population from world y where x.continent=y.continent and population > 0) 
--10.Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
  select name, continent from world x
  where x.population > All (select y.population*3 from world y where x.continent = y.continent and x.name <> y.name )
