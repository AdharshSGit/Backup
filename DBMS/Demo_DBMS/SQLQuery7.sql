create view TotalSales as
select weeks,item,sum(totalsales) as weeksales
from sales
group by item,Weeks,week_grouping
order by item,weeks
offset 0 rows