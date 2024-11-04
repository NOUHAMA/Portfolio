#rename table :
RENAME TABLE imdb_top_1000 to imdb ; 

#formating tables 
#format released year :
#store the released_year as year in datatype instead of date
#The DATE type in MySQL expects the format YYYY-MM-DD. 

ALTER TABLE imdb 
MODIFY Released_Year YEAR;

#format runtime to time :
#1 remove the min part 

UPDATE imdb
SET Runtime = REPLACE(Runtime, ' min', '');

#2 convert minutes to seconds 

UPDATE imdb
SET Runtime = Runtime*60;

#3 convert sec to time 

SELECT series_title, SEC_TO_TIME(Runtime)
FROM imdb;

#4 modify the column 
UPDATE imdb
SET Runtime = SEC_TO_TIME(Runtime);

#5 format the column using TIME_FORMAT a time function
SELECT TIME_FORMAT(Runtime , "%H:%i:%s") 
FROM imdb ; 

UPDATE imdb
SET Runtime = TIME_FORMAT(Runtime , "%H:%i:%s") ;

#6 change data type 
 ALTER TABLE imdb 
 Modify runtime TIME ;
 
 
 #change data type for gross to int 
 #1 check for data that isn't INT using REGEX 
	#^ : begining of the string 
	#a number 
	#+ one or more 
	#$ end of a string 
 SELECT gross FROM imdb WHERE NOT gross REGEXP '^[0-9]+$';
#2 replace "," by none 
UPDATE imdb
SET gross = REPLACE(gross, ',', '');
#3 replcae empty values with 0 to allow SQL to convert data to int 
UPDATE imdb 
SET gross = '0' WHERE gross = '';


#4 change data type 
ALTER TABLE imdb 
MODIFY gross bigint;

#change data type for NO_of_votes , imdb rating , meta_score 
#NO_of_votes 
#replace empty values to 0 
UPDATE imdb 
SET No_of_Votes = '0' WHERE No_of_Votes = '';
#check for none int values 
SELECT No_of_Votes FROM imdb WHERE NOT No_of_Votes REGEXP '^[0-9]+$';
#put 0 in the none  int values 
UPDATE imdb 
SET No_of_Votes = '0' WHERE No_of_Votes  = 'Stephen Rea' OR No_of_Votes  = 'Denholm Elliott'
 ;
 #change data type 
ALTER TABLE imdb 
MODIFY No_of_Votes int;
#imdb rating 
ALTER TABLE imdb 
MODIFY IMDB_Rating DECIMAL(5, 2);
#meta_score 
UPDATE imdb 
SET Meta_score = '0' WHERE Meta_score = '';

SELECT Meta_score FROM imdb WHERE NOT Meta_score REGEXP '^[0-9]+$';
UPDATE imdb 
SET Meta_score  = 62
WHERE Meta_score   = ' plots to overthrow it with the help of a young woman.\"';

UPDATE imdb 
SET Meta_score  = 65
WHERE Meta_score   =  ' Jr. finds himself up against Adolf Hitler\'s Nazis again to stop them from obtaining its powers.\"'
;
ALTER TABLE imdb 
MODIFY Meta_score DECIMAL(5, 2);
