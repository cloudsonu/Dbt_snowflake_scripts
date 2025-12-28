With Customers as
(
    select 
    Customer_ID,
    Customer_Name,
    Email as Customer_Email
     from AIRBNB.Analytics.Customers

)Select * from Customers