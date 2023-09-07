select * from Unicorn_Companies
/*1. Sort contries based on the highest number of companies. Which country has the most number of companies?*/
select Country, count(distinct Company) as Total_companies from Unicorn_Companies
group by Country
order by Total_companies desc
/* ans. Unites States has the highest number of companies, followed by china and India.*/
/*2. which countries has more than 100 companies?*/
select Country,count(distinct Company) as Total_companies from Unicorn_Companies
group by Country
having count(distinct Company)>100
order by total_companies desc
/* Ans. United states and China have more than 100 companies.*/
/*3. Which industry is the largest among unicorn companies based on total number of companies? What is the average valuation?*/
select Industry, count(distinct Company) as No_of_companies, avg(Valuation_B) as Avg_Valuation from Unicorn_Companies
group by Industry
order by count(distinct Company) desc
/* Ans. Fintech is the largest among unicorn companies with average valuation of  3.8283B*/
/*4. Based on the solution of question 3, how many companies were founded each year in the 2016-2022 range?*/
select Founded_Year, count(distinct Company) as no_of_companies from Unicorn_Companies
group by Founded_Year
having Founded_Year between 2016 and 2022
/*5.Show detailed company data (company name, city of origin and country) along with its industry and valuation.
1. Which country does the company with the largest valuation come from and what is the industry?
2. How about Indonesia? What company has the biggest valuation in Indonesia?*/
select Company, City, Country, Industry, Valuation_B from Unicorn_Companies
order by Valuation_B desc
select Company, City, Country, Industry, Valuation_B from Unicorn_Companies
where Country='Indonesia'
order by Valuation_B desc
/*a. China has the company with the highest valuation and the industry is Artificial Intelligence
b. J&T Express has the biggest valuation*/
/*6.How old was the oldest company when it merged to become a unicorn company? Which country does the company come from?*/
select Company,Date_joined,Founded_Year, year(Date_joined)-Founded_Year as Total_Years, Industry from Unicorn_Companies
order by Total_years desc
/*Ans. Otto Bock Healthcare is the oldest company with 98 years of age and it comes from Health industry.*/
/*7. For companies founded between 1960 and 2000, how old was the oldest company when it merged to become a unicorn company? 
Which country does the company come from?*/
select Company,Country,Date_joined,Founded_Year, year(Date_joined)-Founded_Year as Total_Years, Industry from Unicorn_Companies
where Founded_Year between 1960 and 2000
order by Total_years desc
/*Ans. Avant is the oldest company founded in the given time period. The company is from United States.*/
/*8.a) How many companies are financed by at least one investor with the name ‘Venture’?
b) How many companies are financed by at least one investor with the name: ‘Venture’, ‘Capital’, ‘Partner’?*/
select count(distinct case when lower(Select_Inverstors) like '%venture%' then Company end)
from Unicorn_Companies
select count(distinct case when lower(Select_Inverstors) like '%venture%' then Company end) as Venture,
count(distinct case when lower(Select_Inverstors) like '%capital%' then Company end) as Capital,
count(distinct case when lower(Select_Inverstors) like '%partner%' then Company end) as Partner
from Unicorn_Companies
/*Ans.565 companies are financed by venture, 583 by Capitral and 376 by Partner.*/
/*9.How many logistics startups are unicorns in Indonesia?*/
select count(distinct Company) as total from Unicorn_Companies
where Industry='Supply chain, logistics, & delivery' and Country in
(select Country from Unicorn_Companies
where Country='Indonesia')
/*Ans. 1 startup is engaged in logistics services. */
/*10.Sort by industry and number of companies (decreasing).*/
select Industry, Count(distinct Company) as No_Of_Companies from Unicorn_Companies
group by Industry
order by No_of_Companies desc

/*11.The United States, China and India are the three countries with the most unicorns.
Is there an industry that doesn’t have unicorns originating in India? If so, what are the industries?*/
select distinct(Industry) from Unicorn_Companies
where Industry not in
(select distinct(Industry) from Unicorn_companies
where Country='India')
/*12.Find the three industries that had the most unicorns in 2019–2021.*/
select distinct(Industry),count(distinct Company) as no_of_unicorns from Unicorn_Companies
where year(Date_Joined) between 2019 and 2021
group by Industry
order by no_of_unicorns desc
/*Ans.Fintech,Internet software &services and E-commerce&dirct-to-consumer are the three industries with most number
of unicorns in 2019-2021*/