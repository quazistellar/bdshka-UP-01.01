CREATE DATABASE up_laba_5;

USE UP_laba_5;

CREATE TABLE VidGuitar(
	ID_VidGuitar INT PRIMARY KEY IDENTITY(1,1),
	NameOfVidGuitar VARCHAR(40) UNIQUE NOT NULL
);
GO

select * from VidGuitar
GO

INSERT INTO VidGuitar(NameOfVidGuitar) VALUES
('Электрогитара'),
('Классическая гитара'),
('Укулеле'),
('Бас-гитара'),
('Электроакустическая гитара');
GO

CREATE TABLE GuitarForm(
	ID_GuitarForm INT PRIMARY KEY IDENTITY(1,1),
	NameOfGuitarForm VARCHAR(40) UNIQUE NOT NULL
);
GO

select * from GuitarForm
GO

INSERT INTO GuitarForm(NameOfGuitarForm) VALUES
('SG'),
('Stratocaster'),
('Superstrat'),
('Star'),
('Telecaster'),
('Concert'),
('Dreadnought'),
('Triple-O');
GO

CREATE TABLE SoundConfiguration(
	ID_SoundConfiguration INT PRIMARY KEY IDENTITY(1,1),
	NameOfConfiguration VARCHAR(20) UNIQUE NOT NULL
);
GO

SELECT * FROM SoundConfiguration
GO

INSERT INTO SoundConfiguration(NameOfConfiguration) VALUES
('H-H'),
('S-S-S'),
('H-S-S'),
('S-S'),
('H-S');
GO

CREATE TABLE CountryOfMade(
	ID_CountryOfMade INT PRIMARY KEY IDENTITY(1,1),
	NameOfCountry VARCHAR(30) UNIQUE NOT NULL
);
GO

SELECT * FROM CountryOfMade

INSERT INTO CountryOfMade(NameOfCountry) VALUES
('Япония'),
('Китай'),
('Италия'),
('Россия'),
('Германия');
GO


CREATE TABLE AmountStrings(
	ID_AmountStrings INT PRIMARY KEY IDENTITY(1,1),
	AmountOfStrings VARCHAR(40) UNIQUE NOT NULL
);
GO

INSERT INTO AmountStrings(AmountOfStrings) VALUES
('Семиструнная'),
('Шестиструнная'),
('Четырехструнная'),
('Восьмиструнная'),
('Пятиструнная');
GO

SELECT * FROM AmountStrings
GO


CREATE TABLE RoleUser(
	ID_RoleUser INT PRIMARY KEY IDENTITY(1,1),
	NameRole VARCHAR(20) UNIQUE NOT NULL
);
GO

SELECT * FROM RoleUser
GO

INSERT INTO RoleUser(NameRole) VALUES 
('Администратор'),
('Сотрудник'),
('Пользователь');
GO


CREATE TABLE UserData(
	ID_UserData INT PRIMARY KEY IDENTITY(1,1),
	LoginUser VARCHAR(20) UNIQUE NOT NULL,
	PasswordUser VARCHAR(20) NOT NULL,
	RoleUser_ID int NOT NULL,
	FOREIGN KEY (RoleUser_ID) REFERENCES RoleUser(ID_RoleUser)
);
GO

SELECT * FROM UserData
GO


INSERT INTO UserData(LoginUser, PasswordUser, RoleUser_ID) VALUES 
('admin', 'admin', 1);
GO


INSERT INTO UserData(LoginUser, PasswordUser, RoleUser_ID) VALUES 
('kassa', 'kassa', 2);
GO

INSERT INTO UserData(LoginUser, PasswordUser, RoleUser_ID) VALUES 
('human1', '1234', 2),
('human2', '4321', 3),
('human3', '5678', 1)
GO

CREATE TABLE PositionsEmployees(
	ID_PositionsEmployees INT PRIMARY KEY IDENTITY(1,1),
	NameOfPositionEmployees VARCHAR(40) UNIQUE NOT NULL
);
GO

INSERT INTO PositionsEmployees (NameOfPositionEmployees)
VALUES
('Генеральный директор'),
('Менеджер по продажам'),
('Кассир'),
('Менеджер по закупкам'),
('Продавец-консультант');
GO

SELECT * FROM PositionsEmployees
GO

CREATE TABLE Employees(
	ID_Employees INT PRIMARY KEY IDENTITY(1,1),
	NameEmployee VARCHAR(30) NOT NULL,
	SurnameEmployee VARCHAR(40) NOT NULL,
	PatronymicEmployee VARCHAR(40) NULL,
	UserData_ID int UNIQUE NOT NULL,
	PositionsEmployees_ID int NOT NULL,
	FOREIGN KEY (PositionsEmployees_ID) REFERENCES PositionsEmployees(ID_PositionsEmployees),
	FOREIGN KEY (UserData_ID) REFERENCES UserData(ID_UserData)
);
GO

INSERT INTO Employees (NameEmployee, SurnameEmployee, PatronymicEmployee, UserData_ID, PositionsEmployees_ID)
VALUES
('Имя', 'Фамилия', 'Отчество', 1, 1);


