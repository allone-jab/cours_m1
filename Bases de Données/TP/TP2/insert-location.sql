

insert into categorie(libelle_categorie,descriptif_categorie,prix_par_jour)
       values('simple','voiture bas de gamme mais pas chere!',4);
insert into categorie(libelle_categorie,descriptif_categorie,prix_par_jour)
       values('moyen','voiture de gamme moyenne mais pas trop chere!',8);
insert into categorie(libelle_categorie,descriptif_categorie,prix_par_jour)
       values('confort','voiture confortable mais pas trop chere!',10);
insert into categorie(libelle_categorie,descriptif_categorie,prix_par_jour)
       values('luxe','voiture de luxe mais chere!',12);
insert into categorie(libelle_categorie,descriptif_categorie,prix_par_jour)
       values('grand luxe','voiture de grand luxe mais tres chere!',18);




insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('1243 AZE 56','Citron','Clarinette',5,2);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('4345 AZE 57','Pijot','005',6,3);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('8769 GH 62','Lodo','Nivo',4,1);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('2345 FG 78','Citron','Clarinette',5,2);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('9876 XC 87','OhDis','Z3',5,5);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('4793 GH 67','Pijot','004',5,2);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('8642 TY 68','Citron','Flute',5,3);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('0987 GH 68','Pijot','008',5,4);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('3572 FH 43','Pijot','005',5,3);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('2945 KJ 78','Citron','Clarinette',5,2);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('1847 JH 90','Citron','Flute',5,3);
insert into voiture(num_immatriculation,marque,modele,nbre_places,
       id_categorie)
        values ('1047 JK 89','OhDis','Z3',5,4);



insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Dupont','Jean',67,'rue lebas','bethune',2);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Durant','Pierre',23,'rue souvraz','bully-les-mines',3);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Dubois','Paul',2,'rue basly','lens',1);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Dupuis','Jacques',7,'rue lebas','bethune',2);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Laporte','Jeannette',123,'rue de la bassee','lens',3);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Cluzel','Marcelle',56,'rue de bethune','lens',2);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Dulac','Clementine',69,'rue henri Barbusse','colombes',0);
insert into client(nom_client,prenom_client,numero_rue,rue,ville,nbre_loc)
       values ('Duronchon','Henriette',367,'rue Volta Prolongee','courbevoie',0);


insert into etat(id_etat, intitule_etat)
	values(1,'reservation');
insert into etat(id_etat, intitule_etat)
	values(2,'location en cours');
insert into etat(id_etat, intitule_etat)
	values(3,'contrat termine');
insert into etat(id_etat, intitule_etat)
	values(4,'annulation');
insert into etat(id_etat, intitule_etat)
	values(5,'litige');



insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (1,'2002-03-20',1,'2002-03-27',3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat) 
       values (2,'2002-02-02',1,'2002-03-27',3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat) 
       values (3,'2002-03-02',2,'2002-03-27',3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (4,'2002-02-20',2,'2002-03-27', 3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (5,'2002-03-20',2,'2002-03-27', 3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (1,'2002-02-20',3,'2002-03-27', 5);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (2,'2002-03-20',4,'2002-03-27', 4);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (3,'2002-02-20',4,'2002-03-27', 3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (4,'2002-03-20',5,'2002-03-27', 3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (5,'2002-02-20',5,'2002-03-27', 5);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (1,'2002-01-20',5,'2002-03-27', 4);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (2,'2002-01-20',6,'2002-03-27', 3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (3,'2002-01-20',6,'2002-03-27', 3);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (3,'2006-10-21',6,'2007-03-27',1);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (3,'2002-01-21',5,'2006-03-27',4);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (4,'2006-01-20',4,'2006-03-27',1);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (3,'2002-10-07',4,'2005-10-18',2);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (11,'2002-03-20',7,'2002-03-27',4);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (12,'2006-03-20',8,'2006-03-27',1);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (4,'2005-03-20',8,'2005-11-27',2);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (11,'2005-10-31',4,'2005-11-10',2);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (10,'2005-09-27',1,'2005-11-01',2);
insert into contrat (id_voiture,date_debut,id_client,date_fin,id_etat)
       values (12,'2005-10-25',3,'2005-10-28',2);








