Use library;
-- 1- find the number of availalbe copies of the book (Dracula)
SELECT count( DISTINCT l.bookid ) as Availablecopies FROM loans AS l
INNER JOIN books AS b ON l.bookid = b.bookid  
WHERE b.title = 'Dracula'
AND l.bookid NOT IN (
    SELECT DISTINCT bookid 
    FROM loans 
    WHERE returneddate IS NULL
);

-- 2- check total copies of the book */
 Select * from books
WHERE title = 'Dracula';

-- 3- current total loans of the book */
select Count(loanID) as Current_total_Loan from books as b
inner join loans as l on b.bookid = l.bookID
where b.title = 'Dracula'
and l.returneddate is null ;

-- 4- total available books of dracula */
SELECT DISTINCT l.bookid  as totalAvailablecopies FROM loans AS l
INNER JOIN books AS b ON l.bookid = b.bookid  
WHERE b.title = 'Dracula'
AND l.bookid NOT IN (
    SELECT DISTINCT bookid 
    FROM loans 
    WHERE returneddate IS NULL
);
-- 5- Add new books to the library    
INSERT INTO books (bookID,title,author,published,barcode) VALUES(204, 'Microfinanace' , 'victor Hugo' , 2000 , 2719805558),
(205 , 'Economics' , 'Jules Verne' , 1994 , 27198186879);

-- 6- Check out Books: books(4043822646, 2855934983) whose patron_email(jvaan@wisdompets.com), loandate=2020-08-25, duedate=2020-09-08, loanid=by_your_choice*/
SELECT 
    bo.bookid, 
    bo.title, 
    bo.barcode, 
    lo.loanid, 
    lo.loandate, 
    lo.duedate, 
    lo.returneddate, 
    p.patronID, 
    p.firstname, 
    p.lastname, 
    p.email
FROM books AS bo 
INNER JOIN loans AS lo ON bo.bookid = lo.bookid
INNER JOIN patrons AS p ON lo.patronID = p.patronID
WHERE bo.barcode IN (4043822646, 2855934983)
AND p.email = 'jvaan@wisdompets.com'
AND DATE(lo.loandate) = '2020-08-25' 
AND DATE(lo.duedate) = '2020-09-08';


-- 7  Check books for Due back (generate a report of books due back on July 13, 2020  with patron contact information   )
select * from loans as l
inner join patrons as p on l.patronid = p.patronid
where l.duedate = '2020-07-13';

-- 8 Return books to the library (which have barcode=6435968624) and return this book at this date(2020-07-05)
UPDATE loans 
SET ReturnedDate = '2020-07-01'
WHERE bookid = (SELECT bookid FROM books WHERE barcode = 6435968624);

-- 9-  Encourage Patrons to check out books ( generate a report of showing 10 patrons who have checked out the fewest books. )   
SELECT 
    p.firstname, 
    p.lastname, 
    COUNT(*) AS num_books 
FROM patrons AS p 
INNER JOIN loans AS l ON p.patronid = l.patronid
GROUP BY p.patronid, p.firstname, p.lastname  
ORDER BY num_books asc 
LIMIT 10;

--  10 Find books to feature for an event (create a list of books from 1890s that are currently available)
select  distinct b.bookID , b.title , b.author from books as b 
inner join loans as l on b.bookid = l.bookid 
where b.published < 1890
AND l.returneddate IS not NULL
order by b.bookID asc;

 -- 11 /* Book Statistics (create a report to show how many books were published each year)
SELECT published, COUNT(DISTINCT(bookid)) AS TotalNumberOfPublishedBooks FROM books
GROUP BY published
ORDER BY TotalNumberOfPublishedBooks DESC;
 
-- 12 Book Statistics (create a report to show 5 most popular Books to check out )
SELECT b.title, b.author, b.published, COUNT(b.Title) AS TotalTimesOfLoans FROM books b
inner JOIN loans l ON b.bookID = l.bookID
GROUP BY b.title, b.author, b.published 
ORDER BY TotalTimesOfLoans DESC
LIMIT 5;