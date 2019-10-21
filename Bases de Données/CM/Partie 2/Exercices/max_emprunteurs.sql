INCLUDE "./nb_emprunts.sql"

/* Les plus gros emprunteurs */

CREATE FUNCTION max_emprunteur() returns SETOF adherent AS
$$
    SELECT a.* FROM adherents a JOIN emprunt
    GROUP BY id_adherent
    HAVING COUNT(id_adherent) >= (SELECT MAX(adherent.nb_emprunts) FROM adherent);
$$ LANGUAGE sql;