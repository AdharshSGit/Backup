/****** Script for SelectTopNRows command from SSMS  ******/
Select sales1.item,sales1.week,sales1.FinalSales,inventory1.inventory
from sales1
join inventory1 on sales1.item=inventory1.item and sales1.week=inventory1.week
order by sales1.item,sales1.week