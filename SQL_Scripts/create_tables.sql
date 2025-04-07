create table Users
(
  UserID int primary key,
  Name varchar(30),
  Email varchar(30),
  PhoneNumber char(10) check(length(PhoneNumber)=10)
);

create table Tickets
(
  TicketID int primary key,
  UserID int,
  EventName varchar(30),
  SeatNumber int,
  Price int,
  Foreign key (UserID) references Users(UserID)
	on delete cascade
	on update cascade
);

create table Payments
(
  PaymentID int primary key,
  UserID int,
  TicketID int,
  Amount int,
  PaymentDate date check(PaymentDate <=current_date),
Foreign key (UserID) references Users(UserID)
	on delete cascade
	on update cascade,
Foreign key (TicketID) references Tickets(TicketID)
	on delete cascade
	on update cascade
);