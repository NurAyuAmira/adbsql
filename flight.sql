-- DDL 
CREATE TABLE Customer (
    Customer_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Customer_Name VARCHAR(30),
    Customer_Email VARCHAR(255),
    Customer_PhoneNum VARCHAR(15),
    Customer_DateOfBirth DATE
);

CREATE TABLE PaymentMethod (
    PaymentMethod_ID VARCHAR (10) NOT NULL PRIMARY KEY,
    PaymentMethod VARCHAR(100)
);

CREATE TABLE Airport (
    Airport_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Airport_Name VARCHAR(255),
    Airport_Country VARCHAR(30),
    Airport_State VARCHAR(30),
    Airport_City VARCHAR(30)
);

CREATE TABLE Airline (
    Airline_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Airline_Name VARCHAR(255)
);

CREATE TABLE Time (
    Time_ID INT NOT NULL PRIMARY KEY,
    Time_ClockTime TIME,
    Time_Day INT,
    Time_Month INT,
    Time_Quarter INT,
    Time_Year INT
);
                                                                                                        
CREATE TABLE Flight (
    Flight_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Airport_ID VARCHAR(10),
    Airline_ID VARCHAR(10),
    Ticket_Per_Price DECIMAL(7,2),
    DestinationTo VARCHAR(100),
    DestinationFrom VARCHAR(100),
    FlightDate DATE,
    DepartureTime TIME,
    ArrivalTime TIME,
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID),
    FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID)
);



CREATE TABLE Sales (
    Sales_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Time_ID INT,
    Flight_ID VARCHAR(10),
    Airport_ID VARCHAR(10),
    Airline_ID VARCHAR(10),
    PaymentMethod_ID VARCHAR(10),
    SalesTicket_Quantity INT,
    Booking_Date DATE,
    SalesTicket_TotalPrice DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Time_ID) REFERENCES Time(Time_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID),
    FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID),
    FOREIGN KEY (PaymentMethod_ID) REFERENCES PaymentMethod(PaymentMethod_ID)
);


-- DML
INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Email, Customer_PhoneNum, Customer_DateOfBirth) VALUES
('C001', 'Dhiyaul Naufal', 'dnaufal@gmail.com', '1234567890', '1985-05-15'),
('C002', 'Hakim Zahir', 'hzahir@yahoo.com', '2345678901', '1990-07-20'),
('C003', 'Chua Yong', 'cyong@office.com', '3456789012', '1992-03-12'),
('C004', 'Siti Haliza', 'sitihaliza@yahoo.com', '4567890123', '1980-12-25'),
('C005', 'Adam Ghazi', 'adamghaz@gmail.com', '5678901234', '1975-01-30'),
('C006', 'Daiyan Trisha', 'dtrisha@outlook.com', '6789012345', '1995-08-19'),
('C007', 'Thanusha Arumugam', 'thanuar@yahoo.com', '7890123456', '1988-06-04'),
('C008', 'Mannoj Sakthivel', 'noshua@gmail.com', '8901234567', '1970-11-14'),
('C009', 'Karim Salah', 'ksalah@example.com', '9012345678', '1983-09-10'),
('C010', 'William James', 'wiljames@example.com', '0123456789', '1996-04-05');

INSERT INTO PaymentMethod (PaymentMethod_ID, PaymentMethod) VALUES
('P001', 'Visa'),
('P002', 'MasterCard'),
('P003', 'PayPal'),
('P004', 'Apple Pay'),
('P005', 'Google Wallet'),
('P006', 'Cash'),
('P007', 'Visa'),
('P008', 'JomPay'),
('P009', 'Visa'),
('P010', 'American Express');

INSERT INTO Airport (Airport_ID, Airport_Name, Airport_Country, Airport_State, Airport_City) VALUES
('A001', 'Kuala Lumpur International Airport', 'MY', 'Selangor', 'Sepang'),
('A002', 'Los Angeles International Airport', 'USA', 'California', 'Los Angeles'),
('A003', 'Changi Airport', 'Singapore', 'East Region', 'Changi'),
('A004', 'Kuala Lumpur International Airport', 'MY', 'Selangor', 'Sepang'),
('A005', 'Haneda Airport', 'Japan', 'Tokyo', 'Tokyo'),
('A006', 'Shanghai Pudong International Airport', 'China', 'Shanghai', 'Shanghai'),
('A007', 'Sydney Kingsford Smith Airport', 'Australia', 'NSW', 'Sydney'),
('A008', 'Toronto Pearson International Airport', 'Canada', 'Ontario', 'Toronto'),
('A009', 'Frankfurt Airport', 'Germany', 'Dubai', 'Frankfurt'),
('A010', 'Dubai International Airport', 'UAE', 'Dubai', 'Dubai');

