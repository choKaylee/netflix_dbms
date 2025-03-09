CREATE TABLE Subscription_Plan (
    Subscription_Id INT PRIMARY KEY NOT NULL,
    Customer_Id INT NOT NULL,
    Plan_Type VARCHAR(50) NOT NULL,
    Plan_Expiration_Date DATE NOT NULL
);

INSERT INTO Subscription_Plan (Subscription_Id, Customer_Id, Plan_Type, Plan_Expiration_Date)
VALUES
(1, 1, 'Basic', '2024-10-17'),
(2, 2, 'Premium', '2024-09-01'),
(3, 3, 'Basic', '2024-11-21'),
(4, 4, 'Standard', '2024-12-05'),
(5, 5, 'Premium', '2025-01-10'),
(6, 6, 'Standard', '2025-02-12'),
(7, 7, 'Basic', '2024-08-15'),
(8, 8, 'Premium', '2024-07-19'),
(9, 9, 'Standard', '2025-03-20'),
(10, 10, 'Basic', '2025-04-01'),
(11, 11, 'Premium', '2024-05-16'),
(12, 12, 'Basic', '2024-06-25'),
(13, 13, 'Standard', '2025-07-12'),
(14, 14, 'Premium', '2025-08-21'),
(15, 15, 'Basic', '2025-09-29'),
(16, 16, 'Standard', '2024-10-07'),
(17, 17, 'Premium', '2025-11-02'),
(18, 18, 'Basic', '2025-12-11'),
(19, 19, 'Standard', '2024-01-03'),
(20, 20, 'Premium', '2024-02-14'),
(21, 21, 'Basic', '2024-03-20'),
(22, 22, 'Standard', '2025-04-27'),
(23, 23, 'Premium', '2025-05-31'),
(24, 24, 'Basic', '2024-06-19'),
(25, 25, 'Standard', '2025-07-23'),
(26, 26, 'Premium', '2024-08-27'),
(27, 27, 'Basic', '2025-09-09'),
(28, 28, 'Standard', '2024-10-14'),
(29, 29, 'Premium', '2024-11-29'),
(30, 30, 'Basic', '2025-12-19'),
(31, 31, 'Standard', '2024-01-01'),
(32, 32, 'Premium', '2025-02-10'),
(33, 33, 'Basic', '2025-03-15'),
(34, 34, 'Standard', '2024-04-17'),
(35, 35, 'Premium', '2025-05-25'),
(36, 36, 'Basic', '2025-06-30'),
(37, 37, 'Standard', '2024-07-11'),
(38, 38, 'Premium', '2025-08-19'),
(39, 39, 'Basic', '2025-09-24'),
(40, 40, 'Standard', '2024-10-05'),
(41, 41, 'Premium', '2025-11-13'),
(42, 42, 'Basic', '2025-12-22'),
(43, 43, 'Standard', '2024-01-09'),
(44, 44, 'Premium', '2025-02-21'),
(45, 45, 'Basic', '2024-03-27'),
(46, 46, 'Standard', '2025-04-10'),
(47, 47, 'Premium', '2025-05-15'),
(48, 48, 'Basic', '2024-06-29'),
(49, 49, 'Standard', '2025-07-18'),
(50, 50, 'Premium', '2024-08-22'),
(51, 51, 'Basic', '2025-09-30'),
(52, 52, 'Standard', '2024-10-08'),
(53, 53, 'Premium', '2025-11-03'),
(54, 54, 'Basic', '2025-12-12'),
(55, 55, 'Standard', '2024-01-04'),
(56, 56, 'Premium', '2025-02-15'),
(57, 57, 'Basic', '2025-03-21'),
(58, 58, 'Standard', '2024-04-29'),
(59, 59, 'Premium', '2025-05-30'),
(60, 60, 'Basic', '2024-06-18'),
(61, 61, 'Standard', '2025-07-22'),
(62, 62, 'Premium', '2024-08-26'),
(63, 63, 'Basic', '2025-09-08'),
(64, 64, 'Standard', '2024-10-13'),
(65, 65, 'Premium', '2024-11-28'),
(66, 66, 'Basic', '2025-12-18'),
(67, 67, 'Standard', '2024-01-02'),
(68, 68, 'Premium', '2025-02-09'),
(69, 69, 'Basic', '2025-03-14'),
(70, 70, 'Standard', '2024-04-16'),
(71, 71, 'Premium', '2025-05-24'),
(72, 72, 'Basic', '2025-06-29'),
(73, 73, 'Standard', '2024-07-10'),
(74, 74, 'Premium', '2025-08-18'),
(75, 75, 'Basic', '2025-09-23'),
(76, 76, 'Standard', '2024-10-04'),
(77, 77, 'Premium', '2025-11-12'),
(78, 78, 'Basic', '2025-12-21'),
(79, 79, 'Standard', '2024-01-08'),
(80, 80, 'Premium', '2025-02-20'),
(81, 81, 'Basic', '2024-03-26'),
(82, 82, 'Standard', '2025-04-09'),
(83, 83, 'Premium', '2025-05-14'),
(84, 84, 'Basic', '2024-06-28'),
(85, 85, 'Standard', '2025-07-17'),
(86, 86, 'Premium', '2024-08-25'),
(87, 87, 'Basic', '2025-09-07'),
(88, 88, 'Standard', '2024-10-12'),
(89, 89, 'Premium', '2024-11-27'),
(90, 90, 'Basic', '2025-12-17'),
(91, 91, 'Standard', '2024-01-06'),
(92, 92, 'Premium', '2025-02-19'),
(93, 93, 'Basic', '2025-03-13'),
(94, 94, 'Standard', '2024-04-15'),
(95, 95, 'Premium', '2025-05-23'),
(96, 96, 'Basic', '2025-06-28'),
(97, 97, 'Standard', '2024-07-09'),
(98, 98, 'Premium', '2025-08-17'),
(99, 99, 'Basic', '2025-09-22'),
(100, 100, 'Standard', '2024-10-03');

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY NOT NULL,
    Subscription_Id INT NOT NULL,
    Customer_First_Name VARCHAR(50) NOT NULL,
    Customer_Last_Name VARCHAR(50) NOT NULL,
    Customer_Email VARCHAR(100) NOT NULL,
    Customer_Username VARCHAR(50) NOT NULL,
    Customer_Password VARCHAR(50) NOT NULL
);
INSERT INTO Customer (Customer_Id, Subscription_Id, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Username, Customer_Password)
VALUES
(1, 1, 'John', 'Doe', 'john.doe1@example.com', 'johndoe1', 'password123'),
(2, 2, 'Jane', 'Smith', 'jane.smith2@example.com', 'janesmith2', 'password456'),
(3, 3, 'Emily', 'Johnson', 'emily.johnson3@example.com', 'emilyjohnson3', 'password789'),
(4, 4, 'Michael', 'Williams', 'michael.williams4@example.com', 'michaelw4', 'password101'),
(5, 5, 'Sarah', 'Brown', 'sarah.brown5@example.com', 'sarahb5', 'password102'),
(6, 6, 'Chris', 'Taylor', 'chris.taylor6@example.com', 'christaylor6', 'password103'),
(7, 7, 'Anna', 'Moore', 'anna.moore7@example.com', 'annamoore7', 'password104'),
(8, 8, 'Mark', 'Lee', 'mark.lee8@example.com', 'marklee8', 'password105'),
(9, 9, 'David', 'Walker', 'david.walker9@example.com', 'davidwalker9', 'password106'),
(10, 10, 'Sophia', 'Hall', 'sophia.hall10@example.com', 'sophiahall10', 'password107'),
(11, 11, 'Daniel', 'Allen', 'daniel.allen11@example.com', 'danielallen11', 'password108'),
(12, 12, 'Olivia', 'Young', 'olivia.young12@example.com', 'oliviayoung12', 'password109'),
(13, 13, 'James', 'Hernandez', 'james.hernandez13@example.com', 'jameshernandez13', 'password110'),
(14, 14, 'Lucas', 'King', 'lucas.king14@example.com', 'lucasking14', 'password111'),
(15, 15, 'Lily', 'Wright', 'lily.wright15@example.com', 'lilywright15', 'password112'),
(16, 16, 'Henry', 'Lopez', 'henry.lopez16@example.com', 'henrylopez16', 'password113'),
(17, 17, 'Ella', 'Hill', 'ella.hill17@example.com', 'ellahill17', 'password114'),
(18, 18, 'Alexander', 'Scott', 'alexander.scott18@example.com', 'alexanderscott18', 'password115'),
(19, 19, 'Amelia', 'Green', 'amelia.green19@example.com', 'ameliagreen19', 'password116'),
(20, 20, 'Jack', 'Adams', 'jack.adams20@example.com', 'jackadams20', 'password117'),
(21, 21, 'Ava', 'Nelson', 'ava.nelson21@example.com', 'avanelson21', 'password118'),
(22, 22, 'Logan', 'Baker', 'logan.baker22@example.com', 'loganbaker22', 'password119'),
(23, 23, 'Mia', 'Carter', 'mia.carter23@example.com', 'miacarter23', 'password120'),
(24, 24, 'Benjamin', 'Mitchell', 'benjamin.mitchell24@example.com', 'benjaminmitchell24', 'password121'),
(25, 25, 'Grace', 'Perez', 'grace.perez25@example.com', 'graceperez25', 'password122'),
(26, 26, 'Lucas', 'Roberts', 'lucas.roberts26@example.com', 'lucasroberts26', 'password123'),
(27, 27, 'Chloe', 'Turner', 'chloe.turner27@example.com', 'chloeturner27', 'password124'),
(28, 28, 'Owen', 'Phillips', 'owen.phillips28@example.com', 'owenphillips28', 'password125'),
(29, 29, 'Harper', 'Campbell', 'harper.campbell29@example.com', 'harpercampbell29', 'password126'),
(30, 30, 'Jacob', 'Parker', 'jacob.parker30@example.com', 'jacobparker30', 'password127'),
(31, 31, 'Ella', 'Evans', 'ella.evans31@example.com', 'ellaevans31', 'password128'),
(32, 32, 'Liam', 'Edwards', 'liam.edwards32@example.com', 'liamedwards32', 'password129'),
(33, 33, 'Abigail', 'Collins', 'abigail.collins33@example.com', 'abigailcollins33', 'password130'),
(34, 34, 'Samuel', 'Stewart', 'samuel.stewart34@example.com', 'samuelstewart34', 'password131'),
(35, 35, 'Victoria', 'Sanchez', 'victoria.sanchez35@example.com', 'victoriasanchez35', 'password132'),
(36, 36, 'Ethan', 'Morris', 'ethan.morris36@example.com', 'ethanmorris36', 'password133'),
(37, 37, 'Sofia', 'Rogers', 'sofia.rogers37@example.com', 'sofiarogers37', 'password134'),
(38, 38, 'Mason', 'Reed', 'mason.reed38@example.com', 'masonreed38', 'password135'),
(39, 39, 'Charlotte', 'Cook', 'charlotte.cook39@example.com', 'charlottecook39', 'password136'),
(40, 40, 'Elijah', 'Morgan', 'elijah.morgan40@example.com', 'elijahmorgan40', 'password137'),
(41, 41, 'Zoe', 'Bell', 'zoe.bell41@example.com', 'zoebell41', 'password138'),
(42, 42, 'William', 'Murphy', 'william.murphy42@example.com', 'williammurphy42', 'password139'),
(43, 43, 'Madison', 'Bailey', 'madison.bailey43@example.com', 'madisonbailey43', 'password140'),
(44, 44, 'James', 'Rivera', 'james.rivera44@example.com', 'jamesrivera44', 'password141'),
(45, 45, 'Isabella', 'Cooper', 'isabella.cooper45@example.com', 'isabellacooper45', 'password142'),
(46, 46, 'Aiden', 'Richardson', 'aiden.richardson46@example.com', 'aidenrichardson46', 'password143'),
(47, 47, 'Samantha', 'Cox', 'samantha.cox47@example.com', 'samanthacox47', 'password144'),
(48, 48, 'Matthew', 'Ward', 'matthew.ward48@example.com', 'matthewward48', 'password145'),
(49, 49, 'Avery', 'Gray', 'avery.gray49@example.com', 'averygray49', 'password146'),
(50, 50, 'Joseph', 'Hughes', 'joseph.hughes50@example.com', 'josephhughes50', 'password147'),
(51, 51, 'Hannah', 'Watson', 'hannah.watson51@example.com', 'hannahwatson51', 'password148'),
(52, 52, 'Lucas', 'Brooks', 'lucas.brooks52@example.com', 'lucasbrooks52', 'password149'),
(53, 53, 'Ava', 'Kelly', 'ava.kelly53@example.com', 'avakelly53', 'password150'),
(54, 54, 'Jackson', 'Howard', 'jackson.howard54@example.com', 'jacksonhoward54', 'password151'),
(55, 55, 'Emma', 'Ramirez', 'emma.ramirez55@example.com', 'emmaramirez55', 'password152'),
(56, 56, 'Mason', 'Ward', 'mason.ward56@example.com', 'masonward56', 'password153'),
(57, 57, 'Olivia', 'Peterson', 'olivia.peterson57@example.com', 'oliviapeterson57', 'password154'),
(58, 58, 'Jayden', 'Anderson', 'jayden.anderson58@example.com', 'jaydenanderson58', 'password155'),
(59, 59, 'Sophia', 'Hernandez', 'sophia.hernandez59@example.com', 'sophiahernandez59', 'password156'),
(60, 60, 'Jackson', 'Martinez', 'jackson.martinez60@example.com', 'jacksonmartinez60', 'password157'),
(61, 61, 'Chloe', 'Brown', 'chloe.brown61@example.com', 'chloebrown61', 'password158'),
(62, 62, 'Ella', 'Miller', 'ella.miller62@example.com', 'ellamiller62', 'password159'),
(63, 63, 'Michael', 'Wilson', 'michael.wilson63@example.com', 'michaelwilson63', 'password160'),
(64, 64, 'Zoe', 'Moore', 'zoe.moore64@example.com', 'zoemoore64', 'password161'),
(65, 65, 'Daniel', 'Taylor', 'daniel.taylor65@example.com', 'danieltaylor65', 'password162'),
(66, 66, 'Sofia', 'Harris', 'sofia.harris66@example.com', 'sofiaharris66', 'password163'),
(67, 67, 'Noah', 'Martin', 'noah.martin67@example.com', 'noahmartin67', 'password164'),
(68, 68, 'Grace', 'White', 'grace.white68@example.com', 'gracewhite68', 'password165'),
(69, 69, 'Lily', 'Thompson', 'lily.thompson69@example.com', 'lilythompson69', 'password166'),
(70, 70, 'Aiden', 'Garcia', 'aiden.garcia70@example.com', 'aidengarcia70', 'password167'),
(71, 71, 'Amelia', 'Clark', 'amelia.clark71@example.com', 'ameliacark71', 'password168'),
(72, 72, 'David', 'Rodriguez', 'david.rodriguez72@example.com', 'davidrodriguez72', 'password169'),
(73, 73, 'Scarlett', 'Lewis', 'scarlett.lewis73@example.com', 'scarlettlewis73', 'password170'),
(74, 74, 'Mia', 'Lee', 'mia.lee74@example.com', 'mialee74', 'password171'),
(75, 75, 'Elijah', 'Walker', 'elijah.walker75@example.com', 'elijahwalker75', 'password172'),
(76, 76, 'Abigail', 'Young', 'abigail.young76@example.com', 'abigailyoung76', 'password173'),
(77, 77, 'Logan', 'Allen', 'logan.allen77@example.com', 'loganallen77', 'password174'),
(78, 78, 'Lily', 'King', 'lily.king78@example.com', 'lilyking78', 'password175'),
(79, 79, 'Lucas', 'Wright', 'lucas.wright79@example.com', 'lucaswright79', 'password176'),
(80, 80, 'Benjamin', 'Scott', 'benjamin.scott80@example.com', 'benjaminscott80', 'password177'),
(81, 81, 'Ava', 'Green', 'ava.green81@example.com', 'avagreen81', 'password178'),
(82, 82, 'Oliver', 'Baker', 'oliver.baker82@example.com', 'oliverbaker82', 'password179'),
(83, 83, 'Sophia', 'Adams', 'sophia.adams83@example.com', 'sophiaadams83', 'password180'),
(84, 84, 'Mason', 'Nelson', 'mason.nelson84@example.com', 'masonnelson84', 'password181'),
(85, 85, 'Ella', 'Carter', 'ella.carter85@example.com', 'ellacarter85', 'password182'),
(86, 86, 'William', 'Collins', 'william.collins86@example.com', 'williamcollins86', 'password183'),
(87, 87, 'Hannah', 'Mitchell', 'hannah.mitchell87@example.com', 'hannahmitchell87', 'password184'),
(88, 88, 'Noah', 'Perez', 'noah.perez88@example.com', 'noahperez88', 'password185'),
(89, 89, 'Chloe', 'Roberts', 'chloe.roberts89@example.com', 'chloeroberts89', 'password186'),
(90, 90, 'Ethan', 'Turner', 'ethan.turner90@example.com', 'ethanturner90', 'password187'),
(91, 91, 'Emily', 'Phillips', 'emily.phillips91@example.com', 'emilyphillips91', 'password188'),
(92, 92, 'Liam', 'Campbell', 'liam.campbell92@example.com', 'liamcampbell92', 'password189'),
(93, 93, 'Charlotte', 'Parker', 'charlotte.parker93@example.com', 'charlotteparker93', 'password190'),
(94, 94, 'Grace', 'Evans', 'grace.evans94@example.com', 'graceevans94', 'password191'),
(95, 95, 'Benjamin', 'Edwards', 'benjamin.edwards95@example.com', 'benjaminedwards95', 'password192'),
(96, 96, 'Sofia', 'Collins', 'sofia.collins96@example.com', 'sofiacollins96', 'password193'),
(97, 97, 'Oliver', 'Stewart', 'oliver.stewart97@example.com', 'oliverstewart97', 'password194'),
(98, 98, 'Harper', 'Sanchez', 'harper.sanchez98@example.com', 'harpersanchez98', 'password195'),
(99, 99, 'Ella', 'Morris', 'ella.morris99@example.com', 'ellamorris99', 'password196'),
(100, 100, 'Lucas', 'Rogers', 'lucas.rogers100@example.com', 'lucasrogers100', 'password197');


