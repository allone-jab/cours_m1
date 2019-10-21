/* Doubler l'amende d'un alternant */

CREATE FUNCTION double(a adherent) returns INTEGER 
as 'select a.amende_adherent * 2;'
LANGUAGE sql;