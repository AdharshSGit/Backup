Select Weeks,week_Grouping,item,sum(Totalsales) as Weeksales
from sales
group by week_Grouping,item,weeks
order by weeks,item