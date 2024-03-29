insert into tarif values(1, 'matinee', 5.0);
insert into tarif values(2, 'apres-midi', 8.0);
insert into tarif values(3, 'soiree', 11.0);

select pg_catalog.setval('tarif_id_tarif_seq', 3, true);

insert into salle values(1, 'Salle 1', 40, 5);
insert into salle values(2, 'Salle 2', 80, 5);
insert into salle values(3, 'Salle 3', 60, 5);

select pg_catalog.setval('salle_id_salle_seq', 3, true);

insert into semaine values(1, '2015-11-16', '2015-11-22');
insert into semaine values(2, '2015-11-23', '2015-11-29');
insert into semaine values(3, '2015-11-30', '2015-12-06');
insert into semaine values(4, '2015-12-07', '2015-12-13');
insert into semaine values(5, '2015-12-14', '2015-12-20');
insert into semaine values(6, '2015-12-28', '2016-01-03');

select pg_catalog.setval('semaine_id_semaine_seq', 6, true);

insert into film values(1, '007 Spectre', 120);
insert into film values(2, 'Seul sur Mars', 110);
insert into film values(3, 'Mon roi', 100);
insert into film values(4, 'Hunger Games', 115);
insert into film values(5, 'Le Labyrinthe', 90);
insert into film values(6, 'The Lobster', 95);

select pg_catalog.setval('film_id_film_seq', 6, true);

insert into seance values(1,  '16:00', 1, 1, 1, 1);
insert into seance values(2,  '18:30', 1, 1, 1, 1);
insert into seance values(3,  '20:00', 1, 1, 1, 1);
insert into seance values(4,  '22:00', 1, 1, 1, 1);
insert into seance values(5,  '16:00', 2, 1, 1, 1);
insert into seance values(6,  '18:30', 2, 1, 1, 1);
insert into seance values(7,  '20:00', 2, 1, 1, 1);
insert into seance values(8,  '22:00', 2, 1, 1, 1);
insert into seance values(9,  '16:00', 3, 1, 1, 1);
insert into seance values(10, '18:30', 3, 1, 1, 1);
insert into seance values(11, '20:00', 3, 1, 1, 1);
insert into seance values(12, '22:00', 3, 1, 1, 1);
insert into seance values(13, '16:00', 4, 1, 1, 1);
insert into seance values(14, '18:30', 4, 1, 1, 1);
insert into seance values(15, '20:00', 4, 1, 1, 1);
insert into seance values(16, '22:00', 4, 1, 1, 1);
insert into seance values(17, '16:00', 5, 1, 1, 1);
insert into seance values(18, '18:30', 5, 1, 1, 1);
insert into seance values(19, '20:00', 5, 1, 1, 1);
insert into seance values(20, '22:00', 5, 1, 1, 1);
insert into seance values(21, '16:00', 6, 1, 1, 1);
insert into seance values(22, '18:30', 6, 1, 1, 1);
insert into seance values(23, '20:00', 6, 1, 1, 1);
insert into seance values(24, '22:00', 6, 1, 1, 1);
insert into seance values(25, '16:00', 7, 1, 1, 1);
insert into seance values(26, '18:30', 7, 1, 1, 1);
insert into seance values(27, '20:00', 7, 1, 1, 1);
insert into seance values(28, '22:00', 7, 1, 1, 1);

insert into seance values(29, '16:00', 1, 2, 2, 1);
insert into seance values(30, '18:30', 1, 2, 2, 1);
insert into seance values(31, '20:00', 1, 2, 2, 1);
insert into seance values(32, '22:00', 1, 2, 2, 1);
insert into seance values(33, '16:00', 2, 2, 2, 1);
insert into seance values(34, '18:30', 2, 2, 2, 1);
insert into seance values(35, '20:00', 2, 2, 2, 1);
insert into seance values(36, '22:00', 2, 2, 2, 1);
insert into seance values(37, '16:00', 3, 2, 2, 1);
insert into seance values(38, '18:30', 3, 2, 2, 1);
insert into seance values(39, '20:00', 3, 2, 2, 1);
insert into seance values(40, '22:00', 3, 2, 2, 1);
insert into seance values(41, '16:00', 4, 2, 2, 1);
insert into seance values(42, '18:30', 4, 2, 2, 1);
insert into seance values(43, '20:00', 4, 2, 2, 1);
insert into seance values(44, '22:00', 4, 2, 2, 1);
insert into seance values(45, '16:00', 5, 2, 2, 1);
insert into seance values(46, '18:30', 5, 2, 2, 1);
insert into seance values(47, '20:00', 5, 2, 2, 1);
insert into seance values(48, '22:00', 5, 2, 2, 1);
insert into seance values(49, '16:00', 6, 2, 2, 1);
insert into seance values(50, '18:30', 6, 2, 2, 1);
insert into seance values(51, '20:00', 6, 2, 2, 1);
insert into seance values(52, '22:00', 6, 2, 2, 1);
insert into seance values(53, '16:00', 7, 2, 2, 1);
insert into seance values(54, '18:30', 7, 2, 2, 1);
insert into seance values(55, '20:00', 7, 2, 2, 1);
insert into seance values(56, '22:00', 7, 2, 2, 1);

