create database Library;
use Library;

-- 1. Branch table
CREATE TABLE Branch (
    Branch_No INT PRIMARY KEY,
    Manager_Id INT,
    Branch_Address VARCHAR(255),
    Contact_No VARCHAR(15)
);

-- 2. Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_No INT,
    FOREIGN KEY (Branch_No) REFERENCES Branch(Branch_No)
);

-- 3. Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_Title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(8, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- 4. Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Customer_Address VARCHAR(255),
    Reg_Date DATE
);

-- 5. IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_Cust INT,
    Issued_Book_Name VARCHAR(255),
    Issue_Date DATE,
    Isbn_Book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_Cust INT,
    Return_Book_Name VARCHAR(255),
    Return_Date DATE,
    Isbn_Book2 VARCHAR(20),
    FOREIGN KEY (Return_Cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch VALUES(1, 101,'Church Road','297562');
INSERT INTO Branch VALUES(2, 102,'Church Road','257562');
INSERT INTO Branch VALUES(3, 103,'Charless Street','237562');
INSERT INTO Branch VALUES(4, 104,'Library Road','797562');
INSERT INTO Branch VALUES(5, 105,'Library Road','697562');
INSERT INTO Branch VALUES(6, 106,'Park Avenue','397562');
INSERT INTO Branch VALUES(7, 107,'Church Road East','298562');
INSERT INTO Branch VALUES(8, 108,'Compact Town','233562');
INSERT INTO Branch VALUES(9, 109,'Main Street','292262');
INSERT INTO Branch VALUES(10, 110,'City Village','297562');
select * from Branch;

INSERT INTO Employee (Emp_Id, Emp_Name, Position, Salary, Branch_no) VALUES
(201, 'Alice Smith', 'Librarian', 75000.00, 1),
(202, 'Smith Johnson', 'Assistant Librarian', 35000.00, 1),
(203, 'Jitha P Nair', 'Clerk', 60000.00, 2),
(204, 'Diana Prince', 'Accountant', 50000.00, 2),
(205, 'Jhon Mathew', 'Assistant Librarian', 32000.00, 3),
(206, 'Anu Mathew', 'Clerk', 52000.00, 3),
(207, 'Anjali', 'Librarian', 42000.00, 3),
(208, 'Jithu ', 'Clerk', 22000.00, 4),
(209, 'Veni', 'Manager', 72000.00, 4),
(210, 'Jack Mike', 'Assistant Manager', 62000.00, 5);
select * from Employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 10.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-14-017739-8', '1984', 'Dystopian', 12.00, 'No', 'George Orwell', 'Penguin Books'),
('978-0-452-28423-4', 'To Kill a Mockingbird', 'Classic', 15.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-7432-7356-5', 'The Da Vinci Code', 'Mystery', 20.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-316-76948-0', 'The Catcher in the Rye', 'Fiction', 18.00, 'No', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-06-112008-4', 'Brave New World', 'Dystopian', 14.00, 'yes', 'Aldous Huxley', 'Harper Perennial Modern Classics'),
('978-0-307-74197-7', 'The Road', 'Post-apocalyptic', 13.00, 'No', 'Cormac McCarthy', 'Vintage'),
('978-1-5011-7683-3', 'Where The Crawdads Sing', 'Mystery', 25.00, 'yes', 'Delia Owens', 'G.P. Putnam\'s Sons'),
('978-0-618-00222-8', 'The Hobbit', 'Fantasy', 22.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt'),
('978-0-06-231500-7', 'To All The Boys I\'ve Loved Before', 'Romance', 18.00, 'No', 'Jenny Han', 'Simon & Schuster');
select * from Books;

INSERT INTO Customer (Customer_Id, Customer_Name, Customer_Address, Reg_Date) VALUES
(301, 'John Doe', '456 Maple Street, City Ville', '2023-01-15'),
(302, 'Jane Smith', '789 Oak Road, Towns Ville', '2023-02-20'),
(303, 'Emily Davis', '123 Pine Avenue, Village Town', '2023-03-25'),
(304, 'Michael Brown', '321 Cedar Street, Hamlet', '2023-04-10'),
(305, 'Sarah Wilson', '654 Birch Street, Metropolis', '2024-02-25'),
(306, 'Sarah Jhonson', '651 Land Villa, Martin Road', '2024-03-22'),
(307, 'Mia George', '854 Thomson Street, Metropolis', '2024-04-11'),
(308, 'Anu Anjali', '254 Briston Street, Country Village', '2024-05-06'),
(309, 'Sijin', '154 Urban Road , Urban Village', '2024-07-03'),
(310, 'Krishna', '444 Town Road, Metropolis', '2024-06-05');
select * from Customer;

INSERT INTO IssueStatus (Issue_Id, Issued_Cust, Issued_Book_Name, Issue_Date, Isbn_Book) VALUES
(401, 301, 'The Great Gatsby', '2023-06-01', '978-3-16-148410-0'),
(402, 302, '1984', '2023-06-05', '978-0-14-017739-8'),
(403, 303, 'To Kill a Mockingbird', '2023-06-10', '978-0-452-28423-4'),
(404, 304, 'The Da Vinci Code', '2023-06-15', '978-0-7432-7356-5'),
(405, 305, 'The Catcher in the Rye', '2023-06-20', '978-0-316-76948-0'),
(406, 306, 'Brave New World', '2021-06-10', '978-0-06-112008-4'),
(407, 307, 'The Road', '2013-05-24', '978-0-307-74197-7'),
(408, 308, 'Where The Crawdads Sing', '2022-06-20', '978-1-5011-7683-3'),
(409, 309, 'The Hobbit', '2023-09-10', '978-0-618-00222-8'),
(410, 310, 'To All The Boys I\'ve Loved Before', '2020-06-20', '978-0-06-231500-7');
select * from IssueStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'The Great Gatsby', '2023-06-15', '978-3-16-148410-0'),
(502, 302, '1984', '2023-06-20', '978-0-14-017739-8'),
(503, 303, 'To Kill a Mockingbird', '2023-06-25', '978-0-452-28423-4'),
(504, 304, 'The Da Vinci Code', '2023-06-30', '978-0-7432-7356-5'),
(505, 305, 'The Catcher in the Rye', '2023-07-05', '978-0-316-76948-0'),
(506, 306, 'Brave New World', '2023-09-05', '978-0-06-112008-4'),
(507, 307, 'The Road', '2023-010-05', '978-0-307-74197-7'),
(508, 308, 'Where The Crawdads Sing', '2023-11-05', '978-1-5011-7683-3'),
(509, 309, 'The Hobbit', '2023-12-01', '978-0-618-00222-8'),
(510, 310, 'To All The Boys I\'ve Loved Before', '2023-07-019', '978-0-06-231500-7');
select * from ReturnStatus;

-- 1.Retrieve the book title, category, and rental price of all available books
SELECT Book_Title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- 2.List the employee names and their respective salaries in descending order of salary.  
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT Books.Book_Title, Customer.Customer_Name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4.Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- 5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_Name, Position
FROM Employee
WHERE Salary > 50000;

-- 6.List the customer names who registered before 2023-09-12 and have not issued any books yet. 
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2023-09-12';

-- 7.Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_No, COUNT(Emp_Id) AS Total_Employees
FROM Employee
GROUP BY Branch_No;

-- 8.Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT Customer.Customer_Name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE IssueStatus.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9.Retrieve book_title from book table containing fiction. 
SELECT Book_Title
FROM Books
WHERE Category = 'Fiction';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_No, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_No
HAVING COUNT(*) > 1;

-- 11.Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Employee.Emp_Name, Branch.Branch_Address
FROM Employee
JOIN Branch ON Employee.Branch_No = Branch.Branch_No
WHERE Employee.Position = 'Manager';

-- 12.Display the names of customers who have issued books with a rental price higher than Rs.15.
SELECT DISTINCT Customer.Customer_Name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 15;









 
