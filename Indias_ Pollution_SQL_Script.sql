create database Indias_Polution;
Use Indias_Polution;

Select* from Polution_data;

# top 5 Most polluted state 
Select state,station,pollutant_id,pollutant_avg from Polution_data limit 5;

# Delhi Pollution 
Select country,state,city,station,pollutant_id,pollutant_min,pollutant_max,pollutant_avg from Polution_data
where state in ("delhi");

#Average Delhi's Pollution 

Select  avg(pollutant_avg) as Averge_delhi_pollution 
from polution_data
where state = "delhi";

#maximum delhi's pollution 
Select station, max(pollutant_avg) as Maximum_delhi_pollution 
from polution_data
where state = "delhi"
GROUP BY station
Limit 1;

#Which state has the highest average pollution levels?
Select * from Polution_data;

select state,station,pollutant_avg from polution_data
order by pollutant_avg desc
Limit 1 ;

#Which cities are included in the dataset?
select distinct state from polution_data;
select  distinct city,state,station from polution_data;

#What is the average PM2.5 level across all stations in Delhi?
Select avg(pollutant_avg) as Avg_pollution_in_delhi from Polution_data
where pollutant_id ="PM2.5" and state = "Delhi";

#How many monitoring stations are there in each state?
Select  state, Count(distinct station) as  num_of_Counting_station from Polution_data 
Group by State;

#Which are the Top 5 most polluted stations for PM2.5?
select state,city,station, pollutant_avg from Polution_data
where pollutant_id ="PM2.5"
Order by pollutant_avg desc limit 5;

#Which station has the highest "Volatility" (difference between Min and Max)?
Select station, pollutant_max-pollutant_min as Gap from polution_data
order by gap;


#What is the average of each pollutant type for each city?
Select city,pollutant_id from Polution_data
group by City, pollutant_id;

#Which stations haven't updated their data recently?
Select station,state,city,last_update from polution_data order by (last_update) asc;

#Identify "Hazardous" stations:
Select state,station,city,pollutant_avg,
case 
When pollutant_avg > 300 then " Highly hazardous"
When pollutant_avg between 250 and 300 then " hazardous"
When pollutant_avg between 200 and 250 then " Risky "
When pollutant_avg Between 100 and 200 then " Safe"
When pollutant_avg < 100 then " Very safe"
end  as Pollutation_indication
from polution_data;
