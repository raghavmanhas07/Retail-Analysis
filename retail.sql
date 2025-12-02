
create or replace view retail.table_joined as 
SELECT 
s.date,
dayname(date) as day_of_week,
case when weekday(date) in (5, 6) then "Weekend" else "Weekday" end as is_weekend,
s.shop_id,
s.shop_name,
s.Customers,
s.sales_usd,
round(s.sales_usd/s.customers,2) as sales_per_customer,
su.pct_male,
su.pct_female,
su.pct_family,
su.pct_single,
w.avg_temp_f,
w.precip_in,
w.is_rain,
w.humidity_pct
FROM retail.sales s 
LEFT JOIN retail.survey su using(date)
LEFT JOIN retail.weather w
using(date)
 