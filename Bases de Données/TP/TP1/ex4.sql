
CREATE OR REPLACE FUNCTION nbre_emprunts(id INTEGER) RETURNS BIGINT
AS $$
    SELECT COUNT(o.id_oeuvre)
    FROM oeuvre o NATURAL JOIN emprunt e
    WHERE nbre_emprunts.id=o.id_oeuvre
    GROUP BY o.titre, o.id_oeuvre
$$
LANGUAGE SQL;