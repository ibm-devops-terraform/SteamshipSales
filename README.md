# SteamshipSales
Technical objects required for steamship sales group by staff and their managers


Sql DB Tables (Diagram attached)

1) Sales - This table stores the sales by respective employee
2) Employee - Holds the employee and their managers(Self join)
3) Company - Master table for holding company

Stored Procedure

1) Get Staff Sales - SP which is called from .net core web api 


.net core solutionn
1) First Project  is web api which calls the sp and returns the json format.
2) Second Project is react UI calling above API.
