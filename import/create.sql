create table Kurs( 
   KursNr varchar (3) not null, 
   Titel  varchar (20));

create table Teilnehmer( 
   TnNr integer, 
   Name varchar(12), 
   Ort  varchar(12));

create table Angebot( 
   AngNr  integer not null, 
   KursNr varchar (3) not null, 
   Datum  date, 
   Ort    varchar(12));

create table Kursleiter( 
   PersNr integer not null, 
   Name   varchar(12), 
   Gehalt real);

create table Vorauss( 
   VorNr  varchar(3) not null,  
   KursNr varchar(3) not null);

create table Nimmt_teil( 
   AngNr  integer not null, 
   KursNr varchar(3) not null, 
   TnNr   integer not null);

create table Fuehrt_durch( 
   AngNr    integer not null, 
   KursNr   varchar(3) not null, 
   PersNr   integer);

create table Gebuehren( 
   AngNr    integer not null, 
   KursNr   varchar(3) not null, 
   TnNr     integer not null,
   Gebuehr  real);

create table KursLit( 
   KursNr   varchar(3) not null, 
   Bestand  integer,
   Bedarf   integer,
   Preis    real);

