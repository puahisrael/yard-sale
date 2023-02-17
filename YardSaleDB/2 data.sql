use YardSaleDB
go 
delete Item
go

insert Item(ItemName, [Description], Category, Donor, DateReceived, DateSold, Price)
select 'Tricycle', 'Red and blue; heavily used but still functional', 'Recreation', 'Tom Smith', '11/27/2022', null, 15
union select 'Scarf', 'Women''s; hardly worn', 'Clothing', 'Jane Jones', '05/22/2022', '06/14/2022', 5
union select 'Dresser', '5-drawer; slightly shaky but very good condition', 'Home', 'Jane Jones', '01/04/2023', null, 35
union select 'Guitar', 'missing string; small', 'Recreation', 'Sam Williams', '07/18/2022', '07/25/2022', 0
union select 'Lawn-mower', 'very old model but works', 'Equipment', 'Ted Richardson', '08/01/2022', null, 20
union select 'Wallet', 'Men''s; fake leather', 'Misc', 'Bob Mill', '06/09/2022', '08/15/2022', 3
union select 'Lamp', 'pretty new-looking', 'Home', 'Jane Jones', '01/16/2023', null, 15
union select 'Children''s book', 'classic', 'Recreation', 'Tom Smith', '10/15/2022', '10/29/2022', 2

