Select Saless.item,Saless.week,Saless.Finalsales,Inventories.inventory
from
(SELECT sales.item, sales.week,sum(totalSales) Finalsales
from
(SELECT item,datepart(week,Date) as week,sum(sales) as  totalSales
from Product$
group by item,Date
order by item,Date
offset 0 rows
) Sales
group by sales.item,sales.week
order by sales.item,sales.week
offset 0 rows)Saless
join 
(Select item,DATEPART(week,date) week,sum(inventory) inventory
from Product$
where date in
(select max(date)as max_date
from Product$
group by DATEPART(week,date)
order by DATEPART(week,date)
offset 0 rows)
group by item,date
order by item,date
offset 0 rows)Inventories
on Saless.week=Inventories.week and Saless.item=Inventories.item
order by Saless.item,Saless.week


