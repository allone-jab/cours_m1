/* Débiter un compte bancaire et retourner la nouvelle valeur */

CREATE FUNCTION debiter(no_compte INTEGER, val NUMERIC) return INTEGER AS
$$
    UPDATE COMPUTE
        SET solde = solde - val
        WHERE no_compte = debiter.no_compte
    RETURNING solde;
$$
LANGUAGE sql;
