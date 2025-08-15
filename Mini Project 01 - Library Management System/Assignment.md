Mini Project 01: Library Management System

Objective
Design and implement a MySQL database for a library to manage books, members, and book loans.

Tasks

1. Database & Tables
   Create the following tables:

1. books

- book_id (INT, Primary Key)
- title (VARCHAR(100), NOT NULL)
- author (VARCHAR(100), NOT NULL)
- genre (VARCHAR(50))
- available_copies (INT, default 1)

2. members

- member_id (INT, Primary Key)
- name (VARCHAR(100), NOT NULL)
- email (VARCHAR(100), UNIQUE)
- join_date (DATE)

3. loans

- loan_id (INT, Primary Key)
- member_id (FK → members.member_id)
- book_id (FK → books.book_id)
- loan_date (DATE)
- return_date (DATE, NULL if not returned)

2. Data Insertion

- Insert at least 5 books
- Insert at least 5 members
- Record at least 3 loans.

3. Queries to Perform
1. List all books currently on loan (not yet returned).
1. Find members who have borrowed more than 1 book.
1. Show books not borrowed by anyone.
1. List all books by a given author.
1. Count the total number of books available in the library.

1. Deliverables

- SQL file with:
  - Table creation scripts
  - Data insertion scripts
  - Queries
