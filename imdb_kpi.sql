#KPI :
#Average IMDb Rating
SELECT round(avg(IMDB_Rating),2) AS avg_rating
 FROM imdb;
 
#Total Gross Revenue
SELECT sum(gross) AS total_gross_revenue
FROM IMDB;

#Total Number of Votes
SELECT COUNT(No_of_Votes) AS number_of_votes
FROM IMDB;

#Average Runtime (in hours)
SELECT sec_to_time(ROUND(AVG(time_to_sec(runtime))))AS avg_runtime
 FROM imdb;
 
 
 #Number of Movies by Genre
 SELECT COUNT(Series_Title) AS number_of_movies
FROM IMDB;

#Movies Released by Year
SELECT Released_Year, Series_Title
FROM imdb ;

#Top 5 Movies by Gross Revenue
SELECT  Series_Title
FROM imdb 
ORDER BY gross DESC
LIMIT 10;

#Average Meta Score
SELECT ROUND(avg(Meta_score))  AS avg_meta_score
 FROM imdb;
 
#Count of Movies by Certification
SELECT Certificate, COUNT(Series_Title) AS number_of_films
FROM IMDB 
GROUP BY Certificate;

#Movies with High Ratings and High Gross Revenue
SELECT  Series_Title AS top_series
FROM imdb 
ORDER BY gross , IMDB_Rating DESC;

#Average Runtime per Genre
SELECT genre,
sec_to_time(ROUND(AVG(time_to_sec(runtime))))AS avg_runtime 
 FROM imdb
 GROUP BY genre ;