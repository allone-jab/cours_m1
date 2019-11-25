/* 1 */
CREATE FUNCTION max_emprunts_3() RETURNS TRIGGER
AS $$
    DECLARE
        nb_emp INTEGER := select count(*) from emprunt where id_adherent = new.id_adherent
    begin
        if nb_emp < 3 then
          return NEW;
        end if;
    end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER max_emprunt() BEFORE INSERT OR UPDATE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE max_emprunts_3();

/* 2 */
CREATE FUNCTION isBorrowed() RETURNS TRIGGER
AS $$
    BEGIN
        select * from emprunt where id_livre = new.id_livre
        if FOUND then
            return NEW;
        end if;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER disponibility BEFORE INSERT OR UPDATE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE isBorrowed();

/* 3 */
CREATE FUNCTION maj_histo() return TRIGGER
AS $$ 
    insert into histoemprunt (id_adherent, id_livre, date_emprunt, date_retour)
    values (old.id_adherent, old.id_livre, old.date_emprunt, TG_WHEN)
$$ LANGUAGE plpgsql;

CREATE TRIGGER retour BEFORE DELETE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE maj_histo();

/* 4 */