SELECT * FROM Employees
GO


CREATE TABLE Clients(
	ID_Client INT PRIMARY KEY IDENTITY(1,1),
	NameClient VARCHAR(30) NOT NULL,
	SurnameClient VARCHAR(40) NOT NULL,
	PatronymicClient VARCHAR(40) NULL,
	UserData_ID int UNIQUE NOT NULL,
	FOREIGN KEY (UserData_ID) REFERENCES UserData(ID_UserData)
);
GO


select * from Clients

CREATE TABLE OrderStatus(
	ID_OrderStatus INT PRIMARY KEY IDENTITY(1,1),
	OrderStatus VARCHAR(30) UNIQUE NOT NULL
);
GO


CREATE TABLE Guitars(
	ID_Guitar INT PRIMARY KEY IDENTITY(1,1),
	NameGuitar VARCHAR(50) NOT NULL,
	PriceGuitar DECIMAL(10,2) NOT NULL,
	VidGuitar_ID int NOT NULL,
	GuitarForm_ID int NOT NULL,
	SoundConfiguration_ID int NOT NULL,
	CountryOfMade_ID int NOT NULL,
	AmountStrings_ID int NOT NULL,
	FOREIGN KEY (VidGuitar_ID) REFERENCES VidGuitar(ID_VidGuitar),
	FOREIGN KEY (GuitarForm_ID) REFERENCES GuitarForm(ID_GuitarForm),
	FOREIGN KEY (SoundConfiguration_ID) REFERENCES SoundConfiguration(ID_SoundConfiguration),
	FOREIGN KEY (CountryOfMade_ID) REFERENCES CountryOfMade(ID_CountryOfMade),
	FOREIGN KEY (AmountStrings_ID) REFERENCES AmountStrings(ID_AmountStrings),
	UNIQUE (NameGuitar, PriceGuitar, VidGuitar_ID, GuitarForm_ID, SoundConfiguration_ID, CountryOfMade_ID, AmountStrings_ID)
);
GO


INSERT INTO Guitars (NameGuitar, PriceGuitar, VidGuitar_ID, GuitarForm_ID, SoundConfiguration_ID, CountryOfMade_ID, AmountStrings_ID)
VALUES
('Gibson Special VE Cherry', 200000.00, 1, 1, 1, 7, 2);

select * from Guitars

select * from Orders

INSERT INTO Guitars (NameGuitar, PriceGuitar, VidGuitar_ID, GuitarForm_ID, SoundConfiguration_ID, CountryOfMade_ID, AmountStrings_ID)
VALUES
('Fender Squier Bullet Black', 18000.00, 1, 2, 3, 7, 2);


INSERT INTO Guitars (NameGuitar, PriceGuitar, VidGuitar_ID, GuitarForm_ID, SoundConfiguration_ID, CountryOfMade_ID, AmountStrings_ID)
VALUES
('Schecter SGR C-1 M RED', 29500.00, 1, 19, 1, 2, 2);


INSERT INTO Guitars (NameGuitar, PriceGuitar, VidGuitar_ID, GuitarForm_ID, SoundConfiguration_ID, CountryOfMade_ID, AmountStrings_ID)
VALUES
('Martinez Faw 702 B', 11500.00, 1, 20, 7, 2, 2);


INSERT INTO Guitars (NameGuitar, PriceGuitar, VidGuitar_ID, GuitarForm_ID, SoundConfiguration_ID, CountryOfMade_ID, AmountStrings_ID)
VALUES
('Martinez Faw 801', 10500.00, 1, 20, 7, 2, 2);

CREATE TABLE Orders(
	ID_Order INT PRIMARY KEY IDENTITY(1,1),
	AmountGuitars int NOT NULL,
	Guitar_ID int NOT NULL,
	Client_ID int NOT NULL,
	DateOfMadeOrder VARCHAR(10) NOT NULL,
	TotalPrice DECIMAL(10,2) NOT NULL,
	Employee_ID int NOT NULL,
	NumberOfOrder int NOT NULL,
	OrderStatus_ID int NOT NULL,
	FOREIGN KEY (Guitar_ID) REFERENCES Guitars(ID_Guitar),
	FOREIGN KEY (Client_ID) REFERENCES Clients(ID_Client),
	FOREIGN KEY (Employee_ID) REFERENCES Employees(ID_Employees),
	FOREIGN KEY (OrderStatus_ID) REFERENCES OrderStatus(ID_OrderStatus)
);
GO

INSERT INTO Orders (AmountGuitars, Guitar_ID, Client_ID, DateOfMadeOrder, TotalPrice, Employee_ID, NumberOfOrder, OrderStatus_ID)
VALUES 
(2, 1, 2, '12/11/2023', 45501.00, 7, 1, 1),
(1, 2, 39, '04/07/2023', 32301.00, 9, 2, 2),
(3, 3, 40, '05/08/2021', 23751.00, 15, 3, 1),
(1, 4, 41, '12/02/2024', 78201.00, 16, 4, 3),
(2, 5, 42, '11/05/2022', 32401.00, 27, 5, 2);
GO