insert into seance values(57, '16:00', 1, 3, 3, 1);
insert into seance values(58, '18:30', 1, 3, 3, 1);
insert into seance values(59, '20:00', 1, 3, 3, 1);
insert into seance values(60, '22:00', 1, 3, 3, 1);
insert into seance values(61, '16:00', 2, 3, 3, 1);
insert into seance values(62, '18:30', 2, 3, 3, 1);
insert into seance values(63, '20:00', 2, 3, 3, 1);
insert into seance values(64, '22:00', 2, 3, 3, 1);
insert into seance values(65, '16:00', 3, 3, 3, 1);
insert into seance values(66, '18:30', 3, 3, 3, 1);
insert into seance values(67, '20:00', 3, 3, 3, 1);
insert into seance values(68, '22:00', 3, 3, 3, 1);
insert into seance values(69, '16:00', 4, 3, 3, 1);
insert into seance values(70, '18:30', 4, 3, 3, 1);
insert into seance values(71, '20:00', 4, 3, 3, 1);
insert into seance values(72, '22:00', 4, 3, 3, 1);
insert into seance values(73, '16:00', 5, 3, 3, 1);
insert into seance values(74, '18:30', 5, 3, 3, 1);
insert into seance values(75, '20:00', 5, 3, 3, 1);
insert into seance values(76, '22:00', 5, 3, 3, 1);
insert into seance values(77, '16:00', 6, 3, 3, 1);
insert into seance values(78, '18:30', 6, 3, 3, 1);
insert into seance values(79, '20:00', 6, 3, 3, 1);
insert into seance values(80, '22:00', 6, 3, 3, 1);
insert into seance values(81, '16:00', 7, 3, 3, 1);
insert into seance values(82, '18:30', 7, 3, 3, 1);
insert into seance values(83, '20:00', 7, 3, 3, 1);
insert into seance values(84, '22:00', 7, 3, 3, 1);

select pg_catalog.setval('seance_id_seance_seq', 84, true);

insert into tarifseance values(2, 1, 5);
insert into tarifseance values(2, 2, 5);
insert into tarifseance values(3, 3, 5);
insert into tarifseance values(3, 4, 10);
insert into tarifseance values(2, 5, 8);
insert into tarifseance values(2, 6, 9);
insert into tarifseance values(3, 7, 10);
insert into tarifseance values(3, 8, 11);
insert into tarifseance values(2, 9, 12);
insert into tarifseance values(2, 10, 7);
insert into tarifseance values(3, 11, 8);
insert into tarifseance values(3, 12, 9);
insert into tarifseance values(2, 13, 10);
insert into tarifseance values(2, 14, 11);
insert into tarifseance values(3, 15, 12);
insert into tarifseance values(3, 16, 13);
insert into tarifseance values(2, 17, 12);
insert into tarifseance values(2, 18, 11);
insert into tarifseance values(3, 19, 10);
insert into tarifseance values(3, 20, 9);
insert into tarifseance values(2, 21, 8);
insert into tarifseance values(2, 22, 9);
insert into tarifseance values(3, 23, 10);
insert into tarifseance values(3, 24, 11);
insert into tarifseance values(2, 25, 12);
insert into tarifseance values(2, 26, 13);
insert into tarifseance values(3, 27, 14);
insert into tarifseance values(3, 28, 15);

