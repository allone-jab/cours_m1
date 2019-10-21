/* Compte le nombre d'emprunts d'un adhérent */

CREATE FUNCTION nb_emprunts(a adherent) returns BIGINT as 
$$
    SELECT COUNT (id_emprunt)
    FROM emprunts
    WHERE no_adherent = a.id_adherent
$$
LANGUAGE sql;