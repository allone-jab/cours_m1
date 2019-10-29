
CREATE OR REPLACE FUNCTION livres_presents() RETURNS SETOF VARCHAR
AS $$
    SELECT o.titre
    FROM livre l NATURAL JOIN oeuvre o
    WHERE est_emprunte(l.id_livre) = FALSE;
$$
LANGUAGE SQL;