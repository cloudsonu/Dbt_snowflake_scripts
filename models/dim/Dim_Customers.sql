{{ config(materialized='table') }}

With Customers as
(
   select * from {{ref('stg_customers')}}
),

 Orders as
(
   Select * from {{ref('Stage_orders')}}
),
Customers_Order as
(
    Select 
    Customer_ID,
    Min(Order_Date)As FIrst_Order_Date,
    Max(Order_Date)As Last_Order_Date,
    Count(Order_ID)As Total_Orders 
     from Orders
     Group By Customer_ID
),
Final as
(   Select
    C.Customer_Name,
    C.Customer_Email,
    Co.FIrst_Order_Date,
    Co.Last_Order_Date,
    Coalesce(Co.Total_Orders,0)As Tota_No_Of_Orders
    From Customers C
    Left Join Customers_Order CO ON C.Customer_ID=Co.Customer_ID-- Using(Customer_ID)
)
Select * from Final