CREATE TABLE Content (
    Content_Id INT PRIMARY KEY NOT NULL,
    Content_Maturity VARCHAR(20) NOT NULL,
    Content_Expiration DATE NOT NULL,
    Content_Rating DECIMAL(3,2) NOT NULL,
    Content_Air_Date DATE NOT NULL,
    Content_Genre VARCHAR(50) NOT NULL
);

INSERT INTO Content (Content_Id, Content_Maturity, Content_Expiration, Content_Rating, Content_Air_Date, Content_Genre)
VALUES
(1, 'PG', '2025-12-31', 8.5, '2023-01-10', 'Action'),
(2, 'R', '2025-11-30', 7.8, '2022-05-15', 'Drama'),
(3, 'PG-13', '2025-10-15', 9.1, '2021-12-01', 'Comedy'),
(4, 'G', '2025-09-25', 6.5, '2023-06-07', 'Animation'),
(5, 'PG', '2025-08-20', 7.2, '2022-09-14', 'Adventure'),
(6, 'R', '2025-07-30', 6.9, '2021-07-22', 'Thriller'),
(7, 'PG-13', '2025-06-15', 8.0, '2020-11-30', 'Sci-Fi'),
(8, 'G', '2025-05-10', 9.5, '2019-04-21', 'Fantasy'),
(9, 'PG', '2025-04-25', 7.0, '2023-03-10', 'Mystery'),
(10, 'R', '2025-03-01', 6.8, '2022-08-09', 'Horror'),
(11, 'PG-13', '2025-02-20', 8.3, '2021-10-15', 'Action'),
(12, 'G', '2025-01-10', 6.2, '2020-12-05', 'Documentary'),
(13, 'PG', '2024-12-31', 9.0, '2023-01-18', 'Biography'),
(14, 'R', '2024-11-30', 7.6, '2022-02-19', 'Crime'),
(15, 'PG-13', '2024-10-15', 8.7, '2021-06-01', 'Drama'),
(16, 'G', '2024-09-25', 5.9, '2020-07-04', 'Romance'),
(17, 'PG', '2024-08-20', 8.1, '2021-09-10', 'Comedy'),
(18, 'R', '2024-07-30', 7.3, '2022-11-14', 'Thriller'),
(19, 'PG-13', '2024-06-15', 8.9, '2020-01-30', 'Action'),
(20, 'G', '2024-05-10', 6.1, '2019-08-20', 'Animation'),
(21, 'PG', '2024-04-25', 7.9, '2022-03-13', 'Adventure'),
(22, 'R', '2024-03-01', 6.7, '2023-07-12', 'Horror'),
(23, 'PG-13', '2024-02-20', 8.4, '2021-10-09', 'Sci-Fi'),
(24, 'G', '2024-01-10', 5.8, '2020-05-19', 'Documentary'),
(25, 'PG', '2023-12-31', 7.5, '2022-01-10', 'Mystery'),
(26, 'R', '2023-11-30', 8.2, '2020-11-04', 'Crime'),
(27, 'PG-13', '2023-10-15', 9.3, '2021-03-22', 'Biography'),
(28, 'G', '2023-09-25', 6.6, '2022-09-01', 'Drama'),
(29, 'PG', '2023-08-20', 7.7, '2021-06-14', 'Action'),
(30, 'R', '2023-07-30', 8.0, '2020-08-09', 'Thriller'),
(31, 'PG-13', '2023-06-15', 6.4, '2022-07-21', 'Fantasy'),
(32, 'G', '2023-05-10', 9.7, '2023-03-14', 'Adventure'),
(33, 'PG', '2023-04-25', 7.4, '2021-11-17', 'Animation'),
(34, 'R', '2023-03-01', 6.9, '2022-12-23', 'Horror'),
(35, 'PG-13', '2023-02-20', 8.6, '2021-10-12', 'Comedy'),
(36, 'G', '2023-01-10', 7.1, '2022-04-25', 'Romance'),
(37, 'PG', '2022-12-31', 7.3, '2021-02-18', 'Biography'),
(38, 'R', '2022-11-30', 6.8, '2020-12-08', 'Thriller'),
(39, 'PG-13', '2022-10-15', 9.4, '2019-07-03', 'Sci-Fi'),
(40, 'G', '2022-09-25', 8.1, '2021-01-12', 'Crime'),
(41, 'PG', '2022-08-20', 6.7, '2020-09-14', 'Adventure'),
(42, 'R', '2022-07-30', 8.8, '2023-05-15', 'Action'),
(43, 'PG-13', '2022-06-15', 9.6, '2022-03-11', 'Fantasy'),
(44, 'G', '2022-05-10', 7.0, '2021-07-30', 'Drama'),
(45, 'PG', '2022-04-25', 6.4, '2020-12-22', 'Mystery'),
(46, 'R', '2022-03-01', 8.5, '2022-02-02', 'Comedy'),
(47, 'PG-13', '2022-02-20', 7.2, '2021-11-20', 'Crime'),
(48, 'G', '2022-01-10', 6.6, '2020-06-30', 'Documentary'),
(49, 'PG', '2021-12-31', 7.8, '2019-04-18', 'Adventure'),
(50, 'R', '2021-11-30', 9.2, '2020-02-14', 'Horror');

