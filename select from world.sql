--8.Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
--Australia has a big area but a small population, it should be included.
--Indonesia has a big population but a small area, it should be included.
--China has a big population and big area, it should be excluded.
--United Kingdom has a small population and a small area, it should be excluded.
select name, population, area from world
where (area > 3000000) xor (population >250000000)

--9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
--For South America show population in millions and GDP in billions both to 2 decimal places.
select name, round (population/1000000,2),round(GDP/1000000000,2) 
from world
where continent = 'South America'
