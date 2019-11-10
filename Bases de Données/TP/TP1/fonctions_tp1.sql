/*
    Nombre d'exemplaire de l'oeuvre 
*/
CREATE OR REPLACE FUNCTION nb_exemplaires(id INTEGER) RETURNS BIGINT 
AS $$
    SELECT count(*) AS nb_livre 
    FROM livre l NATURAL JOIN oeuvre o 
    WHERE l.id_oeuvre=nb_exemplaires.id
    GROUP BY l.id_oeuvre, o.titre;
$$
LANGUAGE SQL;

/*
    Si l'oeuvre est empruntée ou non
*/
CREATE OR REPLACE FUNCTION est_emprunte(id INTEGER) RETURNS BOOLEAN
AS $$
    SELECT EXISTS(
        SELECT 1
        FROM emprunt e
        WHERE est_emprunte.id=e.id_livre
    );
$$
LANGUAGE SQL;

/*
    Livres présents dans la biblio
*/
CREATE OR REPLACE FUNCTION livres_presents() RETURNS SETOF VARCHAR
AS $$
    SELECT o.titre
    FROM livre l NATURAL JOIN oeuvre o
    WHERE est_emprunte(l.id_livre) = FALSE;
$$
LANGUAGE SQL;

/*
    Nombre d'emprunts pour un livre
*/
CREATE OR REPLACE FUNCTION nbre_emprunts(in oeuvre) RETURNS setof record
AS $$
	SELECT $1.titre,COUNT(*) 
	FROM emprunt NATURAL JOIN livre NATURAL JOIN oeuvre
	WHERE id_oeuvre = $1.id_oeuvre;
$$
LANGUAGE SQL;

/*
    Les top des livres les plus empruntés
*/
CREATE OR REPLACE FUNCTION les_plus_empruntes(top INTEGER) RETURNS setof RECORD
AS $$
	SELECT titre,COUNT(titre) 
	FROM oeuvre NATURAL JOIN livre NATURAL LEFT JOIN histoemprunt
	GROUP BY titre ORDER BY COUNT(titre) DESC LIMIT $1;
$$
LANGUAGE SQL;

/*
    Ajout de la colonne 'empruntable'
*/
ALTER TABLE livre DROP COLUMN empruntable
ALTER TABLE livre ADD empruntable BOOLEAN DEFAULT TRUE