CREATE TABLE Cast_List (
    Cast_List_Id INT PRIMARY KEY NOT NULL,
    Cast_Member_Id INT NOT NULL,
    Cast_Appearance_Time TIME NOT NULL
);

INSERT INTO Cast_List (Cast_List_Id, Cast_Member_Id, Cast_Appearance_Time)
VALUES
(1, 101, '00:10:15'),
(2, 102, '00:20:30'),
(3, 103, '00:15:45'),
(4, 104, '00:05:10'),
(5, 105, '00:25:20'),
(6, 106, '00:30:00'),
(7, 107, '00:40:25'),
(8, 108, '00:35:50'),
(9, 109, '00:50:15'),
(10, 110, '00:45:05');

CREATE TABLE Cast_Member (
    Cast_Id INT PRIMARY KEY NOT NULL,
    Cast_First_Name VARCHAR(50) NOT NULL,
    Cast_Last_Name VARCHAR(50) NOT NULL,
    Cast_Type VARCHAR(50) NOT NULL,
    Cast_List_Id INT NOT NULL
);

INSERT INTO Cast_Member (Cast_Id, Cast_First_Name, Cast_Last_Name, Cast_Type, Cast_List_Id)
VALUES
(101, 'John', 'Doe', 'Lead', 1),
(102, 'Jane', 'Smith', 'Supporting', 2),
(103, 'Emily', 'Johnson', 'Guest', 3),
(104, 'Michael', 'Williams', 'Lead', 4),
(105, 'Sarah', 'Brown', 'Supporting', 5),
(106, 'Chris', 'Taylor', 'Guest', 6),
(107, 'Anna', 'Moore', 'Lead', 7),
(108, 'Mark', 'Lee', 'Supporting', 8),
(109, 'David', 'Walker', 'Guest', 9),
(110, 'Sophia', 'Hall', 'Lead', 10);

