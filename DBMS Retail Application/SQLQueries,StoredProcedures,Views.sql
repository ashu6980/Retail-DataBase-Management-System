--QUERIES
____________________________________________________________________________________________________________________________________________________________________
--Query1
--Find how many customers are there group by category

SELECT Customer_Type, count(Customer_Type) as Total
FROM anra.customer
GROUP BY Customer_Type;

--Query2
--Find 2 appartments whose name is emerald or their id is 11003
SELECT Address_ID, Appartment_Name, Zipcode_ID
  FROM   anra.address
  WHERE (Appartment_Name= 'Emerald' OR Zipcode_ID = '11003')
  ORDER BY Zipcode_ID DESC
  Limit 2;

--Query3
--Find the supplied product count and their group for each product 

select anra.supplier.Supplier_ID,anra.supplier.Supplier_Name, Count(anra.product.Group_ID) AS `Product Count`, anra.`product group`.Group_Name
from
    anra.supplier
        inner join 
    anra.product
        on  anra.supplier.Supplier_ID=anra.product.Supplier_ID 
        inner join 
    anra.`product group`
        on anra.product.Group_ID=anra.`product group`.Group_ID
        
Group by Supplier_ID Asc

--Query4
--Total number of orders to be shipped immediate and is partially Shipped

  SELECT Order_ID, Order_Date,`Status`,count(Order_ID) as Total
  FROM   anra.orders
  WHERE (Shippent_Duration= 'Immediate' and`Status`='Partially Shipped')
  ORDER BY Order_ID DESC;

--Query5
--List of products by department which has high defect%

SELECT anra.reviews.Product_ID,anra.product.Product_Name,
MAX(anra.reviews.`Defect%`) As `Defect%`, anra.`product group`.Group_Name
from
    anra.reviews
        inner join 
    anra.product
        on  anra.reviews.Product_ID=anra.product.Product_ID
        inner join 
    anra.`product group`
        on anra.product.Group_ID=anra.`product group`.Group_ID
 Group by `product group`.Group_ID
 
 --Query6
 --Total amount of revenue earned with respect to their purchasing modes
 
Select  count(Payment_Mode) As Total_Cutomers, anra.payment.Payment_Mode,Sum(anra.bill.Amount_Paid) 
As Total_Amount
from anra.payment 
inner join
anra.bill
on anra.payment.Payment_ID=anra.bill.Payment_ID
group by Payment_Mode



 --Query7
 --Find The quantity of products available whose status is in progress and shipment duration is immediate
 
 
 SELECT anra.product.Product_Name,anra.product.Available_Number,`order product`.Quantity,orders.Order_Date, orders.`Status`,orders.Shippent_Duration
from
    anra.orders
        inner join 
    anra.`order product`
        on  anra.orders.Order_ID=anra.`order product`.Order_ID
        inner join
       anra.product
       on  anra.`order product`.Product_ID=anra.product.Product_ID
   where 
   orders.`Status`='In Progress' and orders.Shippent_Duration='Immediate';

--Query8
--Find the names and defect% order by defect% 
SELECT Product_Name,`Defect%`
FROM anra.product
INNER JOIN anra.reviews
ON anra.reviews.Product_ID=anra.product.Product_ID
ORDER BY `Defect%` Desc;

--Query9
--Find Customers payment ID,mode, vocher applied and their visist number
SELECT anra.bill.Voucher_id, anra.payment.Payment_ID, anra.payment.Payment_Mode, anra.payment.Visit_Number 
FROM   anra.bill,anra.payment
WHERE anra.payment.Payment_ID=anra.bill.Payment_ID 
AND anra.bill.Amount_Paid> 1000;

--Query10
--Find product and their respective colour
SELECT Product_Name, Colour
FROM anra.`product details`
INNER JOIN anra.product
ON anra.`product details`.Product_ID=anra.product.Product_ID order by colour

--Query11
--Find the product Names their respective groups
SELECT
Group_Name, Product_Name
FROM anra.`product group`
INNER JOIN anra.product
ON anra.`product group`.Group_ID=anra.product.Group_ID Order by Group_Name




