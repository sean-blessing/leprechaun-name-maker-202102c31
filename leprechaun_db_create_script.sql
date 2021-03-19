-- create and select the database
DROP DATABASE IF EXISTS leprechaun;
CREATE DATABASE leprechaun;
USE leprechaun;

-- create FirstNameTranslation table
Create table FirstNameTranslation (
ID 				integer			primary key auto_increment,
Letter	 		varchar(1)		not null unique,
Translation		varchar(50)		not null
);

-- create LastNameTranslation table
Create table LastNameTranslation (
ID 				integer			primary key auto_increment,
BirthMonth 		varchar(3)		not null unique,
Translation		varchar(50)		not null
);

-- create Uwer table
Create table User (
ID 				integer 		primary key auto_increment,
FirstName		varchar(50) 	not null,
LastName		varchar(50) 	not null,
BirthMonth 		varchar(3)	 	not null,
LeprechaunName	varchar(50),
Foreign Key (BirthMonth) references LastNameTranslation(BirthMonth)
);

-- Add some first-name-translations
 insert into FirstNameTranslation VALUES
 	(1, 'A', 'Happy'),
	(2, 'B', 'Lucky'),
 	(3, 'C', 'Little'),
 	(4, 'D', 'Bubbly'),
 	(5, 'E', 'Flirty'),
 	(6, 'F', 'Tiny'),
 	(7, 'G', 'Bashful'),
 	(8, 'H', 'Charming'),
 	(9, 'I', 'Wild'),
 	(10, 'J', 'Sappy'),
 	(11, 'K', 'Spoiled'),
 	(12, 'L', 'Feisty'),
 	(13, 'M', 'Shy'),
 	(14, 'N', 'Perky'),
 	(15, 'O', 'Crazy'),
 	(16, 'P', 'Bubbly'),
 	(17, 'Q', 'Cheerful'),
 	(18, 'R', 'Naughty'),
 	(19, 'S', 'Itty Bitty'),
 	(20, 'T', 'Bashful'),
 	(21, 'U', 'Confused'),
 	(22, 'V', 'Rowdy'),
 	(23, 'W', 'Dreeay'),
 	(24, 'X', 'Teeny'),
 	(25, 'Y', 'Wacky'),
 	(26, 'Z', 'Wee');
      
-- Add some last-name-translations
 insert into LastNameTranslation VALUES
 	(1, 'Jan', 'Short Legs'),
	(2, 'Feb', 'Green Feet'),
 	(3, 'Mar', 'Stubby Toes'),
 	(4, 'Apr', 'Gold Tooth'),
 	(5, 'May', 'Nugget Nose'),
 	(6, 'Jun', 'Pointy Ears'),
 	(7, 'Jul', 'Clover Hair'),
 	(8, 'Aug', 'Patty Cake'),
 	(9, 'Sep', 'Half Pint'),
 	(10, 'Oct', 'Freckle Face'),
 	(11, 'Nov', 'Sparkly Pants'),
 	(12, 'Dec', 'Rainbow Lips');
      
-- create a user and grant privileges to that user
DROP USER IF EXISTS lpc_user@localhost;
CREATE USER lpc_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON leprechaun.* TO lpc_user@localhost;