CREATE TABLE Episode (
    Episode_Id INT PRIMARY KEY NOT NULL,
    Episode_Length INT NOT NULL,
    Episode_Rating DECIMAL(3,2) NOT NULL,
    Cast_List_Id INT NOT NULL,
    Season_Id INT NOT NULL
);

INSERT INTO Episode (Episode_Id, Episode_Length, Episode_Rating, Cast_List_Id, Season_Id)
VALUES
(1, 45, 8.2, 1, 1),
(2, 50, 7.9, 2, 2),
(3, 42, 9.0, 3, 3),
(4, 60, 6.8, 4, 4),
(5, 55, 7.5, 5, 5),
(6, 48, 8.7, 6, 6),
(7, 53, 6.9, 7, 7),
(8, 47, 7.8, 8, 8),
(9, 52, 9.1, 9, 9),
(10, 40, 7.4, 10, 10);

CREATE TABLE Season (
    Season_Id INT PRIMARY KEY NOT NULL,
    Tv_Show_Id INT NOT NULL,
    Season_Number VARCHAR(50) NOT NULL,
    Season_Episode_Count INT NOT NULL
);

INSERT INTO Season (Season_Id, Tv_Show_Id, Season_Number, Season_Episode_Count)
VALUES
(1, 21, 1, 10),
(2, 22, 2, 12),
(3, 23, 3, 8),
(4, 24, 4, 15),
(5, 25, 1, 10),
(6, 26, 2, 13),
(7, 27, 3, 9),
(8, 28, 4, 16),
(9, 29, 1, 12),
(10, 30, 2, 14);

