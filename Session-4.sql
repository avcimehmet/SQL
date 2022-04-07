/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler
tablolarındaki 
marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve
siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/
 
 SELECT * FROM MARKALAR;
 
 SELECT markalar.marka_id, markalar.marka_adi,
		siparisler.siparis_adedi, siparisler.siparis_tarihi
 FROM markalar
 JOIN siparisler
 ON markalar.marka_id = siparisler.marka_id;
 
 SELECT markalar.marka_id, markalar.marka_adi,
		siparisler.siparis_adedi, siparisler.siparis_tarihi
 FROM markalar
 JOIN siparisler
 ON markalar.marka_id = siparisler.marka_id;
 
 SELECT m.marka_id, m.marka_adi,
		s.siparis_adedi, s.siparis_tarihi
 FROM markalar m
 LEFT JOIN siparisler s
 ON  s.marka_id = m.marka_id;
 
 
/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis
bilgilerini (marka_id,marka_adi,siparis_adedi,siparis_tarihi)
listeleyen bir sorgu yaziniz.*/
 SELECT * FROM MARKALAR;
 
 SELECT s.id, s.marka_id, m.marka_adi,
		s.siparis_adedi, s.siparis_tarihi
 FROM markalar m
 LEFT JOIN siparisler s
 ON  s.marka_id = m.marka_id;
 
 /* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/

SELECT t.name as Track_name, g.name as Genre
FROM tracks t
LEFT JOIN genres g
ON t.GenreId = g.GenreId;


/* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını (lastName), fatura tarihini (InvoiceDate) 
ve fatura meblağını (total) listeleyen sorguyu yazınız */

SELECT 	c.FirstName, c.LastName, 
		i.InvoiceDate, i.total,
		count(c.LastName) as customer
FROM customers c
LEFT JOIN invoices i
ON c.CustomerId = i.CustomerId
GROUP BY c.LastName
ORDER BY count(c.LastName) DESC;

 /* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını artan sırada
listeleyen sorguyu yazınız */

SELECT 	c.FirstName, c.LastName, 
		SUM(i.total) as total_amount
FROM customers c
LEFT JOIN invoices i
ON c.CustomerId = i.CustomerId
GROUP BY c.FirstName
HAVING total_amount > 40
ORDER BY total_amount DESC;

/*===================================================
 SUBQUERIES
====================================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
SELECT TrackId, name, AlbumId
FROM tracks
	WHERE AlbumId =
	(SELECT AlbumId 
	FROM albums
	WHERE albums.Title = "Faceless");
	
SELECT TrackId, name, AlbumId
FROM tracks
	WHERE AlbumId =
	(SELECT AlbumId 
	FROM albums
	WHERE albums.Title = "Faceless");
	

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId AND a.Title = "Faceless";

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId = a.AlbumId 
WHERE a.Title = "Faceless";