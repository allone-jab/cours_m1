/* sudo -u postgres psql postgres */

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

