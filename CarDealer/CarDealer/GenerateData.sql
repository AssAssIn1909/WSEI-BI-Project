/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO Address(Adr_Country, Adr_City, Adr_Street, Adr_BuildingNumber, Adr_ApartmentNumber) VALUES
	('Poland', 'Kraków',	'Ulica św. Filipa',				'17',	null),
	('Poland', 'Warszawa',	'Ulica Garbarska',				'54a',	1),
	('Poland', 'Łódź',		'Ulica Okopowa',				'13',	3),
	('Poland', 'Kraków',	'Ulica Wawelska',				'3a',	null),
	('Poland', 'Warszawa',	'Ulica Strzelecka',				'33',	55),
	('Poland', 'Poznań',	'Aleja Solidarności',			'54',	66),
	('Poland', 'Łódź',		'Ulica Klasztorna',				'1',	null),
	('Poland', 'Kraków',	'Ulica Północna',				'18',	null),
	('Poland', 'Kraków',	'Ulica 3 Maja',					'4b',	3),
	('Poland', 'Wrocław',	'Ulica Browarna',				'56',	null),
	('Poland', 'Kraków',	'Ulica Floriańska',				'32',	23),
	('Poland', 'Poznań',	'Ulica Gliwicka',				'1',	null),
	('Poland', 'Wrocław',	'Ulica Grunwaldzka',			'3',	null),
	('Poland', 'Kraków',	'Ulica Wiejska',				'7',	6),
	('Poland', 'Gdańsk',	'Ulica Karola Olszewskiego',	'36',	8),
	('Poland', 'Łódź',		'Ulica Piekarska',				'22',	70)
GO

INSERT INTO Brand(Bra_Code, Bra_FullName, Bra_Country ) VALUES
	('Mercedes',	'Mercedes Benz',				'Germany'),
	('Renault',		'Renault',						'France'),
	('Chevrolet',	'Chevrolet',					'USA'),
	('Audi',		'Audi',							'Germany'),
	('BMW',			'Bayerische Motoren Werke',		'Germany'),
	('Cadillac',	'Cadillac Motor Car Division',	'USA'),
	('Opel',		'Opel Automobile GmbH',			'Germany'),
	('Bentley',		'Bentley Motors Limited',		'United Kingdom'),
	('Acura',		'Acura',						'Japan');
GO

INSERT INTO Client (Cli_FirstName, Cli_LastName, Cli_SerialNumberIDCard, Adr_Id) VALUES
	('Jan',			'Kowalski',		'KKE220477',	1),
	('Adam',		'Nowak',		'QUU993739',	2),
	('Janina',		'Kowalska',		'NPY895136',	3),
	('Przemysław',	'Świątek',		'LPW290371',	4),
	('Łukasz',		'Kocul',		'XUL306816',	5),
	('Sabin',		'Ptak',			'JBK260422',	6),
	('Ryszard',		'Petk',			'SCK266055',	7),
	('Anna',		'Nowak',		'RAH764272',	8);
GO

INSERT INTO Employee (Emp_FirstName, Emp_LastName, Emp_PESEL, Adr_Id) VALUES
	('Marian',		'Kamoń',		'85063077497',	9),
	('Agnieszka',	'Bieruń',		'88010923742',	10),
	('Alicja',		'Podłąka',		'98060228780',	11),
	('Krzysztof',	'Bielicki',		'69051537293',	12),
	('Zbiegniew',	'Tomasz',		'95062657257',	13),
	('Franiszek',	'Biały',		'79052921733',	14),
	('Alojzy',		'Szeryf',		'75040787415',	15),
	('Łukasz',		'Bielicki',		'84110359375',	16)
GO

INSERT INTO Model (Bra_Id, Mod_Code, Mod_Name, Mod_FuelType, Mod_EngineKW, Mod_Year, Mod_DriveType, Mod_BodyType, Mod_DoorsNumber)
SELECT 
	Bra_Id, 
	M.Mod_Code,
	M.Mod_Name,
	M.Mod_FuelType,
	M.Mod_EngineKW,
	M.Mod_Year,
	M.Mod_DriveType,
	M.Mod_BodyType, 
	M.Mod_DoorsNumber
