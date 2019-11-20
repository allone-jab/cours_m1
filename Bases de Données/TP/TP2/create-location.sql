create table categorie(
        id_categorie serial primary key,
        libelle_categorie varchar(20),  
        descriptif_categorie varchar(60),  
        prix_par_jour real); 


create table voiture( 
        id_voiture serial primary key, 
        num_immatriculation varchar(12),  
        marque varchar(10),  
        modele varchar(20),  
        nbre_places int,  
        id_categorie int references categorie(id_categorie) 
			on update cascade
			on delete set null); 


create table client(
	id_client serial primary key,  
        nom_client varchar(20), 
        prenom_client varchar(20),       
        numero_rue int,  
        rue varchar(30),  
        ville varchar(20),  
        nbre_loc int); 


create table etat(
	id_etat serial primary key, 
	intitule_etat varchar(20));


create table contrat(
	id_contrat serial primary key,
	id_voiture int references voiture(id_voiture)
			on update cascade 
			on delete cascade,
    id_client int references client(id_client)
			on update cascade 
			on delete set null,
	id_etat int references etat(id_etat)
			on update cascade
			on delete set null,
    date_debut date,
    date_fin date,
	prix_location real default 0,
	constraint constr_dates_loc check (date_fin>=date_debut));
