
CREATE OR REPLACE FUNCTION est_emprunte(id INTEGER) RETURNS BOOLEAN
AS $$
    SELECT EXISTS(
        SELECT 1
        FROM emprunt e
        WHERE est_emprunte.id=e.id_livre
    );
$$
LANGUAGE SQL;