/*
Items
	ItemName varchar(100) not null not blank
	Description varchar(500)not null not blank
	Category varchar(10) not null must be home, recreation, equipment, clothing, misc
	DateReceived date not null must be before the current date
	DateSold null
	Price decimal(6,2) not null cannot be negetive number
	EmployeeSalary as 20% of price
	Profit as 80% of price
	Donor varchar(30) not null cannot be blank
	DateSold must be between DateReceived and current date
*/