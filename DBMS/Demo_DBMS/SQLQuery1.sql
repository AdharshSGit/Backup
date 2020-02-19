create view  SalesTable1 As
Select Item,
Case
	When Date Between '2019-11-01' AND '2019-11-07' Then sum(sales)
		Else 0
End as Week1,
Case
	When Date Between '2019-11-08' AND '2019-11-14' Then sum(sales)
		Else 0
End as Week2,
Case
	When Date Between '2019-11-15' AND '2019-11-21' Then sum(sales)
		Else 0
End as Week3,
Case
	When Date Between '2019-11-22' AND '2019-11-28' Then sum(sales)
		Else 0
End as Week4

From Product$
Group by Date,Item,sales
Order by item asc
offset 0 rows 