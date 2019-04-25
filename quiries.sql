select *
from transactions
where  conf_date  > '2019-1-25' AND conf_date < CURRENT_DATE ;
