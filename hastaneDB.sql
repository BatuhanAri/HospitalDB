USE hospitalDB
 
 create table Users(
 UserID int IDENTITY(1,1) primary key,
 UserCode nvarchar(50),
 UserName nvarchar(100) not null,
 StartDate date,
 Shift nvarchar(100),
 Position nvarchar(100),
 AddressID int not null,
 PhoneNumber nvarchar(13),
 TC int not null
 );

 Create Table Patients(
 PatientID int IDENTITY(1,1) primary key,
 UserID int not null,
 status nvarchar(100) not null,
 CategoryID int not null,
 AddressID int not null,
 ResponsibleID int not null,
 StartDate date not null,
 RoomNo nvarchar(10)not null,
 );

 Create Table Category(
 CategoryID int IDENTITY(1,1) primary key,
 UserID int not null,
 ResponsibleID int not null,
 ItemID int,
 Itemdate date,
 RefakatID int
 );
 Create Table Supplier(
 SupplierID int IDENTITY(1,1) primary key,
 AddressID int,
 CompanyID int,
 Price int,
 ItemID int,
 );
 create table inventory(
 itemID int IDENTITY(1,1) primary key,
 addressID int,
 itemname nvarchar(100),
 quantity int,
 itemdate date,
 supplierID int
 );

 create table Address(
 AddressID int IDENTITY(1,1) primary key,
 CityID int,
 StateID int,
 CountryID int,
 AddressLine nvarchar(100),
 postacode int
 );
 create table City(
 CityID int IDENTITY(1,1) primary key,
 CityName nvarchar(100)
 );
 create table State(
 StateID int IDENTITY(1,1) primary key,
 StateName nvarchar(100)
 );
 create table country(
 CountryID int IDENTITY(1,1) primary key,
 CountryName nvarchar(100)
 );

 create table Company(
 CompanyID int IDENTITY(1,1) primary key,
 CompanyName nvarchar(100),
 PhoneNumber nvarchar(15),
 AddressID int
 );

 create Table sales(
 SalesID int IDENTITY(1,1) primary key,
 UserID int,
 ItemID int,
 SaleDate date,
 Description nvarchar(100)
 );


 alter table users
 add FOREIGN key (AddressID) references address(addressID);
 alter table patients
 add Foreign key (userID) references users(userID);
 alter table patients
 add foreign key (categoryID) references category(categoryID);
 alter table patients
 add foreign key (ResponsibleID) references users(userID);
 alter table category
 add foreign key (userID) references users(userID);
 alter table category
 add foreign key (ItemID) references inventory(itemID);
 alter table inventory 
 add Foreign key (addressID) references address(addressID);
 alter table inventory 
 add foreign key (supplierID) references supplier(supplierID);
 alter table address
 add foreign key (cityID) references city(cityID);
 alter table address
 add foreign key (stateID) references state(stateID);
 alter table address
 add foreign key (countryID) references country(countryID);
 alter table company
 add foreign key (addressID) references address(addressID);
 alter table sales
 add foreign key (userID) references users(userID);
 alter table sales
 add foreign key (ItemID) references inventory(itemID);