CREATE TABLE Tv_Show (
    Tv_Show_Id INT PRIMARY KEY NOT NULL,
    Content_Id INT NOT NULL,
    Season_Id INT NOT NULL,
    Tv_Show_Name VARCHAR(100) NOT NULL,
    Season_Count INT NOT NULL
);

INSERT INTO Tv_Show (Tv_Show_Id, Content_Id, Season_Id, Tv_Show_Name, Season_Count)
VALUES
(21, 1, 1, 'Mystery Island', 3),
(22, 2, 2, 'Comedy Nights', 5),
(23, 3, 3, 'Adventure Time', 4),
(24, 4, 4, 'Space Wars', 6),
(25, 5, 5, 'Cooking with Stars', 2),
(26, 6, 6, 'The Detective', 7),
(27, 7, 7, 'Horror House', 4),
(28, 8, 8, 'Animated Heroes', 3),
(29, 9, 9, 'Action Arena', 5),
(30, 10, 10, 'Historical Legends', 6),
(31, 11, 11, 'Sci-Fi Chronicles', 4),
(32, 12, 12, 'Fantasy Kingdom', 5),
(33, 13, 13, 'The Romance Tales', 3),
(34, 14, 14, 'Thriller Nights', 4),
(35, 15, 15, 'Reality Madness', 2),
(36, 16, 16, 'Supernatural Diaries', 6),
(37, 17, 17, 'Epic Battles', 5),
(38, 18, 18, 'The Investigator', 4),
(39, 19, 19, 'Survival Challenge', 3),
(40, 20, 20, 'Legends of Adventure', 7);


