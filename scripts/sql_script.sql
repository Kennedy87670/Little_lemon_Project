-- GetMaxQuantity(): This procedure retrieves the maximum quantity.
CREATE PROCEDURE GetMaxQuantity()

SELECT MAX(orders.Quantity)
FROM orders;

PREPARE GetOrderDetail from 'SELECT OrderID, Quantity, TotalCost from Orders where OrderID=?'
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

PREPARE GetOrderDetail FROM order


2. ManageBooking(): This procedure handles the management of bookings.
-- AddBooking(): This procedure allows adding new bookings.
CREATE PROCEDURE AddBooking (IN BookingID INT, IN CustomerID INT, IN TableNumber INT, IN BookingDate DATE)
BEGIN
INSERT INTO booking (bookingid, customerid, tablenumber, date) VALUES (BookingID, CustomerID, TableNumber, BookingDate); 
end

-- checkbooking
CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNumber INT)
SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = BookingDate and TableNumber = TableNumber)
	
-- addvalidbooking
CREATE PROCEDURE AddValidBooking (IN BookingDate DATE, IN TableNumber INT)


-- UpdateBooking(): This procedure is responsible for updating bookings.

CREATE PROCEDURE UpdateBooking (IN BookingID INT, IN BookingDate DATE)
BEGIN
UPDATE booking SET date = BookingDate WHERE booking_id = BookingID; 
END



-- CancelBooking(): This procedure facilitates the cancellation of bookings.
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN BookingID INT)
BEGIN
DELETE FROM booking WHERE booking_id = BookingID;
end

-- cancelorder 
CREATE PROCEDURE CancelOrder(in OrderID INT)
DELETE FROM orders;


-- view  to see orders greater than 150
CREATE VIEW OrdersView2 AS
SELECT customer.CustomerID, customer.FullName, orders.OrderID, orders.TotalCost
FROM customer INNER JOIN orders
WHERE orders.TotalCost > 150
ORDER BY orders.TotalCost DESC;

-- menu names 
SELECT Name from menu where MenuID=any (select MenuID from orders where Quantity>2) 

-- view to see quanityt > 2
CREATE VIEW OrdersView AS
SELECT orders.OrderID, orders.Quantity, orders.TotalCost
FROM orders
WHERE orders.Quantity > 2

-- transcations
START TRANSACTION;

SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = BookingDate and TableNumber = TableNumber)

	INSERT INTO booking (date, table_number)
	VALUES (BookingDate, TableNumber);
    
	COMMIT;
    



    


INSERT INTO booking(BookingID, BookingDate, TableNumber)
VALUES 
(1, '2022-10-10', 5),
(2, '2022-11-12', 3),
(3, '2022-10-11', 2),
(4, '2022-10-13', 2);


