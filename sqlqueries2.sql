a
select type, count(type)
from tickets
INNER JOIN transactions ON transactions.tickets_id = tickets.id
group by tickets.type;

b
select type, count (type),sum (price) as price
from tickets
INNER JOIN transactions ON transactions.tickets_id = tickets.id
group by tickets.type
ORDER BY price DESC
LIMIT 1;

c
SELECT tickets.type,avg(price::money::numeric::float8)
FROM transactions
INNER JOIN customers ON customers.afm = transactions.customer_id
INNER JOIN tickets ON tickets.id = transactions.tickets_id
where 15 < age AND age  < 45
group by tickets.type;

d
select tickets.procurer, tickets.type, transactions.tickets_id,count (tickets_id) as ticketssum
from transactions
INNER JOIN tickets
ON tickets.id=transactions.tickets_id
group by tickets_id,tickets.procurer,tickets.type
order by ticketssum desc;

e
select customers.name,customers.afm, count(customers.afm) as customer_go,tickets.type
from tickets
INNER JOIN transactions ON transactions.tickets_id = tickets.id
INNER JOIN customers on transactions.customer_id = customers.afm
group by afm,tickets.type
ORDER BY customer_go desc;

f
select count(companies.afm) as eisitiria_pou_poulise,companies.afm,companies.name
from transactions
INNER JOIN tickets on tickets.id = transactions.tickets_id
INNER JOIN companies on tickets.procurer = companies.afm
group by companies.afm,companies.name
order by eisitiria_pou_poulise desc
;

g
select tickets.id,tickets.procurer,tickets.type,tickets.location,tickets.price,tickets.genre
from transactions
INNER JOIN tickets ON transactions.tickets_id = tickets.id
where  conf_date  > '2019-1-25' AND conf_date < CURRENT_DATE
group by tickets.id
;
