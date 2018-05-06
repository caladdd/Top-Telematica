movie = LOAD '/user/jcaladh/datasets/peliculas.csv' using PigStorage(',') AS (user_id:int, movie_id:int, genero:chararray, rating:float, date:chararray);
g_movie = GROUP movie by user_id;
movieV =  foreach g_movie generate group, (COUNT(movie.movie_id));
DUMP movieV;