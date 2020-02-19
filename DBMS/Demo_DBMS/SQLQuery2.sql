CREATE VIEW sales as
SELECT date,DATEPART(wk, Date) as Weeks, (item), SUM(Sales)as totalsales,sum(Inventory) as TotalInventory,
case
	when DATEPART(wk, Date)=44 Then 'Nov-Week1'
	when DATEPART(wk, Date)=45 Then 'Nov-Week2'
	when DATEPART(wk, Date)=46 Then 'Nov-Week3'
	when DATEPART(wk, Date)=47 Then 'Nov-Week4'
	Else 'Nov-Week5'
End as Week_Grouping
FROM Product$
GROUP BY    date,DATEPART(wk, Date),item
order by weeks,item
offset 0 rows

SELECT DATEADD(day,
               -1 - (DATEPART(weekday, GETDATE()) + @@DATEFIRST - 2) % 7,]]]
               GETDATE()
              ) AS LastSunday

select DATEADD(dd, 6-(DATEPART(dw, Date)),Date)


		case when date=DATEADD(dd, 6-(DATEPART(dw, Date)),Date) then Sum(Inventory)
	Else 
		case when date=DATEADD(dd, 5-(DATEPART(dw, Date)),Date) then Sum(Inventory)
	Else 
		case when date=DATEADD(dd, 4-(DATEPART(dw, Date)),Date) then Sum(Inventory)
	Else 
		case when date=DATEADD(dd, 3-(DATEPART(dw, Date)),Date) then Sum(Inventory)
	Else 
		case when date=DATEADD(dd, 2-(DATEPART(dw, Date)),Date) then Sum(Inventory)
	Else 
		case when date=DATEADD(dd, 1-(DATEPART(dw, Date)),Date) then Sum(Inventory)
	END
	END
	END
	END
	END
	END
case
	when date=DATEADD(dd, 7-(DATEPART(dw, Date)),Date) then Sum(Inventory)
		Else 0
		End AS INVENTORY_LEVEL