select type, count(type)
from tickets
INNER JOIN transactions ON transactions.tickets_id = tickets.id
group by tickets.type;

select type, count (type),sum (price) as price from tickets
group by tickets.type
ORDER BY price DESC
LIMIT 1;




3 missing



select tickets.procurer, tickets.type, transactions.tickets_id,count (tickets_id) as ticketssum
from transactions
INNER JOIN tickets
ON tickets.id=transactions.tickets_id
group by tickets_id,tickets.procurer,tickets.type
order by ticketssum desc;


select customers.name,customers.afm, count(customers.afm) as customer_go,tickets.type
from tickets
INNER JOIN transactions ON transactions.tickets_id = tickets.id
INNER JOIN customers on transactions.customer_id = customers.afm
group by afm,tickets.type
ORDER BY customer_go desc;
