1. Write a query to display all the authors in the database.
Select * from Authors;

2. Retrieve the names and emails of all customers who joined after February 1, 2023.
Select name , email
from Customers 
where JoinDate > '2023-02-01';

3. Find all books in the 'Fantasy' genre.
Select * from Books
where genre = 'Fantasy';

4. Display the total number of books available in stock.
Select Sum(Stock) as total_books
From Books;

5. Show the total revenue generated from all orders.
Select Sum(TotalPrice) as total_price
from Orders;

6. List the details of orders placed by the customer named 'Alice Johnson.'
Select * from Orders
Join Customers on 
Orders.CustomerID = Customers.CustomerID
where Customers.Name = 'Alice Johnson';

7. Identify the book with the highest price.
Select Max(Price) From Books Limit 1;

8. Retrieve the details of books that have less than 50 units in stock.
Select * from Books Where Stock < 50;


9. Write a query to list all books along with their author's name.
SELECT Books.BookID, Books.Title, Books.Genre, Books.Price, Books.Stock, Authors.Name AS Author_name 
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;



10. Display all orders with the customer name and book title included.
SELECT Orders.OrderID, Orders.OrderDate, Orders.Quantity, Orders.TotalPrice, 
Customers.Name AS Customer_name, Books.Title AS book_title
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Books ON Orders.BookID = Books.BookID;


11. Calculate the total number of orders placed by each customer.
Select Customers.CustomerID, Customers.Name , Count(Orders.OrderID) as total_order_by_customers From  Customers Join Orders on  Customers.CustomerID = Orders.CustomerID
Group by Customers.CustomerID , Customers.Name;


12. Find the average price of books in the 'Fiction' genre.
SELECT AVG(Price) AS avg_price
FROM Books
WHERE Genre = 'Fiction';



13. Determine the author whose books have the highest combined stock.

Select Authors.AuthorID, Authors.Name , Sum(Stock) as total_stock
From Authors
Join Books On 
Authors.AuthorID = Books.AuthorID
Group by Authors.AuthorID, Authors.Name 
Order by Sum(Stock) DESC
Limit 1;


14. Retrieve the names of authors born before 1950.
Select Name From Authors
where BirthYear < 1950;


15. Find all customers from the 'United Kingdom.'
Select Name From Customers
Where Country = 'United Kingdom';

16. Write a query to list all books that have been ordered more than once.
Select Books.BookID, Books.Title, 
Count(Orders.OrderID) AS count_order
From Books
Join Orders
on Books.BookID = Orders.BookID
Group by Books.BookID, Books.Title
Having Count(Orders.OrderID) > 1;


17. Identify the top-selling book based on the quantity sold.
Select Books.BookID, Books.Title, Sum(Orders.Quantity) as total_quantity 
From Books 
Join Orders On Books.BookID = Orders.BookID 
Group by Books.BookID, Books.Title  
Order by total_quantity Desc 
Limit 1;


18. Calculate the total stock value for each book (price * stock).
Select BookID , Title, Genre, Price, Stock
,
(Price*Stock) 
From Books;


19. Write a query to find the name of the customer who placed the most expensive order.
Select Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.TotalPrice
From Orders
Join Customers on 
Orders.CustomerID = Customers.CustomerID
Order by Orders.TotalPrice DESC
Limit 1;


20. Retrieve all books that have not been ordered yet.
SELECT Books.BookID, Books.Title, Books.Genre, Books.Stock, Books.Price
FROM Books 
LEFT JOIN Orders ON Books.BookID = Orders.BookID
WHERE Orders.BookID IS NULL;
