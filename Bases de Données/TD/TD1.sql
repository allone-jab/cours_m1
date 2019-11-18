/*  */

/* Date d'un article donné par son identifiant */
CREATE OR REPLACE FUNCTION getDate(id_article INTEGER) RETURNS DATE
AS $$
    SELECT date_debut_etat 
    FROM histo_article
    WHERE id_article = $1
$$
LANGUAGE SQL;

/* Vérifier si un article est en ligne */
CREATE OR REPLACE FUNCTION isOnline(id INTEGER) RETURNS BOOLEAN
AS $$
    BEGIN
        PERFORM * FROM histo_article h NATURAL JOIN etat e WHERE h.id_article = $1 AND e.nom_etat = "en ligne" AND date_fin_etat = NULL;
        RETURN FOUND;
    END
$$
LANGUAGE PLPGSQL;

/* Articles actuellement en ligne */
CREATE OR REPLACE FUNCTION onlineArticles() RETURNS SETOF RECORD
AS $$
    SELECT * FROM article WHERE isOnline(id_article) = TRUE
$$
LANGUAGE SQL;

/* Première date de mise en ligne d'un article */
CREATE OR REPLACE FUNCTION firstOnlineDate(article article) RETURNS DATE
AS $$
    SELECT MIN(date_debut_etat) FROM histo_article WHERE id_article = $1.id_article AND isOnline($1.id_article) = TRUE;
$$
LANGUAGE PLPGSQL;

/* 5 derniers articles publiés */ 
CREATE OR REPLACE FUNCTION fiveLast() RETURN SETOF article
AS $$
    SELECT *
    FROM onlineArticles() NATURAL JOIN histo_article
    ORDER BY date_debut_etat
    LIMIT 5;
$$
LANGUAGE SQL;