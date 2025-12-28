With  Orders as
(
    Select 
    Order_ID,
    Customer_ID,
    Order_Date,
    Order_Amount,
    Status 
     from AIRBNB.Analytics.Orders
) Select * from Orders