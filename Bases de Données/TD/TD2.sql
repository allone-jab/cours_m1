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
        PERFORM * from emprunt where id_livre = new.id_livre
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
    if date_emprunt != CURRENT_DATE then
        insert into histoemprunt (id_adherent, id_livre, date_emprunt, date_retour)
        values (old.id_adherent, old.id_livre, old.date_emprunt, CURRENT_DATE)
    end if;
$$ LANGUAGE plpgsql;

CREATE TRIGGER retour BEFORE DELETE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE maj_histo();

/* 4 */
CREATE FUNCTION peutEmprunter() RETURNS TRIGGER
as $$
    BEGIN
        PERFORM * FROM emprunt e, adherent a WHERE id_adherent = new.id_adherent AND (CURRENT_DATE < e.date_emprunt+21 OR a.amende_adherent > 0)
        if FOUND then
            RETURN NEW;
        end if;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emprunt BEFORE INSERT
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE peutEmprunter();

/* 5 */
CREATE FUNCTION retard() RETURNS TRIGGER
AS $$ 
    DECLARE 
        dec INTEGER := DATEDIFF(day, new.date_retour, new.date_emprunt)
    begin
        update adherent
           set amende_adherent= amende_adherent + (dec%7)*2
         where id_adherent = new.id_adherent
    end;

$$ LANGUAGE plpgsql;

CREATE TRIGGER amende AFTER INSERT
ON histoemprunt FOR EACH ROW
EXECUTE PROCEDURE retard();

/* 6 */
CREATE FUNCTION majHisto() RETURNS TRIGGER
AS $$
    DECLARE
        curs CURSOR FOR SELECT * FROM histoemprunt WHERE id_livre = old.id_livre;
        rec RECORD;
    begin
        FOR rec IN curs 
        LOOP
            rec.id_livre = null;
        END LOOP;
    end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER livresuppr AFTER DELETE
ON livre FOR EACH ROW
EXECUTE PROCEDURE majHisto()

/* 7 */
CREATE FUNCTION checkDelete() RETURNS TRIGGER
AS $$
    if old.id_livre = null then
        RETURN old;
    elsif old.date_retour = old.date_emprunt then
        RETURN old;
    end if;
$$ LANGUAGE plpgsql;

CREATE TRIGGER suppHistoEmp BEFORE DELETE
ON histoemprunt FOR EACH ROW
EXECUTE PROCEDURE checkDelete();

/* 8 */
ALTER TABLE livre ADD sorti BOOLEAN DEFAULT FALSE;

/* 9 */
CREATE FUNCTION majSorti() RETURNS TRIGGER
AS $$
    if sorti = TRUE then
        update livre
        set sorti = FALSE
        where id_livre = old.id_livre
    else
        update livre
        set sorti = TRUE
        where id_livre = old.id_livre
    end if;
    
$$ LANGUAGE plpgsql;

CREATE TRIGGER livreSort AFTER INSERT, DELETE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE majSorti();

/* 10 */
