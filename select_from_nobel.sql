--1	nobel Nobel Laureates

--2	Winners from 1950
  SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950
---3	1962 Literature
  SELECT winner
  FROM nobel
  WHERE yr = 1962
   AND subject = 'Literature'
--4	Albert Einstein
  select yr, subject from nobel 
  where winner='Albert Einstein'
--5	Recent Peace Prizes
  select winner from nobel
  where subject='Peace' and yr>=2000
--6	Literature in the 1980's
  select yr, subject, winner from nobel
  where subject='Literature' and yr between 1980 and 1989  
--7	Only Presidents
  SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson','Jimmy Carter',
                  'Barack Obama')
--8	John
  select winner from nobel
  where winner like 'John%'
--9	Chemistry and Physics from different years
  select yr, subject, winner from nobel
  where (subject='Physics' and yr = 1980) 
  or (subject='Chemistry'and yr = 1984)
--10	Exclude Chemists and Medics
--11	Early Medicine, Late Literature
    select yr, subject, winner from nobel
    where (subject = 'Medicine' and yr<1910) or (subject='Literature' and yr>=2004)
--12	Harder Questions
--13	Umlaut
--14	Apostrophe
--15	Knights of the realm
--16	Chemistry and Physics last