INSERT INTO Airline (Airline_ID, Airline_Name) VALUES
('L001', 'Delta Airlines'),
('L002', 'United Airlines'),
('L003', 'American Airlines'),
('L004', 'Southwest Airlines'),
('L005', 'Qatar Airways'),
('L006', 'Emirates'),
('L007', 'Singapore Airlines'),
('L008', 'Cathay Pacific'),
('L009', 'Malaysia Airlines'),
('L010', 'Etihad Airways');

INSERT INTO Time (Time_ID, Time_ClockTime, Time_Day, Time_Month, Time_Quarter, Time_Year) VALUES
(1, '12:00:00', 1, 1, 1, 2023),
(2, '13:00:00', 2, 1, 1, 2023),
(3, '14:00:00', 3, 1, 1, 2023),
(4, '15:00:00', 4, 1, 1, 2023),
(5, '16:00:00', 5, 1, 1, 2023),
(6, '17:00:00', 6, 1, 1, 2023),
(7, '18:00:00', 7, 1, 1, 2023),
(8, '19:00:00', 8, 1, 1, 2023),
(9, '20:00:00', 9, 1, 1, 2023),
(10, '21:00:00', 10, 1, 1, 2023);

INSERT INTO Flight (Flight_ID, Airport_ID, Airline_ID, Ticket_Per_Price, DestinationTo, DestinationFrom, FlightDate, DepartureTime, ArrivalTime) VALUES
('F001', 'A001', 'L001', 200.00, 'Los Angeles', 'Sepang', '2023-01-12', '08:00:00', '16:00:00'),
('F002', 'A002', 'L002', 300.00, 'Chicago', 'Los Angeles', '2023-01-15', '09:00:00', '11:30:00'),
('F003', 'A003', 'L003', 450.00, 'London', 'Changi', '2023-01-12', '10:00:00', '08:00:00'),
('F004', 'A004', 'L004', 650.00, 'Tokyo', 'Sepang', '2023-01-14', '11:00:00', '20:00:00'),
('F005', 'A005', 'L005', 550.00, 'Paris', 'Tokyo', '2023-01-15', '12:00:00', '06:00:00'),
('F006', 'A006', 'L006', 750.00, 'New York', 'Shanghai', '2023-01-16', '13:00:00', '12:00:00'),
('F007', 'A007', 'L007', 800.00, 'Shanghai', 'Sydney', '2023-01-17', '14:00:00', '22:00:00'),
('F008', 'A008', 'L008', 900.00, 'Sydney', 'Toronto', '2023-01-28', '15:00:00', '11:00:00'),
('F009', 'A009', 'L009', 1000.00, 'Dubai', 'Frankfurt', '2023-01-29', '16:00:00', '05:00:00'),
('F010', 'A010', 'L010', 1100.00, 'Milan', 'Dubai', '2023-01-30', '17:00:00', '23:00:00');

INSERT INTO Sales (Sales_ID, Customer_ID, Time_ID, Flight_ID, Airport_ID, Airline_ID, PaymentMethod_ID, SalesTicket_Quantity, Booking_Date, SalesTicket_TotalPrice) VALUES
('S001', 'C001', 1, 'F001', 'A001', 'L001', 'P001', 2, '2023-01-01', 400.00),
('S002', 'C002', 2, 'F002', 'A002', 'L002', 'P002', 1, '2023-01-02', 300.00),
('S003', 'C003', 3, 'F003', 'A003', 'L003', 'P003', 3, '2023-01-03', 1350.00),
('S004', 'C004', 4, 'F004', 'A004', 'L004', 'P004', 2, '2023-01-04', 1300.00),
('S005', 'C005', 5, 'F005', 'A005', 'L005', 'P005', 1, '2023-01-05', 550.00),
('S006', 'C006', 6, 'F006', 'A006', 'L006', 'P006', 2, '2023-01-06', 1500.00),
('S007', 'C007', 7, 'F007', 'A007', 'L007', 'P007', 1, '2023-01-07', 800.00),
('S008', 'C008', 8, 'F008', 'A008', 'L008', 'P008', 2, '2023-01-08', 1800.00),
('S009', 'C009', 9, 'F009', 'A009', 'L009', 'P009', 3, '2023-01-09', 3000.00),
('S010', 'C010', 10, 'F010', 'A010', 'L010', 'P010', 1, '2023-01-10', 1100.00);


-- Procedural SQL
-- Stored Procedure
SELECT Ticket_Per_Price FROM Flight WHERE Flight_ID = 'F001';