CREATE PROCEDURE Backup_Guitars
AS
BEGIN
	DECLARE @BackupPath NVARCHAR(500);
	SET @BackupPath = 'C:\Users\Public\Documents\MS\BackupGuitarsUP' + '.bak';
	BACKUP DATABASE UP_laba_5 TO DISK = @BackupPath;
END;
GO

EXEC Backup_Guitars;



select * from Clients
select * from Employees
select * from UserData


CREATE TRIGGER CheckUniqueUserDataID_Employees
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Clients c ON i.UserData_ID = c.UserData_ID
    )
    BEGIN
        RAISERROR('Ошибка: Значение UserData_ID уже существует в таблице Clients!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO

CREATE TRIGGER CheckUniqueUserDataID_Clients
ON Clients
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Employees e ON i.UserData_ID = e.UserData_ID
    )
    BEGIN
        RAISERROR('Ошибка: Значение UserData_ID уже существует в таблице Employees!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO

SELECT 'Магазин гитар <Muztorg>' AS "Название магазина",
       'Кассовый чек №' + CAST(o.ID_Order AS NVARCHAR) AS "Чек",
       g.NameGuitar AS "Название гитары",
       TotalPrice AS "Цена"
FROM Orders o
JOIN Guitars g ON o.Guitar_ID = g.ID_Guitar
WHERE o.ID_Order = 7;


SELECT UserData.ID_UserData, UserData.LoginUser, UserData.PasswordUser, UserData.RoleUser_ID, RoleUser.NameRole, RoleUser.ID_RoleUser
FROM UserData
INNER JOIN RoleUser
ON UserData.RoleUser_ID = RoleUser.ID_RoleUser;


SELECT e.ID_Employees, e.NameEmployee, e.SurnameEmployee, e.PatronymicEmployee, e.UserData_ID, e.PositionsEmployees_ID,
       u.LoginUser, u.PasswordUser, u.RoleUser_ID, u.ID_UserData,
       p.NameOfPositionEmployees
FROM Employees AS e
INNER JOIN UserData AS u ON e.UserData_ID = u.ID_UserData
INNER JOIN PositionsEmployees AS p ON e.PositionsEmployees_ID = p.ID_PositionsEmployees;


SELECT c.ID_Client, c.NameClient, c.SurnameClient, c.PatronymicClient, c.UserData_ID,
       u.LoginUser, u.PasswordUser, u.RoleUser_ID, u.ID_UserData
FROM Clients c
JOIN UserData u ON c.UserData_ID = u.ID_UserData
JOIN RoleUser r ON u.RoleUser_ID = r.ID_RoleUser;


SELECT g.ID_Guitar, g.NameGuitar, g.PriceGuitar, g.SoundConfiguration_ID, g.VidGuitar_ID, g.AmountStrings_ID, g.CountryOfMade_ID, g.GuitarForm_ID,
       vg.NameOfVidGuitar, gf.NameOfGuitarForm, sc.NameOfConfiguration, vg.ID_VidGuitar, gf.ID_GuitarForm, sc.ID_SoundConfiguration,
       cm.NameOfCountry, ast.AmountOfStrings, cm.ID_CountryOfMade, ast.ID_AmountStrings
FROM Guitars g
JOIN VidGuitar vg ON g.VidGuitar_ID = vg.ID_VidGuitar
JOIN GuitarForm gf ON g.GuitarForm_ID = gf.ID_GuitarForm
JOIN SoundConfiguration sc ON g.SoundConfiguration_ID = sc.ID_SoundConfiguration
JOIN CountryOfMade cm ON g.CountryOfMade_ID = cm.ID_CountryOfMade
JOIN AmountStrings ast ON g.AmountStrings_ID = ast.ID_AmountStrings;


SELECT o.ID_Order, o.AmountGuitars, o.Guitar_ID, o.Client_ID, 
       o.DateOfMadeOrder, o.TotalPrice, o.Employee_ID, o.NumberOfOrder,
       o.OrderStatus_ID, g.ID_Guitar, g.AmountStrings_ID, g.CountryOfMade_ID, g.GuitarForm_ID, g.PriceGuitar, g.SoundConfiguration_ID, g.VidGuitar_ID, g.NameGuitar, c.NameClient, c.ID_Client,
	   c.PatronymicClient, c.SurnameClient, c.UserData_ID, e.NameEmployee, e.ID_Employees, e.PatronymicEmployee, e.PositionsEmployees_ID, e.SurnameEmployee, e.UserData_ID,
       os.OrderStatus, os.ID_OrderStatus
FROM Orders o
JOIN Guitars g ON o.Guitar_ID = g.ID_Guitar
JOIN Clients c ON o.Client_ID = c.ID_Client
JOIN Employees e ON o.Employee_ID = e.ID_Employees
JOIN OrderStatus os ON o.OrderStatus_ID = os.ID_OrderStatus;