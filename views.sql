create table country (id int primary key, country_name varchar(20), population int, area varchar(20));
insert into country (id,country_name,population,area)  values
(1,'USA', 33100, 9833517),
(2,'Canada', 3777, 9976140),
(3,'UK', 67888, 243610),
(4,'India', 138000, 3287263),
(5,'Australia', 256, 7692024),
(6,'Germany', 8370006, 357022),
(7,'France', 652000, 551695),
(8,'Japan', 1260000, 377975),
(9,'Brazil', 2120000, 8515767),
(10,'South Africa', 593000, 1219090),
(11,'Argentina', 567100, 9836756),
(12,'Wales', 890074, 9766100);

create table persons(id int primary key, fname varchar(20), lname varchar(20), population int ,
rating decimal(3,1), country_id int, FOREIGN KEY (Country_Id) REFERENCES Country(Id),country_name varchar(20) );
insert into persons (id,fname,lname,population,rating,country_id,country_name) values
(1, 'John', 'Doe', 50000000, 4.2, 1,'India'),
(2, 'Jane', 'Smith', 30000000, 3.5, 2,null),
(3, 'Emily', 'Jones', 20000000, 4.8, 3,null),
(4, 'Michael', 'Brown', 150000000, 4.1, 4,'USA'),
(5, 'Olivia', 'Taylor', 7000000, 4.6, 5,'India'),
(6, 'Sophia', 'Lee', 30000000, 4.7, 6,'Australia'),
(7, 'Liam', 'Wilson', 50000000, 4.0, 7,'France'),
(8, 'Ava', 'Johnson', 80000000, 3.9, 8,'South Africa'),
(9, 'Isabella', 'Davis', 100000000, 4.5, 9,null),
(10, 'Ethan', 'Martinez', 45000000, 4.3, 10,'South Africa'),
(11, 'Harris', null, 60000000, 3.2, 11,'India'),
(12, 'Mccalum', null, 12000000, 4.0, 12,null);

select * from country;
select * from persons;

alter table persons add DOB date;
update persons set DOB = '1985-06-15' where id = 1;
update persons set DOB = '1990-12-01' where id = 2;
update persons set DOB = '1988-03-22' where id = 3;
update persons set DOB = '1975-09-10' where id = 4;
update persons set DOB = '2000-07-30' where id = 5;
update persons set DOB= '1995-11-25' where id = 6;
update persons set DOB = '1980-05-14' where id = 7;
update persons set DOB = '1993-10-05' where id = 8;
update persons set DOB= '1982-04-19' where id = 9;
update persons set DOB = '1979-08-12' where id = 10;
update persons set DOB = '1981-09-10' where id = 11;
update persons set DOB = '1995-12-30' where id = 12;

select country_name, count(*) as num_persons from persons group by country_name;

select country_name, count(*) as num_persons from persons group by country_name order by num_persons desc;

select country_name, avg(rating) as avg_rating from persons group by country_name having avg(rating)>3.0;

select distinct country_name from persons where rating in( select rating from persons where country_name ='USA');

select country_name from country where population> (select avg(population) from country);

create database product;

use product;

create table customer(customer_id int primary key, fname varchar(20),lname varchar(20), email varchar(20), phone_no varchar(20),
address varchar(20), city varchar(20), state varchar(20), zip_code varchar(20), country varchar(20));

insert into customer(customer_id, fname ,lname, email, phone_no, address, city, state , zip_code, country) values 
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak St', 'Chicago', 'IL', '60614', 'USA'),
(3, 'Emily', 'Jones', 'emily.jones@example.com', '345-678-9012', '789 Pine St', 'Austin', 'TX', '73301', 'USA'),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '456-789-0123', '101 Maple St', 'San Francisco', 'CA', '94105', 'USA'),
(5, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '567-890-1234', '202 Birch St', 'Seattle', 'WA', '98101', 'USA'),
(6, 'Sophia', 'Lee', 'sophia.lee@example.com', '678-901-2345', '303 Cedar St', 'New York', 'NY', '10001', 'USA'),
(7, 'Liam', 'Wilson', 'liam.wilson@example.com', '789-012-3456', '404 Fir St', 'Los Angeles', 'CA', '90001', 'USA'),
(8, 'Ava', 'Johnson', 'ava.johnson@example.com', '890-123-4567', '505 Spruce St', 'Miami', 'FL', '33101', 'USA'),
(9, 'Isabella', 'Davis', 'isabella.davis@example.com', '901-234-5678', '606 Pine St', 'Denver', 'CO', '80201', 'USA'),
(10, 'Ethan', 'Martinez', 'ethan.martinez@example.com', '012-345-6789', '707 Oak St', 'Boston', 'MA', '02101', 'USA');
alter table customer modify email varchar(100);

create view customer_info as select concat('fname',' ','lname') as fullname,email from customer;
select * from customer_info;

create view us_customers as select * from customer where country ='USA';
select * from us_customers;

create view customer_details as select concat('fname',' ','lname') as full_name, email,phone_no,state from customer;
select * from customer_details;

update customer set phone_no ='-587-8754' where state='CA';
select * from customer;
#set sql_safe_updates = 0;
#set sql_safe_updates = 1;

select state, count(*) as cust_count from customer group by state having count(*)>5;

select state , count(*) as num_cust from customer_details group by state;

select * from customer_details order by state asc;








