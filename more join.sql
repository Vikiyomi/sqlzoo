--1.1962 movies. List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr=1962

--2.When was Citizen Kane released? Give year of 'Citizen Kane'.
select yr
from movie 
where title='Citizen Kane'

--3. Star Trek movies. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

--4.id for actor Glenn Close. What id number does the actor 'Glenn Close' have?
select id
from actor
where name = 'Glenn Close'

--5. id for Casablanca. What is the id of the film 'Casablanca'
select id
from movie
where title = 'Casablanca'

--6. Cast list for Casablanca.
--Obtain the cast list for 'Casablanca'.
--what is a cast list?
--The cast list is the names of the actors who were in the movie.
--Use movieid=11768, (or whatever value you got from the previous question)
select actor.name
from actor join casting
on actorid = id
where movieid=11768

--7.Alien cast list. Obtain the cast list for the film 'Alien'
select name 
from actor join casting
on id=actorid
where movieid = (select id from movie where title='Alien')


--8.Harrison Ford movies. List the films in which 'Harrison Ford' has appeared
select title 
from movie join casting 
on movieid=id
where actorid = (select id from actor where name = 'Harrison Ford')


--9.Harrison Ford as a supporting actor. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select title 
from movie join casting 
on movieid=id
where actorid = (select id from actor where name = 'Harrison Ford') and ord!=1


--10. Lead actors in 1962 movies. List the films together with the leading star for all 1962 films.
select title, name
from actor join casting on actor.id=casting.actorid
join movie on movie.id=casting.movieid
where movie.yr = 1962
and ord=1

--11.Busy years for Rock Hudson. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2


--12.Lead actor in Julie Andrews movies. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
--Did you get "Little Miss Marker twice"?
--Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
--Title is not a unique field, create a table of IDs in your subquery
select movie.title, actor.name from 
movie join casting on movie.id=casting.movieid
      join actor on actor.id=casting.actorid
where movie.id in (

  SELECT movieid FROM casting
  WHERE actorid IN (
    SELECT id FROM actor
    WHERE name='Julie Andrews')
)
and ord=1
