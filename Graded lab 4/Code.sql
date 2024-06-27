create database swirl;
use swirl;
-- _________________________________________Q=1
select count(*)
from track as t
where exists (
 select *
 from genre as g
 where t.GenreId=g.GenreId
 AND g.name="Pop"
);


-- _________________________________________Q=2

select FirstName, LastName
from customer as c
where exists (
select *
from invoice as i
where c.CustomerId=i.CustomerId
and  i.invoiceDate=(
select max(ii.invoiceDate)
from invoice as ii
)
);

-- _________________________________________Q=3
select *
from Employee
order by HireDate asc
limit 1;


-- _________________________________________Q=4
select a.ArtistId, a.Name, COUNT(ab.AlbumId) 
from Artist as a
left join Album ab
on a.ArtistId = ab.ArtistId
group by a.ArtistId, a.Name
order by a.ArtistId;

-- _________________________________________Q=5
select SUM(i.Quantity) 
from InvoiceLine as i
where exists (
   select 1
    from Invoice as v
    where v.InvoiceId =i.InvoiceId
    and v.BillingCity = 'Oslo'
);

-- _________________________________________Q=6
select *
from Track
where Milliseconds <(
select AVG(Milliseconds)
 from Track
)
LIMIT 1000;


-- _________________________________________Q=7
select COUNT(*) 
from track as t
join mediatype as m
on t.MediaTypeId = m.MediaTypeId
where m.Name = 'MPEG';

-- _________________________________________Q=8

select COUNT(*) 
from Employee as emp
where not exists (
    select *
   from Customer as cust
    join Invoice as inv on cust.CustomerId = inv.CustomerId
    where cust.SupportRepId = emp.EmployeeId
);

-- _________________________________________Q=9

select t.Milliseconds, t.TrackId, t.AlbumId, a.Title , ar.Name 
from Track as t
join Album as a 
on t.AlbumId = a.AlbumId
join Artist as ar 
on a.ArtistId = ar.ArtistId
where
    t.Milliseconds > (
        select avg(Milliseconds)
        from Track
    );

-- _________________________________________Q=10

select SUM(i.Total)
from Invoice as  i
where exists (
    select *
    from InvoiceLine as il
    join Track as t 
    on il.TrackId = t.TrackId
    where il.InvoiceId = i.InvoiceId
    and t.Name = 'Evil Walks'
);










