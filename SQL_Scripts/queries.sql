--Retrieve all ticket bookings by a specific user
select * from Tickets
where UserID=1;
 
--List all upcoming events
select distinct EventName as Events from Tickets;
 
--Update ticket price for a specific event
update Tickets set price=1780 where EventName="Hwh_Krv";
 
--Find the total revenue from ticket sales
select sum(price) as ToatalRevenue from Tickets;
 
--Delete a user’s booking and payment details
delete from Payments where UserID=1;
delete from Tickets where UserID=1; 

--Retrieve all payments made within a specific date range
select * from Payments
where PaymentDate between ’2025-03-02’ and ’2025-03-03’;
 
--Find the most frequently booked event
select EventName as Event,count(EventName) as Bookings
from Tickets
group by EventName
order by Bookings desc
limit 1;
 
--Identify users who booked more than three tickets
select U.UserID,U.Name,count(T.EventName) as TicketCount
from Tickets as T join Users as U on U.UserID=T.UserID
group by U.UserID
having TicketCount>3;
 
--Generate a report of total revenue by event
select EventName as Event,sum(price) as TotalRevenue
from Tickets
group by EventName;
 
--Retrieve the top five highest-paying customers
select U.UserID,U.Name,sum(P.Amount) as TotalAmount
from Payments as P join Users as U on P.UserID=U.UserID
group by U.UserID
order by TotalAmount desc
limit 5;