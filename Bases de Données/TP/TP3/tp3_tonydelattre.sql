-- Ex 1
CREATE OR REPLACE FUNCTION maxSeancesSemaine() RETURNS TRIGGER
AS $$
DECLARE
        week INTEGER := ( SELECT id_semaine
                        FROM semaine
                        WHERE CURRENT_DATE >= date_debut AND CURRENT_DATE <= date_fin );
    BEGIN
        PERFORM * FROM abonnesemaine WHERE id_abonne = new.id_abonne;
        if FOUND then
            if ( SELECT COUNT(*)FROM abonneseance NATURAL JOIN seance
                    WHERE id_abonne = new.id_abonne AND id_semaine = week ) = 6 then
              RETURN NULL;
            else
                RETURN new;
            end if;
        else
            RETURN NULL;
        end if;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER max_seances_semaine_6 on abonneseance;

CREATE TRIGGER max_seances_semaine_6
BEFORE INSERT OR UPDATE
ON abonneseance FOR EACH ROW
EXECUTE PROCEDURE maxSeancesSemaine();

-- INSERT INTO abonneseance VALUES (3,36);
-- INSERT INTO abonneseance VALUES (3,37);

-- Ex 2
CREATE OR REPLACE function checkAge() RETURNS TRIGGER
AS $$
    BEGIN
        if new.age < 16 then
            RETURN NULL;
        elsif new.age > 99 then
            new.age = 99;
        end if;
        RETURN new;
        END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ageCheck
BEFORE INSERT OR UPDATE
ON abonne FOR EACH ROW
EXECUTE PROCEDURE checkAge();

-- Ex 3
CREATE OR REPLACE FUNCTION checkLimitSalle() RETURNS TRIGGER
AS $$

$$ LANGUAGE PLPGSQL;

CREATE TRIGGER quotaSalle
BEFORE INSERT OR UPDATE
ON reservation FOR EACH ROW
EXECUTE PROCEDURE checkLimitSalle();

-- Ex 4

-- Ex 5
