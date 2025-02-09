create database ola
use ola

-- 1. Retrieve all successful bookings:
create view Successfull_Bookings as   -- store as temporary
select * from Booking
where Booking_Status='Success'

select * from Successfull_Bookings


--2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type,AVG(Ride_Distance) as avg_distance from Booking
group by Vehicle_Type

select * from ride_distance_for_each_vehicle


--3. Get the total number of cancelled rides by customers:
create view canceled_rides_by_customer as
select COUNT(*) as canceled_rides_by_customers from Booking  
where Booking_Status = 'Canceled by Customer'

select * from canceled_rides_by_customer


--4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as 
select TOP 5 Customer_ID , COUNT(Booking_ID) as total_rides
from Booking
group by Customer_ID 
order by total_rides desc 

select * from top_5_customers

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers_p_c_issues as 
select COUNT(*) as canceledridescount from Booking
where Canceled_Rides_by_Driver = 'Personal & Car related issue'

SELECT * FROM rides_canceled_by_drivers_p_c_issues

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
select MAX(Driver_Ratings) as max_ratings,
	MIN(Driver_Ratings) as min_ratings
		from Booking where Vehicle_Type = 'Prime Sedan'

select * from max_min_driver_rating


--7. Retrieve all rides where payment was made using UPI:
create view upi_payment as
select * from Booking where Payment_Method = 'UPI'

select * from upi_payment

--8. Find the average customer rating per vehicle type:
create view avg_cust_rating as
select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
from Booking 
group by Vehicle_Type

select * from avg_cust_rating

--9. Calculate the total booking value of rides completed successfully:
create view  total_successfullride_value as 
select SUM(Booking_Value) as total_successfullride_value from Booking
where Booking_Status = 'Success'

select * from total_successfullride_value

--10. List all incomplete rides along with the reason:
create view incomplete_rides_reason as 
select Booking_ID , Incomplete_Rides_Reason from Booking where Incomplete_Rides = '1'

-- here 1 means yes and 0 means no
select * from incomplete_rides_reason