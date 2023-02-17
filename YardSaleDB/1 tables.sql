use YardSaleDB
go
drop table if exists Item
go 

create table dbo.Item(
    ItemId int not null identity primary key,
    ItemName varchar(100) not null constraint ck_Item_ItemName_cannot_be_blank check(ItemName <> ''),
    Description varchar(500) not null constraint ck_Item_Description_cannot_be_blank check(Description <> ''),
    Category varchar(10) not null constraint ck_Item_Category_must_be_either_home_recreation_equipment_clothing_or_misc check(Category in('home', 'recreation', 'equipment', 'clothing', 'misc')),
    DateReceived date not null constraint ck_Items_DateReceived_must_be_before_the_current_date check(DateReceived <= getdate()),
    DateSold date null,
    Price decimal(6,2) not null constraint ck_Item_Price_cannot_be_negative_number check(Price >= 0),
    EmployeeSalary as Price * .20,
    Profit as Price * .80,
--AS Let me know if it is important for your business to have the donor's first and last names separated into 2 separate columns.
    Donor varchar(30) not null constraint ck_Item_Donor_cannot_be_blank check(Donor <> ''),
    constraint ck_DateSold_must_be_after_DateReceived_and_before_the_current_date check(DateSold between DateReceived and getdate())
)
go