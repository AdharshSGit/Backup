SELECT item,Date,sum(sales) as  totalSales,DATEADD(dd, 7-(DATEPART(dw, Date)),Date) [WeekEnd],

case when Date=DATEADD(dd, 7-(DATEPART(dw, Date)),Date) then sum(Inventory) 
  else 
  case
         when date=DATEADD(dd, 6-(DATEPART(dw, Date)),Date) then sum(Inventory)
	 else 
	  case
		 when date=DATEADD(dd, 5-(DATEPART(dw, Date)),Date) then sum(Inventory)
		 else 
		 case
		 when date=DATEADD(dd, 4-(DATEPART(dw, Date)),Date) then sum(Inventory)
	 else case
		 when date=DATEADD(dd, 3-(DATEPART(dw, Date)),Date) then sum(Inventory)
	 else case
		 when date=DATEADD(dd, 2-(DATEPART(dw, Date)),Date) then sum(Inventory)
	 else case
		 when date=DATEADD(dd, 1-(DATEPART(dw, Date)),Date) then sum(Inventory)
		 End 
		 end
		 end
		 end
		 end
		 end
			end as Inventories
FROM Product$
group by year(Date),datepart(week,Date),item,DATEADD(dd, 7-(DATEPART(dw, Date)),Date),Date,Inventory
order by item,WeekEnd