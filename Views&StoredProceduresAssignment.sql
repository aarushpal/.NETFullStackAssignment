--1.a.

ALTER VIEW productsLessThanAveragePrice AS
     select * from products where unitPrice < (select avg(unitPrice) as avg_price from products)

--1.b
select * from productsLessThanAveragePrice

--1.c
EXEC sp_rename 'productsLessThanAveragePrice', 'lowCostProducts';

--1.d
drop view lowCostProducts


--Implement the following requirement using Stored Procedures and cursors 
	
	--Hint :  Products table from pubs database
	
	--a.   Read required data from the Products table
	--b.   Find the total amount of each product :  Consider UnitsOnOrder, UnitPrice
	--c.    You need to display product name and total amount in the output	  
	--d.   Also display grand total at the end. 
	--e.    Display the total amounts with only two decimal points:
		--	Eg:   128.50,  582.00, etc....

--2.a
create procedure productsProcedure
as
begin
select * from products
end

exec productsProcedure

--2.b 
create procedure totalAmountEachProductProcedure
as 
begin
declare totalAmountCursor cursor
for select productName, unitsInStock, UnitPrice from products;
declare @productName nvarchar(40), @unitsInStock smallint, @UnitPrice money, @grandTotal decimal;
set @grandTotal = 0
open totalAmountCursor;
fetch next from totalAmountCursor into @productName , @unitsInStock, @UnitPrice
while @@FETCH_STATUS = 0
	begin
	print @productName + ' - ' +  cast((@unitsInStock * @UnitPrice) as varchar);
	set @grandTotal += @unitsInStock * @UnitPrice
	fetch next from totalAmountCursor into @productName ,@unitsInStock, @UnitPrice
	end;
	print 'Grand Total - ' + cast(round(@grandTotal,2) as varchar);
close totalAmountCursor;
deallocate totalAmountCursor;
end

drop procedure totalAmountEachProductProcedure

exec totalAmountEachProductProcedure

select * from products