﻿/*
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

insert into Brand(Bra_Code, Bra_FullName, Bra_Country ) VALUES
('Mer', 'Mercedes Benz', 'Germany'),
('Ren', 'Renault', 'France'),
('Jee', 'Jeep', 'USA')