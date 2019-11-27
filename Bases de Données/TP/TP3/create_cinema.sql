create table tarif(
        id_tarif serial primary key,
        libelle_tarif varchar(20),
        prix_tarif real default 0);

create table salle(
        id_salle serial primary key,
        nom_salle varchar(20),
        nb_places int,
        resa_abonnes real default 0.0);

create table semaine(
        id_semaine serial primary key,
        date_debut date,
        date_fin date
        constraint constr_date_semaine check(date_debut <= date_fin));

create table film(
        id_film serial primary key,
        titre_film varchar(20),
        dure int);

create table seance(
        id_seance serial primary key,
        horaire_debut time,
        jour_semaine int,
        id_film int references film(id_film)
            on update cascade
            on delete set null,
        id_salle int references salle(id_salle)
            on update cascade
            on delete set null,
        id_semaine int references semaine(id_semaine)
            on update cascade
            on delete set null);

create table tarifseance(
        id_tarif int references tarif(id_tarif)
            on update cascade
            on delete set null,
        id_seance int references seance(id_seance)
            on update cascade
            on delete set null,
        nb_places_vendues int,
        constraint tarifseance_pkey primary key (id_tarif, id_seance));

create table abonne(
        id_abonne serial primary key,
        nom_abonne varchar(20),
        prenom_abonne varchar(20),
        age int);

create table abonneseance(
        id_abonne int references abonne(id_abonne)
            on update cascade
            on delete set null,
        id_seance int references seance(id_seance)
            on update cascade
            on delete set null,
        constraint abonneseance_pkey primary key (id_abonne, id_seance));

create table abonnesemaine(
        id_abonne int references abonne(id_abonne)
            on update cascade
            on delete set null,
        id_semaine int references semaine(id_semaine)
            on update cascade
            on delete set null,
        constraint abonnesemaine_pkey primary key (id_abonne, id_semaine));

create table reservation(
        id_abonne int references abonne(id_abonne)
            on update cascade
            on delete set null,
        id_seance int references seance(id_seance)
            on update cascade
            on delete set null,
        prise boolean,
        constraint reservation_pkey primary key (id_abonne, id_seance))