CREATE OR REPLACE PROCEDURE UpdateTicketPrice(
    IN in_flight_id VARCHAR(10),
    IN new_price DECIMAL(7,2)
)
LANGUAGE SQL
MODIFIES SQL DATA
BEGIN
    UPDATE Flight
    SET Ticket_Per_Price = new_price
    WHERE Flight_ID = in_flight_id;
END

CALL UpdateTicketPrice('F001', 450.00);

SELECT Ticket_Per_Price FROM Flight WHERE Flight_ID = 'F001';


-- Trigger
SELECT Flight_ID, Ticket_Per_Price FROM Flight WHERE Flight_ID = 'F001';
SELECT Sales_ID, SalesTicket_TotalPrice FROM Sales WHERE Flight_ID = 'F001';

CREATE TRIGGER UpdateSalesTotal
AFTER UPDATE OF Ticket_Per_Price ON Flight
REFERENCING NEW AS N
FOR EACH ROW
MODE DB2SQL
BEGIN ATOMIC
    UPDATE Sales
    SET SalesTicket_TotalPrice = N.Ticket_Per_Price * SalesTicket_Quantity
    WHERE Flight_ID = N.Flight_ID;
END

UPDATE Sales
SET SalesTicket_TotalPrice = (SELECT Ticket_Per_Price FROM Flight WHERE Flight_ID = 'F001') * SalesTicket_Quantity
WHERE Flight_ID = 'F001';

SELECT Flight_ID, Ticket_Per_Price FROM Flight WHERE Flight_ID = 'F001';
SELECT Sales_ID, SalesTicket_TotalPrice FROM Sales WHERE Flight_ID = 'F001';


-- UDF 

CREATE FUNCTION TotalSalesForFlight(flight_id VARCHAR(10))
RETURNS DECIMAL(10,2)
SPECIFIC TotalSalesForFlight
DETERMINISTIC
NO EXTERNAL ACTION
READS SQL DATA
BEGIN ATOMIC
    DECLARE total_sales DECIMAL(10,2) DEFAULT 0;
    SET total_sales = (SELECT COALESCE(SUM(SalesTicket_TotalPrice), 0)
                       FROM Sales
                       WHERE Flight_ID = flight_id);
    RETURN total_sales;
END;

SELECT TotalSalesForFlight('F001') AS Total_Revenue_Before
FROM sysibm.sysdummy1;

INSERT INTO Sales (Sales_ID, Customer_ID, Time_ID, Flight_ID, Airport_ID, Airline_ID, PaymentMethod_ID, SalesTicket_Quantity, Booking_Date, SalesTicket_TotalPrice)
VALUES ('S011', 'C001', 1, 'F001', 'A001', 'L001', 'P001', 2, '2023-05-05', 600);

SELECT TotalSalesForFlight('F001') AS Total_Revenue_After
FROM sysibm.sysdummy1;


-- CONSTRUCTION SQL 
-- COMPLEX QUERY WITH JOINS OF AT LEAST 3 TABLES
SELECT 
    f.Flight_ID, 
    f.DestinationTo, 
    f.DestinationFrom, 
    f.Ticket_Per_Price,
    c.Customer_Name, 
    s.SalesTicket_Quantity,
    s.SalesTicket_TotalPrice, 
    s.Booking_Date
FROM 
    Flight f
JOIN 
    Sales s ON f.Flight_ID = s.Flight_ID
JOIN 
    Customer c ON s.Customer_ID = c.Customer_ID
WHERE 
    f.DestinationTo = 'Tokyo'
ORDER BY 
    s.Booking_Date DESC;
   
-- GROUP BY ROLLUP 
SELECT 
    f.DestinationTo, 
    f.Airline_ID, 
    COUNT(*) AS NumberOfFlights, 
    SUM(s.SalesTicket_TotalPrice) AS TotalSales
FROM 
    Flight f
JOIN 
    Sales s ON f.Flight_ID = s.Flight_ID
GROUP BY ROLLUP (f.DestinationTo, f.Airline_ID)
HAVING f.Airline_ID IS NOT NULL OR (f.DestinationTo IS NULL AND f.Airline_ID IS NULL);

-- VIEW
CREATE VIEW FlightSalesDetails AS
SELECT
    f.Flight_ID,
    f.DestinationTo,
    f.DestinationFrom,
    f.FlightDate,
    COUNT(s.Sales_ID) AS TotalSalesTickets,  -- Counting the total tickets sold per flight
    SUM(s.SalesTicket_TotalPrice) AS Total_Revenue  -- Including both metrics for comprehensive analysis
FROM
    Flight f
JOIN
    Sales s ON f.Flight_ID = s.Flight_ID
GROUP BY
    f.Flight_ID, f.DestinationTo, f.DestinationFrom, f.FlightDate;
   
SELECT * FROM FlightSalesDetails WHERE DestinationTo = 'Tokyo';


