insert into Kurs values('G08', 'Grundlagen I');
insert into Kurs values('G10', 'Grundlagen II');
insert into Kurs values('P13', 'C-Programmierung');
insert into Kurs values('I09', 'Datenbanken');


insert into Teilnehmer values(143, 'Schmidt, M.', 'Wedel');
insert into Teilnehmer values(145, 'Huber, Chr.', 'Augsburg');
insert into Teilnehmer values(146, 'Abele, I.', 'Ulm');
insert into Teilnehmer values(149, 'Kircher, B.', 'Augsburg');
insert into Teilnehmer values(155, 'Meier, W.', 'Muenchen');
insert into Teilnehmer values(171, 'Moeller, H.', 'Neusaess');
insert into Teilnehmer values(173, 'Schulze, B.', 'Krumbach');
insert into Teilnehmer values(177, 'Mons, F.', 'Donauwoerth');
insert into Teilnehmer values(185, 'Meier, K.', 'Landsberg');
insert into Teilnehmer values(187, 'Karstens, L.', 'Augsburg');
insert into Teilnehmer values(194, 'Gerstner, M.', 'Mindelheim');



INSERT INTO Angebot VALUES (1, 'G08', '2023-10-13', 'Wedel');
INSERT INTO Angebot VALUES (2, 'G08', '2023-11-24', 'Ulm');
INSERT INTO Angebot VALUES (1, 'G10', '2023-12-01', 'Augsburg');
INSERT INTO Angebot VALUES (2, 'G10', '2023-02-15', 'Muenchen');
INSERT INTO Angebot VALUES (1, 'P13', '2023-05-28', 'Augsburg');
INSERT INTO Angebot VALUES (2, 'P13', '2023-07-01', 'Augsburg');
INSERT INTO Angebot VALUES (1, 'I09', '2023-03-27', 'Mindelheim');
INSERT INTO Angebot VALUES (2, 'I09', '2023-04-23', 'Muenchen');
INSERT INTO Angebot VALUES (3, 'I09', '2023-05-29', 'Ulm');



insert into Kursleiter values(27183, 'Meier, I.', 4300.50);
insert into Kursleiter values(29594, 'Schulze, H.', 3890.20);
insert into Kursleiter values(38197, 'Huber, L.', 4200.10);
insert into Kursleiter values(43325, 'Mueller, K.', 3400.80);




insert into Vorauss values('G08', 'P13');
insert into Vorauss values('G10', 'P13');
insert into Vorauss values('G08', 'I09');
insert into Vorauss values('G10', 'I09');
insert into Vorauss values('P13', 'I09');




insert into Nimmt_teil values(2, 'G08', 143);
insert into Nimmt_teil values(2, 'P13', 143);
insert into Nimmt_teil values(1, 'G08', 145);
insert into Nimmt_teil values(1, 'P13', 146);
insert into Nimmt_teil values(1, 'I09', 146);
insert into Nimmt_teil values(2, 'P13', 149);
insert into Nimmt_teil values(1, 'I09', 155);
insert into Nimmt_teil values(1, 'I09', 171);
insert into Nimmt_teil values(1, 'I09', 173);
insert into Nimmt_teil values(2, 'P13', 177);
insert into Nimmt_teil values(1, 'I09', 185);
insert into Nimmt_teil values(2, 'I09', 187);
insert into Nimmt_teil values(1, 'P13', 194);





insert into Fuehrt_durch values(1, 'G08', 38197);
insert into Fuehrt_durch values(2, 'G08', 38197);
insert into Fuehrt_durch values(1, 'G10', 43325);
insert into Fuehrt_durch values(2, 'G10', 29594);
insert into Fuehrt_durch values(1, 'P13', 27183);
insert into Fuehrt_durch values(2, 'P13', 27183);
insert into Fuehrt_durch values(1, 'I09', 29594);
insert into Fuehrt_durch values(2, 'I09', 29594);
insert into Fuehrt_durch values(3, 'I09', 29594);





insert into Gebuehren values(2, 'G08', 143, 500);
insert into Gebuehren values(2, 'P13', 143, 400);
insert into Gebuehren values(1, 'G08', 145, NULL);
insert into Gebuehren values(1, 'P13', 146, 300);
insert into Gebuehren values(1, 'I09', 146, NULL);
insert into Gebuehren values(2, 'P13', 149, 350);
insert into Gebuehren values(1, 'I09', 155, NULL);
insert into Gebuehren values(1, 'I09', 171, NULL);
insert into Gebuehren values(1, 'I09', 173, 400);
insert into Gebuehren values(2, 'P13', 177, NULL);
insert into Gebuehren values(1, 'I09', 185, 450);
insert into Gebuehren values(2, 'I09', 187, NULL);
insert into Gebuehren values(1, 'P13', 194, NULL);



insert into KursLit values('G08', 4, 2, 10.50);
insert into KursLit values('I09', 2, 6, 8.00);
insert into KursLit values('P13', 3, 5, 15.20);
