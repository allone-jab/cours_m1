
/* Chiffre d'affaires pour une catégorie */
CREATE OR REPLACE FUNCTION chiffreaffaires(id INTEGER) RETURNS INTEGER
AS $$
	DECLARE 
		curr record;
		j_loc INTEGER := 0;
		curs cursor FOR SELECT * FROM contrat NATURAL JOIN voiture WHERE id_categorie = $1;
		prix_jour INTEGER := (select prix_par_jour from categorie where id_categorie = $1);
	BEGIN
		FOR curr in curs
		loop
		  if curr.id_etat = 3 then
			j_loc := j_loc + (curr.date_fin - curr.date_debut);
		  end if;
		end loop;
		RETURN j_loc * prix_jour;
	END
$$
LANGUAGE PLPGSQL;

/* Classification du chiffre d'affaires d'une catégorie */
CREATE OR REPLACE FUNCTION evalca(id INTEGER) RETURNS TEXT
AS $$
	DECLARE
		ca INTEGER := chiffre_affaires($1);
	BEGIN
	  if ca = 0 then
		RETURN 'inexistant';
	  elsif ca < 500 then
		RETURN 'faible';
	  elsif ca < 1000 then
		RETURN 'moyen';
	  else 
		RETURN 'bon';
	  end if;
	END
$$
LANGUAGE PLPGSQL;

/* COmpte rendu catégorie */
CREATE OR REPLACE FUNCTION ca_categorie(id INTEGER) RETURNS SETOF RECORD
AS $$
	begin
	  
	end;
$$
LANGUAGE PLPGSQL;