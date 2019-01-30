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

INSERT INTO Employee (Emp_FirstName, Emp_LastName, Emp_PESEL, Emp_EmploymentDate, Adr_Id) VALUES
	('Marian',		'Kamoń',		'85063077497',	'2018-01-5', 9),
	('Agnieszka',	'Bieruń',		'88010923742',	'2018-01-5', 10),
	('Alicja',		'Podłąka',		'98060228780',	'2018-07-1', 11),
	('Krzysztof',	'Bielicki',		'69051537293',	'2018-06-1', 12),
	('Zbiegniew',	'Tomasz',		'95062657257',	'2018-08-1', 13),
	('Franiszek',	'Biały',		'79052921733',	'2018-01-5', 14),
	('Alojzy',		'Szeryf',		'75040787415',	'2018-01-5', 15),
	('Łukasz',		'Bielicki',		'84110359375',	'2018-01-5', 16)
GO

INSERT INTO Model (Bra_Id, Mod_Code, Mod_Name, Mod_FuelType, Mod_EngineKW, Mod_Year, Mod_DriveType, Mod_BodyType, Mod_DoorsNumber)
SELECT 
	B.Bra_Id, 
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
		('Audi',		'A4_20TURBO',		'2.0T Prestige quattro 4dr Sedan AWD (2.0L 4cyl Turbo 8A)',			'Premium Unleaded',	162,	2019,	'All Wheel Drive',		'Sedan',		4),
		('Audi',		'A5_20TURBO',		'2.0T Premium Plus quattro 2dr Coupe AWD (2.0L 4cyl Turbo 6M)',		'Premium Unleaded',	162,	2019,	'All Wheel Drive',		'Coupe',		4),
		('Bentley',		'Continenta',		'V8 S 2dr Coupe AWD (4.0L 8cyl Turbo 8A)',							'Premium Unleaded',	383,	2019,	'All Wheel Drive',		'Coupe',		4),
		('Bentley',		'FlyingSpur',		'4dr Sedan AWD (4.0L 8cyl Turbo 8A)',								'Premium Unleaded',	368,	2019,	'All Wheel Drive',		'Sedan',		4),
		('BMW',			'M3_4DR',			'4dr Sedan (3.0L 6cyl Turbo 6M)',									'Premium Unleaded',	313,	2019,	'Rear Wheel Drive',		'Sedan',		4),
		('BMW',			'M4_2DR',			'2dr Convertible (3.0L 6cyl Turbo 6M)',								'Premium Unleaded',	313,	2019,	'Rear Wheel Drive',		'Convertible',	2),
		('BMW',			'X3_4DR',			'xDrive28d 4dr SUV AWD (2.0L 4cyl Turbodiesel 8A)',					'Diesel',			132,	2019,	'All Wheel Drive',		'SUV',			4),
		('Cadillac',	'CTS',				'Vsport Premium 4dr Sedan (3.6L 6cyl Turbo 8A)',					'Premium Unleaded',	309,	2019,	'Rear Wheel Drive',		'Sedan',		4),
		('Cadillac',	'CTS-VCoupe',		'2dr Coupe (6.2L 8cyl S/C 6M)',										'Premium Unleaded',	409,	2019,	'Rear Wheel Drive',		'Coupe',		4),
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
	e.Emp_Id,
	m.Tem_Name
FROM
(
	VALUES 
		('85063077497',	'Fast'),
		('88010923742',	'Premium'),
		('98060228780',	'Normal1'),
		('69051537293',	'Normal1'),
		('95062657257',	'Normal2'),
		('95062657257',	'Fast'),
		('79052921733',	'Normal2'),
		('75040787415',	'Premium'),
		('84110359375',	'Fast')
) AS m(Emp_PESEL, Tem_Name)
INNER JOIN [dbo].[Employee] AS e ON e.Emp_PESEL = m.Emp_PESEL;
GO

INSERT INTO [HR].[Position] VALUES
	('Konsultant'),
	('Mechanik'),
	('Elektryk');
GO

INSERT INTO [HR].[EmployeePosition] (Emp_Id, Pos_Position, Eps_DateFrom, Eps_DateTo)
SELECT 
	e.Emp_Id,
	m.Pos_Position,
	m.Eps_DateFrom,
	m.Eps_DateTo
