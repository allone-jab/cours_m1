/* 1 */
CREATE FUNCTION max_emprunts_3() RETURNS TRIGGER
AS $$
    DECLARE
        nb_emp INTEGER := SELECT count(*) FROM emprunt WHERE id_adherent = new.id_adherent
    BEGIN
        IF nb_emp < 3 THEN
          return NEW;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER max_emprunt() BEFORE INSERT OR UPDATE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE max_emprunts_3();

/* 2 */
CREATE FUNCTION isBorrowed() RETURNS TRIGGER
AS $$
    BEGIN
        PERFORM * FROM emprunt WHERE id_livre = new.id_livre
        IF FOUND THEN
            return NEW;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER disponibility BEFORE INSERT OR UPDATE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE isBorrowed();

/* 3 */
CREATE FUNCTION maj_histo() return TRIGGER
AS $$ 
    IF date_emprunt = CURRENT_DATE THEN
        RETURN NULL;
    END IF;
    insert into histoemprunt (id_adherent, id_livre, date_emprunt, date_retour)
    values (old.id_adherent, old.id_livre, old.date_emprunt, CURRENT_DATE)
$$ LANGUAGE plpgsql;

CREATE TRIGGER retour BEFORE DELETE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE maj_histo();

/* 4 */
CREATE FUNCTION peutEmprunter() RETURNS TRIGGER
AS $$
    BEGIN
        PERFORM * FROM emprunt e, adherent a WHERE id_adherent = new.id_adherent AND (CURRENT_DATE < e.date_emprunt+21 OR a.amende_adherent > 0)
        IF FOUND THEN
            RETURN NEW;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emprunt BEFORE INSERT
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE peutEmprunter();

/* 5 */
CREATE FUNCTION retard() RETURNS TRIGGER
AS $$ 
    DECLARE 
        dec INTEGER := new.date_emprunt - new.date_retour;
    BEGIN
        UPDATE adherent
           SET amende_adherent= amende_adherent + (dec%7)*2
         WHERE id_adherent = new.id_adherent
    END;

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
    BEGIN
        FOR rec IN curs 
        LOOP
            rec.id_livre = NULL;
        END LOOP;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER livresuppr AFTER DELETE
ON livre FOR EACH ROW
EXECUTE PROCEDURE majHisto();

/* 7 */
CREATE FUNCTION checkDelete() RETURNS TRIGGER
AS $$
    BEGIN
        IF old.id_livre = NULL THEN
            RETURN old;
        elsIF old.date_retour = old.date_emprunt THEN
            RETURN old;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER suppHistoEmp BEFORE DELETE
ON histoemprunt FOR EACH ROW
EXECUTE PROCEDURE checkDelete();

/* 8 */
ALTER TABLE livre ADD sorti BOOLEAN DEFAULT FALSE;

/* 9 */
CREATE FUNCTION majSorti() RETURNS TRIGGER
AS $$
    IF sorti = TRUE THEN
        UPDATE livre
        SET sorti = FALSE
        WHERE id_livre = old.id_livre
    else
        UPDATE livre
        SET sorti = TRUE
        WHERE id_livre = old.id_livre
    END IF;
    
$$ LANGUAGE plpgsql;

CREATE TRIGGER updateDispoLivre AFTER INSERT, DELETE
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE majSorti();

/* 10 */
ALTER TABLE livre ADD reserve_adh BOOLEAN DEFAULT FALSE;

/* 11 */
CREATE FUNCTION isReserved() RETURNS TRIGGER
AS $$
    if condition then
      
    else
      
    end if;
$$ LANGUAGE plpgsql;

CREATE TRIGGER empruntreserve AFTER INSERT
ON emprunt FOR EACH ROW
EXECUTE PROCEDURE isReserved();