SELECT TOP 10 *
FROM netflix_master_titles;

SELECT TOP 10 * FROM netflix_master_titles;
SELECT TOP 10 * FROM netflix_genre_titles;
SELECT TOP 10 * FROM netflix_sort_titles;

SELECT COUNT(*) AS Total_Rows FROM netflix_master_titles;
SELECT COUNT(*) AS Total_Rows FROM netflix_genre_titles;
SELECT COUNT(*) AS Total_Rows FROM netflix_sort_titles;

EXEC sp_help 'netflix_master_titles';
EXEC sp_help 'netflix_genre_titles';
EXEC sp_help 'netflix_sort_titles';

SELECT title, COUNT(*) AS Duplicate_Count
FROM netflix_master_titles
GROUP BY title
HAVING COUNT(*) > 1;

SELECT title, COUNT(*) AS Duplicate_Count
FROM netflix_genre_titles
GROUP BY title
HAVING COUNT(*) > 1;

SELECT title, COUNT(*) AS Duplicate_Count
FROM netflix_sort_titles
GROUP BY title
HAVING COUNT(*) > 1;

SELECT *
FROM netflix_master_titles
WHERE imdb_rating IS NULL
   OR tmdb_rating IS NULL;

   SELECT *
FROM netflix_genre_titles
WHERE imdb_rating IS NULL
   OR tmdb_rating IS NULL;

   SELECT *
FROM netflix_sort_titles
WHERE imdb_rating IS NULL
   OR tmdb_rating IS NULL;

   SELECT
AVG(imdb_rating) AS Avg_IMDB,
AVG(tmdb_rating) AS Avg_TMDB
FROM netflix_master_titles;

SELECT type,
COUNT(*) AS Total_Content
FROM netflix_master_titles
GROUP BY type
ORDER BY Total_Content DESC;

SELECT genre,
COUNT(*) AS Total_Content
FROM netflix_genre_titles
GROUP BY genre
ORDER BY Total_Content DESC;

SELECT release_year,
COUNT(*) AS Total_Content
FROM netflix_master_titles
GROUP BY release_year
ORDER BY release_year;

SELECT TOP 10
title,
imdb_rating,
tmdb_rating
FROM netflix_master_titles
ORDER BY imdb_rating DESC;

SELECT TOP 10
title,
tmdb_popularity
FROM netflix_master_titles
ORDER BY tmdb_popularity DESC;

DROP VIEW IF EXISTS vw_NetflixDashboard;
GO

CREATE VIEW vw_NetflixDashboard AS
SELECT
    title,
    type,
    release_year,
    runtime,
    imdb_rating,
    tmdb_rating,
    tmdb_popularity
FROM netflix_master_titles;
GO

SELECT TOP 10 *
FROM vw_NetflixDashboard;

go
CREATE VIEW vw_ReleaseTrend AS
SELECT
    release_year,
    COUNT(DISTINCT title) AS TotalTitles
FROM netflix_master_titles
GROUP BY release_year;
go

SELECT TOP 20
    release_year,
    title
FROM netflix_master_titles
ORDER BY release_year DESC;

SELECT
    release_year,
    COUNT(DISTINCT title) AS TotalTitles
FROM netflix_master_titles
GROUP BY release_year
ORDER BY release_year;

SELECT
    MIN(release_year) AS MinYear,
    MAX(release_year) AS MaxYear
FROM netflix_master_titles;

SELECT
    release_year,
    COUNT(DISTINCT title) AS TotalTitles
FROM netflix_master_titles
GROUP BY release_year
ORDER BY TotalTitles DESC;

SELECT * 
FROM vw_NetflixTrend
ORDER BY release_year;

DROP VIEW vw_NetflixTrend;
GO

CREATE VIEW vw_NetflixTrend AS
SELECT
    release_year,
    COUNT(DISTINCT title) AS TotalTitles
FROM netflix_master_titles
WHERE release_year BETWEEN 1940 AND 2025
GROUP BY release_year;
GO