CREATE TABLE Rating (
    Rating_Id INT PRIMARY KEY NOT NULL,
    Customer_Id INT NOT NULL,
    Content_Id INT NOT NULL,
    Rating_Score DECIMAL(3,2) NOT NULL
);

INSERT INTO Rating (Rating_Id, Customer_Id, Content_Id, Rating_Score)
VALUES
(1, 1, 5, 8.5),
(2, 2, 12, 7.8),
(3, 3, 8, 9.1),
(4, 4, 15, 6.5),
(5, 5, 3, 7.2),
(6, 6, 9, 6.9),
(7, 7, 18, 8.0),
(8, 8, 2, 9.5),
(9, 9, 10, 7.0),
(10, 10, 14, 6.8);

CREATE TABLE Movie (
    Movie_Id INT PRIMARY KEY NOT NULL,
    Movie_Runtime INT NOT NULL,
    Cast_List_Id INT NOT NULL
);

INSERT INTO Movie (Movie_Id, Movie_Runtime, Cast_List_Id)
VALUES
(41, 120, 1),
(42, 150, 2),
(43, 90, 3),
(44, 110, 4),
(45, 130, 5),
(46, 95, 6),
(47, 105, 7),
(48, 125, 8),
(49, 100, 9),
(50, 140, 10);

