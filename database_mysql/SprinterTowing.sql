/* Insert values */
/*
create user nodeuser@localhost identified by 'nodeuser@1234';
grant all privileges on towingdb.* to nodeuser@localhost;
ALTER USER 'nodeuser'@localhost IDENTIFIED WITH mysql_native_password BY 'nodeuser@1234';

insert into company (Name, Address)
values ('Sprinter Towing', '998 Pacific av');

select @company:=idCompany from company where Name = 'Sprinter Towing';

insert into shareholder (company_idCompany, Name, Share)
values (@company, 'Max', 50);

insert into shareholder (company_idCompany, Name, Share)
values (@company, 'Hector', 50);

select @max:=idShareholder from shareholder where Name = 'Max';
select @hector:=idShareholder from shareholder where Name = 'Hector';

insert into truck (company_idCompany, Name, Flatdeck, Dollies, Winch, Flat_Tire, Jump_Start, Lift_Weight)
values (@company, 'International 4300', 1, 1, 1, 1, 1, 9000);

select @truck:=idTruck from truck where company_idCompany = @company;

einsert into driver (Company_idCompany, Name)
values 
(@company, 'Max'),
(@company, 'Ale'),
(@company, 'Marty'),
(@company, 'Justin')
;

select @maxDriver:=idDriver from driver where Name = 'Max';

insert into payrate (Company_idCompany, Date, Hours, Kms, Services, Bonus_Nigth)
values (@company, now(), 12, 0.40, 8, 4);

insert into service(Driver_idDriver, Driver_Company_idCompany, Date, Details, Tow, Flat_Deck, Dollies, Km, Winch, Jump_Start, Flat_Tire)
values
(@maxDriver, @company, '2019-01-19', "Kenora", 0, 1, 0, 0, 0, 0, 0),
(@maxDriver, @company, '2019-03-09', "CAA 1490", 1, 0, 0, 30, 0, 0, 0),
(@maxDriver, @company, '2019-03-11', "CAA 1728", 0, 0, 0, 0, 0, 1, 0),
(@maxDriver, @company, '2019-03-11', "CAA 1925", 0, 0, 1, 10, 0, 0, 0),
(@maxDriver, @company, '2019-03-11', "CAA 2417", 0, 0, 0, 0, 0, 1, 0),
(@maxDriver, @company, '2019-03-11', "CAA 2650", 1, 0, 0, 5, 0, 0, 0),
(@maxDriver, @company, '2019-03-13', "Tow Max", 1, 0, 0, 0, 0, 0, 0),
(@maxDriver, @company, '2019-03-13', "Tow Headingley (1)", 0, 1, 0, 20, 0, 0, 0),
(@maxDriver, @company, '2019-03-13', "Tow Headingley (2)", 0, 1, 0, 20, 0, 0, 0),
(@maxDriver, @company, '2019-03-14', "Tow Juan (1)", 1, 0, 0, 9, 0, 0, 0),
(@maxDriver, @company, '2019-03-14', "Tow Juan (2)", 1, 0, 0, 9, 0, 0, 0),
(@maxDriver, @company, '2019-03-14', "Winch (1)", 0, 0, 0, 0, 1, 0, 0),
(@maxDriver, @company, '2019-03-14', "Winch (2)", 0, 0, 0, 0, 1, 0, 0);

select @service:=min(idService) from service where not exists (select 1 from register where Service_idService = idService);

insert into register(Company_idCompany, Shareholder_IdShareholder, Truck_idTruck, Service_idService, Type, Date, Name, Amount)
values
(@company, @hector, @truck, @service, 'Income_Service', '2019-01-19', 'Kenora', 60),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-09', 'CAA 1490', 128.84),
(@company, @ale, @truck, @service:=@service+1, 'Income_Service', '2019-03-11', 'CAA 1728', 39.90),
(@company, @ale, @truck, @service:=@service+1, 'Income_Service', '2019-03-11', 'CAA 1925', 84.74),
(@company, @ale, @truck, @service:=@service+1, 'Income_Service', '2019-03-11', 'CAA 2417', 39.90),
(@company, @ale, @truck, @service:=@service+1, 'Income_Service', '2019-03-11', 'CAA 2650', 49.56),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-13', 'Tow shop Max', 50),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-13', 'Tow Headingley (1) incl taxes', 96),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-13', 'Tow Headingley (2) incl taxes', 96),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-14', 'Tow shop Juan (1) cobrar Lucas', 50),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-14', 'Tow shop Juan (2) cobrar Lucas', 50),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-14', 'Winch (1)', 50),
(@company, @max, @truck, @service:=@service+1, 'Income_Service', '2019-03-14', 'Winch (2)', 50)
;

insert into register(Company_idCompany, Shareholder_IdShareholder, Truck_idTruck, Type, Date, Name, Amount)
values
(@company, @max, @truck, 'Outcome_Generic', '2019-01-18', 'Fuel Sierra in Winnipeg', 81.80),
(@company, @max, @truck, 'Outcome_Generic', '2019-01-18', 'Food in PetroCanada Winnipeg', 5.17),
(@company, @max, @truck, 'Outcome_Generic', '2019-01-18', 'Fuel Sierra', 66.51),
(@company, @max, @truck, 'Outcome_Generic', '2019-01-18', 'Food in Seven Eleven', 3.00),
(@company, @hector, @truck, 'Outcome_Generic', '2019-01-18', 'MPI CALL CENTRE WINNIPEG', 77.00),
(@company, @hector, @truck, 'Outcome_Invest', '2019-01-18', 'Truck Internacional 4300 2002 (Cheque 13008.50)', 12008.50),
(@company, @max, @truck, 'Outcome_Supply', '2019-01-18', 'Fuel Thunder Bay', 192.80),
(@company, @max, @truck, 'Outcome_Invest', '2019-01-18', 'Tool_town (towing chains, Thunder Bay)', 135.53),
(@company, @max, @truck, 'Outcome_Supply', '2019-01-18', 'Fuel', 114.28),
(@company, @max, @truck, 'Outcome_Generic', '2019-01-18', 'Food Tim Horton Dryden', 6.3),
(@company, @max, @truck, 'Outcome_Generic', '2019-01-19', 'Comfort-INN Kenora', 139.85),
(@company, @max, @truck, 'Outcome_Invest', '2019-01-19', 'Battery Charger (Canadian Tire) Kenora', 244.37),
(@company, @max, @truck, 'Outcome_Supply', '2019-01-19', 'Coolant Extension Cord (Canadian Tire) Kenora', 55.34),
(@company, @hector, @truck, 'Outcome_Supply', '2019-01-19', 'Fuel (Canadian Tire) Kenora', 63.39),
(@company, @hector, @truck, 'Outcome_Generic', '2019-01-19', 'Fuel Sierra (Canadian Tire) Kenora', 64.94),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-03', 'Black Asphalt undercoating (x10)', 38.03),
(@company, @hector, @truck, 'Outcome_Repair', '2019-02-04', 'Black Asphalt undercoating (x6)', 22.82),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-07', 'Manguera hidraulica cepillo (Princess Auto)', 41.05),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-08', 'Black Asphalt undercoating Thiner', 42.00),
(@company, @hector, @truck, 'Outcome_Repair', '2019-02-08', 'Thiner x2', 26.19),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-10', 'Marty salary', 210.00),
(@company, @hector, @truck, 'Outcome_Repair', '2019-02-10', 'Marty salary', 267.50),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-14', 'Cab corners (Sean)', 200),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-15', 'Flex tubing 10 ft (Piston Ring)', 81.36),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-16', 'Heater paint (Canadian Tire)', 14.96),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-19', 'Paint - Clamps - Bolts', 54.07),
(@company, @hector, @truck, 'Outcome_Generic', '2019-02-19', 'Permit and Ownership', 120),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-20', 'Glass windshield', 173.65),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-20', 'Primer - Fast cure (Piston ring)', 60),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-23', 'Body work and windshield (Sean)', 100),
(@company, @max, @truck, 'Outcome_Supply', '2019-02-23', 'Fuel (Husky Winnipeg)', 100),
(@company, @max, @truck, 'Outcome_Generic', '2019-02-23', 'Food at Randy', 50),
(@company, @hector, @truck, 'Outcome_Generic', '2019-02-23', 'Fuel (Acadia Huskey Winnipeg)', 34),
(@company, @max, @truck, 'Outcome_Repair', '2019-02-23', 'Marty salary. 6x22. exhaust', 132),
(@company, @max, @truck, 'Outcome_Supply', '2019-03-03', 'OIL Shel T4 DSL 15W40', 201.51),
(@company, @max, @truck, 'Outcome_Supply', '2019-03-03', 'OIL Filter (Piston Ring)', 43.77),
(@company, @max, @truck, 'Outcome_Invest', '2019-03-05', 'Payback International 4300', 1000),
(@company, @max, @truck, 'Outcome_Generic', '2019-03-05', 'Fuel Sierra', 20),
(@company, @max, @truck, 'Outcome_Repair', '2019-03-05', 'Safety and Brakes (Randy)', 3136.12),
(@company, @hector, @truck, 'Outcome_Generic', '2019-03-05', 'Registration 1 of 12', 89.39),
(@company, @hector, @truck, 'Outcome_Supply', '2019-03-05', 'MPI Insurance', 118.50),
(@company, @max, @truck, 'Outcome_Invest', '2019-03-11', 'CAA Skates - Strap - Tie down system', 465.39),
(@company, @max, @truck, 'Outcome_Supply', '2019-03-11', 'Fuel (Huskey Winnipeg)', 130.74),
(@company, @max, @truck, 'Outcome_Repair', '2019-03-15', 'Paint (Rona)', 140.12),
(@company, @max, @truck, 'Outcome_Generic', '2019-03-15', 'Truck wash', 28),
(@company, @max, @truck, 'Outcome_Generic', '2019-03-15', 'Food at shop', 50)
;

*/

