select *
from [dbo].[911]

--What are the top 5 zip codes for 911 calls?

select top 5 zip, count(zip) [total]
from [dbo].[911]
group by zip
order by count(zip) desc;

--Take a look at the title column, how many unique titles codes are there? 

select count(distinct title) [UniqueTitles]
from [dbo].[911];

--What is the most reason for a 911 call based on the the column (eg.EMS)

select Substring(title, 0, Charindex(':', title)) [Reason], count(Substring(title, 0, Charindex(':', title))) [Total]
from [dbo].[911]
group by Substring(title, 0, Charindex(':', title));

--count of day of the week 
select Substring(title, 0, Charindex(':', title)) [Reason], datename(dw, timeStamp) [Day], count(datename(dw, timeStamp)) [Total]
from [dbo].[911]
group by datename(dw, timeStamp), Substring(title, 0, Charindex(':', title))
order by Substring(title, 0, Charindex(':', title));

--count of month
select Substring(title, 0, Charindex(':', title)) [Reason], datename(month, timeStamp) [Day], count(datename(month, timeStamp)) [Total]
from [dbo].[911]
group by datename(month, timeStamp), Substring(title, 0, Charindex(':', title))
order by Substring(title, 0, Charindex(':', title));

----number of calls
select CONVERT(varchar(8), [timeStamp], 3) [Date], Count(*) [total]
from [dbo].[911]
group by CONVERT(varchar(8), [timeStamp], 3)
order by count(*) asc;

--the town that had most calls
select twp, count(*) [total]
from [dbo].[911]
group by twp
order by count(*) desc;

select  Substring(title, Charindex(':', title), Len(title) + 1) [ActualReason], count(*) [total]
from [dbo].[911]
group by Substring(title, Charindex(':', title), Len(title) + 1)
order by count(*) desc;