CREATE TABLE Trailer (
    Trailer_Id INT PRIMARY KEY NOT NULL,
    Content_Id INT NOT NULL,
    Trailer_Runtime INT NOT NULL,
    Trailer_Maturity VARCHAR(20) NOT NULL,
);


INSERT INTO Trailer (Trailer_Id, Content_Id, Trailer_Runtime, Trailer_Maturity)
VALUES
(1, 5, 120, 'PG'),
(2, 12, 150, 'R'),
(3, 8, 110, 'PG-13'),
(4, 15, 90, 'G'),
(5, 3, 100, 'PG'),
(6, 9, 140, 'R'),
(7, 18, 130, 'PG-13'),
(8, 2, 95, 'G'),
(9, 10, 105, 'PG'),
(10, 14, 115, 'R'),
(11, 19, 125, 'PG-13'),
(12, 6, 100, 'G'),
(13, 1, 110, 'PG'),
(14, 13, 135, 'R'),
(15, 4, 145, 'PG-13'),
(16, 17, 120, 'G'),
(17, 11, 90, 'PG'),
(18, 7, 130, 'R'),
(19, 16, 140, 'PG-13'),
(20, 20, 150, 'G');


CREATE TABLE Recommendation (
    Customer_Id INT NOT NULL,
    Content_Id INT NOT NULL,
    Trailer_Id INT NOT NULL,
    PRIMARY KEY (Customer_Id, Content_Id)
);

