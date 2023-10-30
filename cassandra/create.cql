create table if not exists kurs_orte
(
    ort text primary key
);

create table if not exists kursdetail
(
    kurs_nr    text primary key,
    datum      date,
    kursleiter text,
    titel      text
);

create table if not exists kursleiter
(
    pers_nr int primary key,
    gehalt  double,
    name    text
);

create index if not exists kursleiter_gehalt_idx
    on kursleiter (gehalt);

create table if not exists teilnehmer
(
    tn_nr int primary key,
    name  text,
    ort   text
);

