CREATE DATABASE library_management;
USE library_management;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    available_copies INT DEFAULT 1
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 3),
(2, 'Atomic Habits', 'James Clear', 'Self-help', 2),
(3, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 5),
(4, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 1),
(5, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 4);

INSERT INTO members VALUES
(1, 'Rahul Sharma', 'rahul@example.com', '2024-01-15'),
(2, 'Priya Desai', 'priya@example.com', '2024-03-10'),
(3, 'Amit Kumar', 'amit@example.com', '2024-04-25'),
(4, 'Sneha Patil', 'sneha@example.com', '2024-05-20'),
(5, 'Vikram Singh', 'vikram@example.com', '2024-06-12');

INSERT INTO loans VALUES
(1, 1, 2, '2024-07-01', NULL),
(2, 2, 1, '2024-07-05', '2024-07-20'),
(3, 3, 4, '2024-07-10', NULL);

--1. Books currently on loan

SELECT b.title, m.name, l.loan_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

-- 2. Members with more than 1 borrowed book

SELECT m.name, COUNT(l.loan_id) AS books_borrowed
FROM loans l
JOIN members m ON l.member_id = m.member_id
GROUP BY m.member_id
HAVING COUNT(l.loan_id) > 1;

-- 3. Books never borrowed

SELECT b.title
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
WHERE l.book_id IS NULL;

-- 4. Books by J.K. Rowling

SELECT * FROM books
WHERE author = 'J.K. Rowling';

-- 5. Total available books

SELECT SUM(available_copies) AS total_books_available
FROM books;
