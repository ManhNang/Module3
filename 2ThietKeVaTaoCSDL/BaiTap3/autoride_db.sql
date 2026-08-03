CREATE DATABASE IF NOT EXISTS autoride_db;
USE autoride_db;

CREATE TABLE Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    customer_name VARCHAR(100) NOT NULL,
    rent_date DATETIME NOT NULL,
    return_date DATETIME,
    status VARCHAR(50) DEFAULT 'BOOKED', 
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

alter table Rentals
	modify status enum('BOOKED', 'ACTIVE', 'COMPLETED', 'CANCELLED') default 'BOOKED',
	add security_deposit decimal(18, 2) default 0,
	add late_fee decimal(18, 2) default 0,
	add damage_fee decimal(18, 2) default 0;

create table Inspections(
	inspection_id int auto_increment primary key,
	rental_id int,
	inspection_date datetime,
    damage_description text,
    inspector_name varchar(100),
    foreign key (rental_id) references Rentals(rental_id) on delete restrict on update cascade
);

insert into Cars (model_name, license_plate) values ('VF3','35F1-234');

insert into Rentals (car_id, customer_name, rent_date, return_date, status, security_deposit)
	values (1, 'Nguyen Van A', '2026-08-02 14:00:00', '2026-08-03 14:00:00', 'ACTIVE', 10000000.00);
    
insert into Inspections (rental_id, inspection_date, damage_description, inspector_name)
	values (1, '2026-08-03 15:00:00', 'Vo den pha trai', 'Tran Manh Nang');

update Rentals set status = 'COMPLETED', late_fee = 0, damage_fee = 2000000.00 where rental_id = 1;

select rental_id, customer_name, security_deposit, late_fee, damage_fee, (security_deposit - late_fee - damage_fee) as refund_amount
	from Rentals
    where rental_id = 1;
