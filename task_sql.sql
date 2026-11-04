USE world;
Select * from Country;
Select Name, Continent From Country;
Select Name from country Where Continent="Asia";

Select Name,code,Continent from Country 
where Continent="europe";

Select Name from Country
where population>50000000;

Select Name from Country
where Continent="Asia" & Continent="Europe";

select Name Continent, GNP from Country
where Continent ="North America" and GNP>200000;

select Name, Population from Country
where Population between 20000000 and 100000000;

select Name, Continent from country
where Continent IN('North America','Europe','Asia');

Select Name, Continent from Country
where Continent NOT IN('North America','Europe','Asia');

-- string or text match we use like operator--
Select Name from Country
where Name Like "A%";
Select Name from Country
where Name Like "%A";

Select * from Country
limit 20;
Select * from Country
Order by Population DESC;

Select Name, Population 
 from Country
 Order by Population DESC
 Limit 5;
 
 -- for the middle range offset we use and offset use for skip the perticular range--
 -- Display records 11-20 from the country table--
 Select * from Country
 Limit 10
 offset 10;
 -- write a maximum population and As keyword for alice(NAme change) --
 Select MAX(Population) AS MAX_Population
 From Country;
 select MIN(Population) As MIN_Population
 from Country;
 Select count(Population) As COUNT_Population
 from Country;
 Select Sum(Population) AS Sum_Population
 from Country;
 Select Avg(Population) As average_Population
 from Country;
 
 Select Count(GNP) AS count_GNP
 from Country;
 Select Avg(GNP) AS Average_GNP
 from Country;
 Select Sum(GNP) AS sum_GNP
 from Country;
 Select Max(GNP) AS max_GNp
 from Country;
 Select Min(GNP) AS min_GNP
 from Country;
 
 -- for filter records or rows we use where--
 Select Name, IndepYear from Country
 where IndepYear IS NULL;
 Select Name,IndepYear from Country
 where IndepYear IS NOT NULL;
 
 Select  UPPER(Continent) AS Up_Continent from Country;
 -- UNIque Continent we use distinct--
 Select distinct UPPER(Continent) from Country;
 
 Select * from Country;
 Select distinct (Region) from Country;
  Select distinct (GovernmentForm) from Country;
 
 Select lower(Continent) from Country;
 
 -- write a query display all country ends with n and should be in lower case
 Select Lower(Name) AS Lower_name from Country
where Name like "%n";

-- display the length of all unique continent
Select distinct length(Continent)as L_Continent, Continent  from Country;
 Select Distinct length(Region) as L_region,Region from Country;
 
 -- Country name  and continent
 Select concat(Name," ",Continent) as Name_concate from Country;
 -- substring--
 Select Substring(Name,3,5) as Sub_Name from Country;
 Select substring(Region,2,5) as Sub_Region from Country;
 Select replace(Name,"A","B") as Replace_Char from Country;
 
 -- trim is use for remove extra spaces--
 
 -- Write a query to classify to country base on population if population>100m you have to give output highly poplualtef, when is >20m moderative ,else low population
 Select Name,Population, Case when Population>1000000000 then "Highly Populated"
 when Population>20000000 then "Moderative"
 else "low population"
 END AS Population_Category from Country;
 
 -- write a query to classify the country LifeExpentecy >75 the excellent, lifexpentency>65, good,else need improvement
 Select name,LifeExpentency,
 Case when LifeExpentency>75 then "Excellent"
 when LifeExpentency>65 then "Good"
 else "Need improvement"
 END as Lifeexpentency_Result  from Country;
 
 
 -- write a query to display if Continent is asia then print asia otherwise else Continent is not asia
 
 select Name,Continent,
 Case when Continent="Asia" then "Asian Country"
else "Non Asian"
END as Region_Type from Country;
 
 -- Write a query to display data is not available where ever indepyear is null otherwise print Indepyear
 
 Select Name,IndepYear,
 Case when IndepYear is null then "Data Not Available"
 else "IndepYear"
 END as Year from Country;
 
 
 -- Group By mostly used for aggrigate function--
 -- write a query to display count country in each continent--
 Select Continent,count(Name) as Total_Count from Country
 group by Continent;
 
 Select Region,Count(Name) as Total_Region from Country
 group by Region;
 
 -- write a query to display total capital in each continent--
 Select Continent,Sum(Capital) as Total_Capital from Country
 group by Continent;
 
 -- write a query to display a maximum population of each continent--
 Select Continent,Max(Population) as Max_Population from Country
 group by Continent;
 
 -- write a query to display count of countries and average population for each GovernmentForm--
 Select GovernmentForm,Count(Name) as Total_count, Avg(Population) as Total_avg from Country
 group by GovernmentForm;
 
 Select GovernmentForm,Count(Name) as Total_Country,Sum(Population) as Total_Population  from Country
 group by GovernmentForm;
 
 -- waq to display top 3 based on total population,Total countries and avg of Lifeexpectancy for each region--
 Select Region, Count(Name) as Total_Count,Sum(Population) as Total_Population,Avg(LifeExpectancy) as total_avg from Country
  group  by Region
  Order by Total_Population DESC
 Limit 3;
 
 -- waq to display only the continents those have more than 40 countries
 Select Continent,Count(Name)as Total_of_Country from Country
 group by Continent
  having  Total_of_country>40;
  
  -- waq to display continents having population>500000000
  Select Continent,sum(Population) as Total_Population from Country
  group by Continent
  having Total_Population>500000000;
  
  -- waq to display to retrive only asian and europian country ,count the country and display only those continent having more than 40 country--
  Select Continent,Count(Name) as Count_Country from Country
  group by Continent
  having  Continent="Asia" or Continent="Europe" and Count_Country>40;
  
  Select Continent,Count(name) as Count_Country from Country
 where Continent In("Asia","Europe")
 group by Continent;
 
 -- join syntax= select Column_name
 -- from table1_name
 -- join table2 name
--  on table1.col_name=table2.col-name;

-- waq to display all cities name and country 
select *from Country;
select *from city;
select city.name, Country.name from city
 Inner join Country
on city.CountryCode = Country.Code;

-- waq to display country name and there official language

select Country.name, CountryLanguage.Language from Country
Inner Join CountryLanguage
on Country.Code = CountryLanguage.CountryCode;

-- waq to display country name,city name and city population--
select Country.name as Country_Name, City.name as City_name,City.population 
from Country
Inner join City
On Country.Code=City.Countrycode;

-- waq to display all the countries along with there language
select Country.name,CountryLanguage.language
from Country
LEFT JOIN CountryLanguage
ON Country.Code=CountryLanguage.CountryCode;

-- waq to display to display all the cities with there region but keep all the region
select Country.region as City_region,City.name as City_name
from city
RIGHT JOIN Country
ON Country.Code=City.CountryCode;

-- waq to display all the countries having population more than average population--
select name,Population
from Country
where Population>(select avg(Population) from Country);

-- waq to display countries  whose GNP is higher than avg gnp
select name,GNP
from Country
where GNP>(select avg(GNP) from country);

-- waq to display countries where english is spoken--
Select name
from Country
where code IN (
select CountryCode
 from CountryLanguage
 where Language="English");
 



  
 
 
 
 
 
 
 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 

