/* STORE PROCEDURES
 
DELIMITER //
CREATE PROCEDURE db_get_service_driver
(IN id integer)
BEGIN
	select * from service inner join 
    (select * from driver where idDriver = id) as temp_driver 
	on Driver_idDriver = idDriver;
END //
DELIMITER ;
 
*/db_get_service_driver

select @company:=idCompany from company where Name = 'Sprinter Towing';
select @max:=idShareholder from shareholder where Name = 'Max';
select @hector:=idShareholder from shareholder where Name = 'Hector';
select @truck:=idTruck from truck where company_idCompany = @company;
select @maxDriver:=idDriver from driver where Name = 'Max';

select * from shareholder where company_idCompany = @company;
select * from truck where company_idCompany = @company;
select * from driver where company_idCompany = @company;
select * from payrate where company_idCompany = @company;
select * from service where Driver_Company_idCompany = @company;
select * from register where company_idCompany = @company;
select sum(Amount) from register where company_idCompany = @company and Shareholder_idShareholder = @hector;
select sum(Amount) from register where company_idCompany = @company and Shareholder_idShareholder = @max;

select * from service left join driver on Driver_idDriver = idDriver;

/* Servicios no cobrados */
select service.*, @service:=min(idService) from service where not exists (select 1 from register where Service_idService = idService);

call db_get_service_driver(1);

update register set income = 1 where Type = 'Income_Generic';
