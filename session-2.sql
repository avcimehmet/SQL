/*===================================================
	SELECT
===================================================*/

/* tracks tablosundaki track isimlerini (name) sorgulayınız */
 SELECT name FROM tracks;

/* tracks tablosundaki besteci(Composer) ve şarkı 
imlerini (name) sorgulayınız*/
 SELECT name, Composer FROM tracks;
 
/*album tablosundaki tüm bilgileri sorgulayınız*/
 select * from albums;

/*===================================================
DISTINCT
===================================================4*/
/*tracks tablosundaki composer bilgileri sorgulayınız 
 (TEKRARLI OLABİLİR)*/
 
 SELECT Composer FROM tracks;
 
 /*tracks tablosundaki composer bilgileri sorgulayınız 
 TEKRARSIZ) */
 select DISTINCT Composer from tracks;
 
 SELECT DISTINCT AlbumId, MediaTypeId from tracks;
 
 SELECT AlbumId FROM tracks WHERE AlbumId > 1 ;
  
 SELECT name, Milliseconds
 FROM tracks
 WHERE Composer = "Jimi Hendrix";
 
 SELECT *
 FROM invoices
 WHERE total > 10;
 
 SELECT InvoiceId, InvoiceDate, total
 FROM invoices
 WHERE total > 10
 LIMIT 4;
 
 SELECT *
 FROM invoices
 WHERE total > 10 AND NOT total = 11
 ORDER BY InvoiceDate DESC
 LIMIT 10;
 
 SELECT CustomerId, BillingCity, InvoiceDate, total
 FROM invoices
 ORDER BY BillingCity ASC, total DESC;
 

SELECT *
FROM invoices
WHERE NOT BillingCountry = "USA"
ORDER BY total ASC;

SELECT *
FROM invoices
WHERE BillingCountry = "USA" OR BillingCountry = "Germany" 
ORDER BY InvoiceId ASC;

SELECT *
FROM invoices
WHERE InvoiceDate >= "2012-01-01 00:00:00" AND InvoiceDate <= "2013-01-02";

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2012-01-01" AND "2013-01-02";

SELECT *
FROM invoices
WHERE InvoiceDate NOT BETWEEN "2012-01-01" AND "2013-01-02";

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-01-01"
ORDER BY InvoiceDate DESC
LIMIT 1;

SELECT FirstName, LastName, country
FROM customers
WHERE country in ("Belgium", "Norway", "Canada", "USA");