INSERT INTO Recommendation (Customer_Id, Content_Id, Trailer_Id)
VALUES
(1, 5, 1),
(2, 12, 2),
(3, 8, 3),
(4, 15, 4),
(5, 3, 5),
(6, 9, 6),
(7, 18, 7),
(8, 2, 8),
(9, 10, 9),
(10, 14, 10),
(11, 19, 11),
(12, 6, 12),
(13, 1, 13),
(14, 13, 14),
(15, 4, 15),
(16, 17, 16),
(17, 11, 17),
(18, 7, 18),
(19, 16, 19),
(20, 20, 20);


CREATE TABLE Currently_Watching (
    Customer_Id INT NOT NULL,
    Content_Id INT NOT NULL,
    Date_Watched DATE NOT NULL,
    Stop_Time TIME NOT NULL,
    PRIMARY KEY (Customer_Id, Content_Id)
);

INSERT INTO Currently_Watching (Customer_Id, Content_Id, Date_Watched, Stop_Time)
VALUES
(1, 5, '2024-10-15', '01:15:00'),
(2, 12, '2024-09-10', '00:45:00'),
(3, 8, '2024-08-25', '01:30:00'),
(4, 15, '2024-07-05', '00:50:00'),
(5, 3, '2024-06-12', '01:10:00'),
(6, 9, '2024-05-20', '00:35:00'),
(7, 18, '2024-04-14', '01:20:00'),
(8, 2, '2024-03-30', '01:05:00'),
(9, 10, '2024-02-22', '01:40:00'),
(10, 14, '2024-01-10', '00:55:00'),
(11, 19, '2023-12-25', '01:25:00'),
(12, 6, '2023-11-18', '01:00:00'),
(13, 1, '2023-10-15', '01:35:00'),
(14, 13, '2023-09-29', '00:40:00'),
(15, 4, '2023-08-17', '01:10:00'),
(16, 17, '2023-07-21', '00:50:00'),
(17, 11, '2023-06-12', '01:20:00'),
(18, 7, '2023-05-09', '01:05:00'),
(19, 16, '2023-04-27', '01:15:00'),
(20, 20, '2023-03-14', '01:30:00');

CREATE TABLE Watch_History (
    Customer_Id INT NOT NULL,
    Content_Id INT NOT NULL,
    Date_Watched DATE NOT NULL,
    PRIMARY KEY (Customer_Id, Content_Id)
);

INSERT INTO Watch_History (Customer_Id, Content_Id, Date_Watched)
VALUES
(1, 10, '2024-10-10'),
(2, 3, '2024-09-22'),
(3, 8, '2024-08-15'),
(4, 15, '2024-07-30'),
(5, 20, '2024-06-25'),
(6, 1, '2024-05-18'),
(7, 5, '2024-04-10'),
(8, 12, '2024-03-05'),
(9, 7, '2024-02-20'),
(10, 19, '2024-01-25'),
(11, 4, '2023-12-15'),
(12, 9, '2023-11-22'),
(13, 14, '2023-10-30'),
(14, 6, '2023-09-15'),
(15, 2, '2023-08-20'),
(16, 18, '2023-07-05'),
(17, 13, '2023-06-10'),
(18, 11, '2023-05-25'),
(19, 16, '2023-04-15'),
(20, 17, '2023-03-10');

-- Foreign key reference

ALTER TABLE Subscription_Plan
ADD CONSTRAINT FK_Subscription_Customer
FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id);

ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Subscription
FOREIGN KEY (Subscription_Id) REFERENCES Subscription_Plan(Subscription_Id);

ALTER TABLE Rating
ADD CONSTRAINT FK_Rating_Customer
FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id);

ALTER TABLE Rating
ADD CONSTRAINT FK_Rating_Content
FOREIGN KEY (Content_Id) REFERENCES Content(Content_Id);

ALTER TABLE Tv_Show
ADD CONSTRAINT FK_TvShow_Content
FOREIGN KEY (Content_Id) REFERENCES Content(Content_Id);