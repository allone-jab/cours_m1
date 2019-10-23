/* sudo -u postgres psql postgres */

CREATE OR REPLACE FUNCTION nb_exemplaires(l livre) RETURNS SETOF RECORD 
AS $$
    SELECT * FROM livre;
$$
LANGUAGE SQL;

