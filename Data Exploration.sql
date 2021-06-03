-- Explotary Data Analysis

select 
	count(*)
from 
	netflix



-- Genre
select
	genre1 as genre,
	count(Genre1)  as count_of_genre,
	round(cast(count(Genre1) as float) / cast((select count(*) from netflix) as float) * 100,2) as percent_of_genre
from 
	netflix
where
	genre1 is not null 
	--[Series or Movie] = 'Movie'
	
group by
	genre1
order by
	2 desc

-- Movies


select
	genre1 as genre,
	count(Genre1)  as count_of_movie,
	round(cast(count(Genre1) as float) / cast((select count(*) from netflix where [Series or Movie] = 'Movie') as float) * 100,2) as percent_of_movie
from 
	netflix
where
	genre1 is not null and
	[Series or Movie] = 'Movie'
	
group by
	genre1
order by
	2 desc


-- Series 
select
	genre1 as genre,
	count(Genre1)  as count_of_series,
	round(cast(count(Genre1) as float) / cast((select count(*) from netflix where [Series or Movie] = 'series') as float) * 100,2) as percent_of_series
from 
	netflix
where
	genre1 is not null and
	[Series or Movie] = 'series'
	
group by
	genre1
order by
	2 desc


--language



select
	Languages as language,
	count(languages)  as count_of_languages,
	round(cast(count(languages) as float) / cast((select count(*) from netflix --where [Series or Movie] = 'series'
	) as float) * 100,2) as percent_of_languages
from 
	netflix
where
	genre1 is not null --and
	--[Series or Movie] = 'series'
	
group by
	Languages
order by
	2 desc



-- hidden gem(Series)



select top (10)
	title as movie,
	[hidden gem score]
from
	netflix
where
	[Series or Movie] = 'Series'
order by 
	2 desc


--hidden gem(Movies)



select top (10)
	title as movie,
	[hidden gem score]
from
	netflix
where
	[Series or Movie] = 'Movie'
order by 
	2 desc


-- Run time

select 
	runtime,
	count(runtime) as count,
	round(cast(count(runtime) as float) / cast((select count(*) from netflix) as float) * 100,2) as percent_of_runtime

from 
	netflix
where 
	runtime is not null
	--and [Series or Movie] = 'movie'
group by 
	
	runtime
order by 
	2 desc


-- IMBD

select 
	title,
	[IMDb Score] 
from 
	netflix
where
	[Series or Movie] = 'movie' --and
	--title like 'str%'
order by 
	2 desc,1


-- Box Office


select 
	title,
	year([release date]) as year_released,
	year([Netflix Release Date]) as year_available_on_netflix,
	Boxoffine as boxoffice,
	[Awards Received],
	[IMDb Votes]
from 
	netflix
where
	[Series or Movie] = 'movie' --and
	--title like 'str%'
	and Boxoffine is not null
	and [Awards Received] is not null
order by 
	4 desc,1


select 
	[production house],
	count([production house]) as count
from 
	netflix
group by 
	[Production House]
order by 2 desc