FROM
(
	VALUES
		('Mercedes',	'MERGLE350D',		'GLE 350 d 4MATIC',													'Diesel',			200,	2018,	'All Wheel Drive',		'SUV',			5),
		('Acura',		'ILX4DR',			'4dr Sedan (2.0L 4cyl 5A)',											'Premium Unleaded',	110,	2019,	'Front Wheel Drive',	'Compact',		4),
		('Acura',		'ILX4DRP',			'Premium Package 4dr Sedan (2.0L 4cyl 5A)',							'Premium Unleaded',	110,	2019,	'Front Wheel Drive',	'Compact',		4),
		('Audi',		'A4',				'2.0T Prestige quattro 4dr Sedan AWD (2.0L 4cyl Turbo 8A)',			'Premium Unleaded',	162,	2019,	'All Wheel Drive',		'Sedan',		4),
		('Audi',		'A5',				'2.0T Premium Plus quattro 2dr Convertible AWD (2.0L 4cyl Turbo 8',	'Premium Unleaded',	162,	2019,	'All Wheel Drive',		'Convertible',	2),
		('Audi',		'A5',				'2.0T Premium Plus quattro 2dr Coupe AWD (2.0L 4cyl Turbo 6M)',		'Premium Unleaded',	162,	2019,	'All Wheel Drive',		'Coupe',		4),
		('Bentley',		'Continental GT',	'V8 S 2dr Coupe AWD (4.0L 8cyl Turbo 8A)',							'Premium Unleaded',	383,	2019,	'All Wheel Drive',		'Coupe',		4),
		('Bentley',		'Flying Spur',		'4dr Sedan AWD (4.0L 8cyl Turbo 8A)',								'Premium Unleaded',	368,	2019,	'All Wheel Drive',		'Sedan',		4),
		('BMW',			'M3',				'4dr Sedan (3.0L 6cyl Turbo 6M)',									'Premium Unleaded',	313,	2019,	'Rear Wheel Drive',		'Sedan',		4),
		('BMW',			'M4',				'2dr Convertible (3.0L 6cyl Turbo 6M)',								'Premium Unleaded',	313,	2019,	'Rear Wheel Drive',		'Convertible',	2),
		('BMW',			'X3',				'xDrive28d 4dr SUV AWD (2.0L 4cyl Turbodiesel 8A)',					'Diesel',			132,	2019,	'All Wheel Drive',		'SUV',			4),
		('Cadillac',	'CTS',				'Vsport Premium 4dr Sedan (3.6L 6cyl Turbo 8A)',					'Premium Unleaded',	309,	2019,	'Rear Wheel Drive',		'Sedan',		4),
		('Cadillac',	'CTS-V Coupe',		'2dr Coupe (6.2L 8cyl S/C 6M)',										'Premium Unleaded',	409,	2019,	'Rear Wheel Drive',		'Coupe',		4),
		('Chevrolet',	'Cruze',			'Diesel 4dr Sedan (2.0L 4cyl Turbodiesel 6A)',						'Diesel',			109,	2019,	'Front Wheel Drive',	'Sedan',		4)
) AS M(Bra_Code, Mod_Code, Mod_Name, Mod_FuelType, Mod_EngineKW, Mod_Year, Mod_DriveType, Mod_BodyType, Mod_DoorsNumber)
INNER JOIN Brand AS B ON B.Bra_Code = M.Bra_Code;
GO

INSERT INTO [HR].[Team] VALUES
	('Premium'),
	('Fast'),
	('Normal1'),
	('Normal2')
GO

INSERT INTO [HR].[EmployeeTeam]
SELECT 
	Emp_Id,
	m.Tem_Name
FROM
(
	VALUES 
		('85063077497','Fast'),
		('88010923742','Premium'),
		('98060228780','Normal1'),
		('69051537293','Normal1'),
		('95062657257','Normal2'),
		('95062657257','Fast'),
		('79052921733','Normal2'),
		('75040787415','Premium'),
		('84110359375','Fast')
) AS m(Emp_PESEL, Tem_Name)
INNER JOIN [dbo].[Employee] AS e ON e.Emp_PESEL = m.Emp_PESEL;
GO

INSERT INTO [HR].[Position] VALUES
	('Konsultant'),
	('Mechanik'),
	('Elektryk');
GO

INSERT INTO [HR].[EmployeePosition]
SELECT 
	Emp_Id,
	m.Pos_Position
FROM
(
	VALUES 
		('85063077497','Konsultant'),
		('88010923742','Konsultant'),
		('98060228780','Konsultant'),
		('69051537293','Mechanik'),
		('95062657257','Elektryk'),
		('95062657257','Mechanik'),
		('79052921733','Mechanik'),
		('75040787415','Elektryk'),
		('75040787415','Mechanik'),
		('84110359375','Elektryk')
) AS m(Emp_PESEL, Pos_Position)
INNER JOIN [dbo].[Employee] AS e ON e.Emp_PESEL = m.Emp_PESEL;
GO
INSERT INTO [HR].[Salary] (Emp_Id, Sal_Amount, Sal_Type, Sal_DateFrom, Sal_DateTo)
SELECT
	*
FROM 
(
	VALUES 
		('85063077497',3500),
		('88010923742',3700),
		('98060228780',3000),
		('69051537293',4500),
		('95062657257',3000),
		('79052921733',4200),
		('75040787415',4100),
		('84110359375',3900)
) AS m(Emp_PESEL, Sal_Amount, Sal_Type, Sal_DateFrom, Sal_DateTo)
INNER JOIN [dbo].[Employee] AS e ON e.Emp_PESEL = m.Emp_PESEL;