FROM
(
	VALUES 
		('85063077497',	'Konsultant',	'2018-01-5', null),
		('88010923742',	'Konsultant',	'2018-01-5', null),
		('98060228780',	'Konsultant',	'2018-07-1', null),
		('69051537293',	'Mechanik',		'2018-06-1', null),
		('95062657257',	'Elektryk',		'2018-08-1', '2018-10-31'),
		('95062657257',	'Mechanik',		'2018-11-1', null),
		('79052921733',	'Mechanik',		'2018-01-5', null),
		('75040787415',	'Elektryk',		'2018-01-5', '2018-11-30'),
		('75040787415',	'Mechanik',		'2018-12-1', null),
		('84110359375',	'Elektryk',		'2018-01-5', null)
) AS m(Emp_PESEL, Pos_Position, Eps_DateFrom, Eps_DateTo)
INNER JOIN [dbo].[Employee] AS e ON e.Emp_PESEL = m.Emp_PESEL;
GO

INSERT INTO [HR].[Paycheck] (Emp_Id, Pay_Amount, Pay_DateFrom, Pay_DateTo)
SELECT
	e.Emp_Id, 
	m.Sal_Amount, 
	m.Sal_DateFrom, 
	m.Sal_DateTo
FROM 
(
	VALUES 
		('85063077497',	3500,	'2018-01-5',	null),
		('88010923742',	3700,	'2018-01-5',	null),
		('98060228780',	3000,	'2018-07-1',	'2019-01-31'),
		('69051537293',	4500,	'2018-06-1',	null),
		('95062657257',	3000,	'2018-08-1',	null),
		('79052921733',	4200,	'2018-01-5',	null),
		('75040787415',	4100,	'2018-01-5',	null),
		('84110359375',	3900,	'2018-01-5',	null),
		('98060228780',	3300,	'2018-02-1',	null)
) AS m(Emp_PESEL, Sal_Amount, Sal_DateFrom, Sal_DateTo)
INNER JOIN [dbo].[Employee] AS e ON e.Emp_PESEL = m.Emp_PESEL;
GO

DECLARE @date AS DATE = '20180110';	
DECLARE @empId AS INT = 0;
DECLARE @prem AS TABLE (Emp_Id INT);
WHILE @date <= GETDATE()
BEGIN
	INSERT INTO [HR].[Salary] (Emp_Id, Sal_Amount, Sal_Date, Sal_Type)
	SELECT
		e.Emp_Id, 
		p.Pay_Amount, 
		@date, 
		'Pensja'
	FROM 
		[HR].[Paycheck] AS p 
	INNER JOIN 
		[dbo].[Employee] AS e ON e.Emp_Id = p.Emp_Id
	WHERE	p.Pay_DateFrom <= @date AND
		   (p.Pay_DateTo > @date OR p.Pay_DateTo is null)

	DECLARE @empCount AS INT = (	SELECT COUNT(*) FROM [dbo].[Employee] AS e
									WHERE	 e.Emp_EmploymentDate <= @date )

	WHILE (SELECT COUNT(*) FROM @prem) < FLOOR(@empCount/4)
	BEGIN
		SET @empId = FLOOR(RAND()*(10));
		IF NOT EXISTS (SELECT * FROM @prem WHERE Emp_Id = @empId)
		BEGIN
			INSERT INTO @prem VALUES (@empId)
		END
	END

	INSERT INTO [HR].[Salary] (Emp_Id, Sal_Amount, Sal_Date, Sal_Type)
	SELECT
		e.Emp_Id, 
		FLOOR(RAND()*(30-10)+10)*10, -- 100-300
		@date, 
		'PREMIA'
	FROM 
		[dbo].[Employee] AS e
	WHERE e.Emp_Id IN 
		(
			SELECT * FROM @prem
		)

	SET @date = DATEADD(month, 1, @date);
END
GO

INSERT INTO [Service].[Status] VALUES
	('Przyjeto'),
	('W trakcie'),
	('Zakonczono'),
	('Odebrano');
GO

INSERT INTO [Service].[Service] (Ser_ShortName, Ser_Name) VALUES
	('Lampa',			'Wymiana lampy'),
	('Silnik',			'Wymiana silnika'),
	('Olej',			'Wymiana oleju'),
	('Przeglad',		'Przegląd samochodu'),
	('Lakierowanie',	'Lakierowanie nadwozia'),
	('Bledy',			'Kasowanie błędów komputera'),
	('Opony',			'Wymiana opon'),
	('Klocki',			'Wymiana klocków hamulcowych'),
	('Tarcze',			'Wymiana tarcz hamulcowych'),
	('RSilnika',		'Remont silnika'),
	('Klimatyzacja',	'Naprawa klimatyzacji');
GO