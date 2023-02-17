--AS Items that were sold for $0 mark as free:
--AS you can't convert a string into an decimal so it can't be included in the actual data, but this is one way to do it.
select Price = case i.Price when 0 then 'free' else convert(varchar,i.Price) end
from Item i
--1) For advertising purposes, I need to know which items I should be aiming to receive. Therefore, show me a list of the categories ordered by popularity (most popular on the top).
select ItemsPerCategory = count(*), i.Category
from Item i 
group by i.Category
order by ItemsPerCategory desc
--2) I want to upgrade the price tags. Each category should have it's own color sticker (you can choose), and the text should be formatted as such: item name (category name): price, date put out
--   (I want the color and the text in separate columns. And just show me a list, please, as a preview of what they would look like.)
select Color = case i.category 
                when 'home' then 'blue' 
                when 'recreation' then 'purple' 
                when 'equipment' then 'yellow' 
                when 'clothing' then 'green' 
                when 'misc' then 'silver' 
              end,
      PriceTags = concat(i.ItemName, ' (', i.Category, '): $', i.Price, ', ', i.DateReceived)
from Item i
--3) I am considering reducing the price of all items that are still not sold after 3 months of sitting there. Show me a 50% reduction on all such items.
select i.ItemName, ReducedPrice = i.Price / 2
from Item i 
where datediff(month, i.DateReceived, getdate()) > 3 
and i.DateSold is null
--4) The "t-shirt" neighbor wants to customize the shirts! Show me a list of the "worthy" donors and their t-shirts, formatted as: "Not A Dump", Thanks to YOU, <donor name>!
select Tshirt = concat('"Not A Dump", Thanks to YOU, ', i.Donor), i.Donor, NumberOfDropOffs = count(distinct i.DateReceived)
from Item i 
group by i.Donor
having count(i.Donor) >= 3