insert into tarifseance values(2, 29, 5);
insert into tarifseance values(2, 30, 5);
insert into tarifseance values(3, 31, 5);
insert into tarifseance values(3, 32, 10);
insert into tarifseance values(2, 33, 8);
insert into tarifseance values(2, 34, 9);
insert into tarifseance values(3, 35, 10);
insert into tarifseance values(3, 36, 11);
insert into tarifseance values(2, 37, 12);
insert into tarifseance values(2, 38, 7);
insert into tarifseance values(3, 39, 8);
insert into tarifseance values(3, 40, 9);
insert into tarifseance values(2, 41, 10);
insert into tarifseance values(2, 42, 11);
insert into tarifseance values(3, 43, 12);
insert into tarifseance values(3, 44, 13);
insert into tarifseance values(2, 45, 12);
insert into tarifseance values(2, 46, 11);
insert into tarifseance values(3, 47, 10);
insert into tarifseance values(3, 48, 9);
insert into tarifseance values(2, 49, 8);
insert into tarifseance values(2, 50, 9);
insert into tarifseance values(3, 51, 10);
insert into tarifseance values(3, 52, 11);
insert into tarifseance values(2, 53, 12);
insert into tarifseance values(2, 54, 13);
insert into tarifseance values(3, 55, 14);
insert into tarifseance values(3, 56, 15);

insert into tarifseance values(2, 57, 5);
insert into tarifseance values(2, 58, 5);
insert into tarifseance values(3, 59, 5);
insert into tarifseance values(3, 60, 10);
insert into tarifseance values(2, 61, 8);
insert into tarifseance values(2, 62, 9);
insert into tarifseance values(3, 63, 10);
insert into tarifseance values(3, 64, 11);
insert into tarifseance values(2, 65, 12);
insert into tarifseance values(2, 66, 7);
insert into tarifseance values(3, 67, 8);
insert into tarifseance values(3, 68, 9);
insert into tarifseance values(2, 69, 10);
insert into tarifseance values(2, 70, 11);
insert into tarifseance values(3, 71, 12);
insert into tarifseance values(3, 72, 13);
insert into tarifseance values(2, 73, 12);
insert into tarifseance values(2, 74, 11);
insert into tarifseance values(3, 75, 10);
insert into tarifseance values(3, 76, 9);
insert into tarifseance values(2, 77, 8);
insert into tarifseance values(2, 78, 9);
insert into tarifseance values(3, 79, 10);
insert into tarifseance values(3, 80, 11);
insert into tarifseance values(2, 81, 12);
insert into tarifseance values(2, 82, 13);
insert into tarifseance values(3, 83, 14);
insert into tarifseance values(3, 84, 15);

insert into abonne values(1,'Patamob','Adhémar',23);
insert into abonne values(2,'Zeublouse','Agathe',45);
insert into abonne values(3,'Rivenbusse','Elsa',28);
insert into abonne values(4,'Comindieu','Thibaud',102);
insert into abonne values(5,'Ardelpic','Helmut',21);
insert into abonne values(6,'Peulafenetre','Firmin',20);
insert into abonne values(7,'Locale','Anasthasie',17);
insert into abonne values(8,'Bierrekeuchprefere','Michel',40);

select pg_catalog.setval('abonne_id_abonne_seq', 8, true);

insert into abonnesemaine values(1, 1);
insert into abonnesemaine values(1, 2);
insert into abonnesemaine values(2, 1);
insert into abonnesemaine values(3, 2);
insert into abonnesemaine values(4, 2);
insert into abonnesemaine values(5, 1);
insert into abonnesemaine values(6, 2);
insert into abonnesemaine values(6, 1);
insert into abonnesemaine values(7, 2);

insert into abonneseance values(1, 1);
insert into abonneseance values(1, 10);
insert into abonneseance values(1, 20);
insert into abonneseance values(2, 3);
insert into abonneseance values(2, 8);
insert into abonneseance values(2, 27);
insert into abonneseance values(3, 33);
insert into abonneseance values(3, 45);
insert into abonneseance values(3, 56);
insert into abonneseance values(3, 50);
insert into abonneseance values(3, 38);

insert into reservation values(1, 1);
insert into reservation values(1, 10);
insert into reservation values(1, 20);
insert into reservation values(2, 3);
insert into reservation values(2, 8);
insert into reservation values(2, 27);
insert into reservation values(3, 33);
insert into reservation values(3, 45);
insert into reservation values(3, 56);
insert into reservation values(3, 50);
insert into reservation values(3, 38);
